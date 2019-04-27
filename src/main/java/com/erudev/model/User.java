package com.erudev.model;

import lombok.Data;

/***
 * @author erudev
 * user
 */
@Data
public class User {
    private Integer id;

    private String name;

    private String phone;

    private String address;

    private String remark;
}
