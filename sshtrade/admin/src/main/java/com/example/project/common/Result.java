package com.example.project.common;

import lombok.AllArgsConstructor;
import lombok.Data;
/*
Lombok 注解，用于简化类的编写，自
动生成构造方法、getter/setter 方法和 toString 方法。
 */
import lombok.NoArgsConstructor;

import java.io.Serializable;
/*
Java 序列化接口，用于对象的序列化和反序列化。
 */

/*
定义了一个名为 Result 的 Java 类，用于作为接口的统一返回包装类。
 */
@Data
/*
Lombok 提供的注解
，自动为类生成 getter/setter 方法、toString、equals、hashCode 方法。
 */
@NoArgsConstructor
@AllArgsConstructor
/*
Lombok 提供的注解，分别生成无参构造方法和全参构造方法。
 */
public class Result implements Serializable {
    private static final long serialVersionUID = 42L;
    //用于序列化时保持版本的一致性。
    private static final String CODE_SUCCESS = "200";
    private static final String CODE_SYS_ERROR = "500";
    /*
    定义了成功和系统错误的返回码常量。
     */

    private String code;
    private String msg;
    private Object data;

    public static Result success() {
        return new Result(CODE_SUCCESS, "操作成功", null);
    }

    public static Result success(Object data) {
        return new Result(CODE_SUCCESS, "操作成功", data);
    }

    public static Result error(String code, String msg) {
        return new Result(code, msg, null);
    }

    public static Result error(String msg) {
        return new Result(CODE_SYS_ERROR, msg, null);
    }

    public static Result error() {
        return new Result(CODE_SYS_ERROR, "系统错误", null);
    }
/*
这个类的主要作用是标准化 API 接口的返回格式，使得前端可以统一处理返回结果，
同时提供了一系列静态方法来方便地创建成功或错误的响应对象。
 */
}
