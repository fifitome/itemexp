package com.example.project.controller.domain;

import lombok.Data;

@Data
public class UserRequest {
    /*
    定义了一个名为 UserRequest 的 Java 类，用于封装用户请求相关的数据
     */
    private String username;
    private String password;
    private String email;
    private String name;
    private String emailCode;
    //表示用户的电子邮件验证码。
    private String uid;
    //表示用户的唯一标识符
    private String newPassword;
	private String role;
}
/*
作为数据传输对象（DTO），封装用户相关的请求参数，如注册、登录、更新信息等。
提供一个方便的数据结构，用于在用户相关的业务逻辑中传递用户输入的数据。
 */