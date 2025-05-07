package com.example.project.common.annotation;
import java.lang.annotation.*;
/**
 * 定义一个用于方法的日志注解，可以在方法上使用此注解来记录自定义的日志信息
 * 主要用于记录方法的执行信息，如开始执行、执行结束、执行结果等
 * 该注解的存在使得日志记录更加灵活和可配置，减少了手动编写日志代码的繁琐
 */
@Target(ElementType.METHOD)
//指定该注解只能应用于方法。
@Retention(RetentionPolicy.RUNTIME)
//使用 @Retention(RetentionPolicy.RUNTIME) 指定该注解在运行时可见。
@Documented
//文档化：使用 @Documented 使该注解在生成的Javadoc文档中可见。
public @interface AutoLog {
   //定义了一个 value 属性，用于指定日志内容，默认为空字符串。
    /**
     * 注解的默认值，表示日志的内容
     * 可以在使用注解时指定具体的消息，以提供更多上下文信息
     * 默认为空字符串，即如果不指定，则不会记录任何日志信息
     *
     * @return 日志的内容，默认为空字符串
     */
    String value() default "";
}
