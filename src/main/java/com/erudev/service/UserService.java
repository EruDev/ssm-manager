package com.erudev.service;


import com.erudev.model.User;

import java.util.List;

public interface UserService {
    void addUser(User user);

    void deleteByUserId(Integer id);

    User findByUserId(Integer id);

    void updateUser(Integer id);

    List<User> selectAll();

    List<User> findByNameOrPhone(String name, String phone);
}
