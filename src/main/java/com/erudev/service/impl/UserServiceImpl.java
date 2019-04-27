package com.erudev.service.impl;

import com.erudev.mapper.UserMapper;
import com.erudev.model.User;
import com.erudev.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void deleteByUserId(Integer id) {
        userMapper.deleteByUserId(id);
    }

    @Override
    public User findByUserId(Integer id) {
        return userMapper.findByUserId(id);
    }

    @Override
    public void updateUser(Integer id) {
        userMapper.updateUser(id);
    }

    @Override
    public List<User> selectAll() {
        List<User> userList = userMapper.findAll();
        return userList;
    }

    @Override
    public List<User> findByNameOrPhone(String name, String phone) {
        return userMapper.findByNameOrPhone(name, phone);
    }
}
