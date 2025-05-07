package com.example.project.controller.domain;

import com.example.project.entity.Permission;
import com.example.project.entity.User;
//分别代表权限和用户实体。
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;
/*
 文件定义了一个名为 LoginDTO 的 Java 类，
 用于封装登录相关的数据传输对象（DTO）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LoginDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private User user;
    private String token;
    private List<Permission> menus;
    private List<Permission> auths;
}
/*
在用户登录成功后，封装用户的基本信息、令牌以及权限信息，以便在应用中传递和使用。
提供一个方便的数据结构，用于在登录过程中和登录后的用户会话管理
 */