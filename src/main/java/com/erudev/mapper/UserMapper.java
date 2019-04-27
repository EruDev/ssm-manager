package com.erudev.mapper;

import com.erudev.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    void addUser(User user);

    void deleteByUserId(Integer id);

    User findByUserId(Integer id);

    void updateUser(Integer id);

    List<User> findAll();

    /**
     *
     * @param name
     * @param phone
     * @return
     */
    List<User> findByNameOrPhone(@Param("name") String name,
                                 @Param("phone") String phone);
}
