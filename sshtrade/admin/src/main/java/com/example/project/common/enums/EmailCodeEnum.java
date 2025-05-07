package com.example.project.common.enums;

import lombok.Getter;
@Getter
//定义了一个枚举类 EmailCodeEnum，用于表示不同的邮件验证码类型及其对应的值。
public enum EmailCodeEnum {
    REGISTER("REGISTER", "register:"),
    RESET_PASSWORD("RESETPASSWORD", "resetPassword:"),
    LOGIN("LOGIN", "login:"),
    CHANGE_PASSWORD("CHANGEPASSWORD", "changePassword:"),
    UNKNOWN("", "");
/*
定义了五种邮件验证码类型，每种类型有一个唯一的 type 和 value。
 */
    private final String type;
    //存储枚举实例的类型。
    private final String value;
    //存储枚举实例对应的值
    EmailCodeEnum(String type, String value) {
        //构造函数：用于初始化枚举实例的type和value属性。
        this.type = type;
        this.value = value;
    }

    public static String getValue(String type) {
        //根据提供的type参数，返回对应的value。如果未找到匹配的type，则返回空字符串""
        EmailCodeEnum[] values = values();
        for (EmailCodeEnum codeEnum : values) {
            if (type.equals(codeEnum.type)) {
                return codeEnum.value;
            }
        }
        return "";
    }

    public static EmailCodeEnum getEnum(String type) {
        //根据提供的type参数，返回对应的枚举实例。如果未找到匹配的type，则返回UNKNOWN实例。
        EmailCodeEnum[] values = values();
        for (EmailCodeEnum codeEnum : values) {
            if (type.equals(codeEnum.type)) {
                return codeEnum;
            }
        }
        return UNKNOWN;
    }
}
