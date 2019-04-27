package com.erudev.controller;

import com.erudev.exception.MyException;
import com.erudev.model.User;
import com.erudev.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String index(Model model){
        List<User> userList = userService.selectAll();
        model.addAttribute("users", userList);
        return "index";
    }

    @RequestMapping("/add")
    public String addUser(){
        return "add";
    }

    @RequestMapping(value = "/toAdd", method = RequestMethod.POST)
    @ResponseBody
    public User toAddUser(@RequestBody User user, Model model) throws MyException {
        if (null == user || "".equals(user)){
            model.addAttribute("msg", "保存客户信息失败");
            throw new MyException(-1, "用户不能为空");
        }
        User u = new User();
        u.setName(user.getName());
        u.setAddress(user.getAddress());
        u.setPhone(user.getPhone());
        u.setRemark(user.getRemark());

        userService.addUser(u);
        model.addAttribute("msg", "保存客户信息成功");
        return user;
    }

    @RequestMapping(value = "/del")
    public String delUser(@RequestParam(value = "userId") String userId, Model model){
        Integer id = Integer.valueOf(userId);
        if (id > 0){
            userService.deleteByUserId(id);
            return "redirect:/";
        }
        model.addAttribute("msg", "删除失败");
        return "index";
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam(value = "userId") String userId,
                       Model model) throws MyException {
        Integer id = Integer.valueOf(userId);
        User user = userService.findByUserId(id);
        if (null == user){
            throw new MyException(-3, "该用户不存在");
        }
        if (id > 0){
            model.addAttribute("user", user);
            return "edit";
        }else {
            model.addAttribute("msg", "编辑失败");
            return "redirect:/";
        }
    }

    @RequestMapping("/toEdit")
    @ResponseBody
    public User editUser(@RequestBody User user, Model model) throws MyException {
        if (null == user || "".equals(user)){
            model.addAttribute("msg", "编辑客户信息失败");
            throw new MyException(-2, "编辑用户失败");
        }
        userService.updateUser(user.getId());
        return null;
    }

    @RequestMapping("/search")
    public String getUsers(@RequestParam("name") String name,
                               @RequestParam("phone") String phone, Model model) throws MyException {
        List<User> userList = userService.findByNameOrPhone(name, phone);
        if (null == userList || userList.size() < 0){
            model.addAttribute("msg", "查询客户信息失败");
            throw new MyException(-10, "查询用户失败");
        }
        model.addAttribute("users", userList);
        return "redirect:/";
    }
}
