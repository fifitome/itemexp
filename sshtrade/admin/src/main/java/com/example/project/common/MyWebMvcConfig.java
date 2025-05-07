package com.example.project.common;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

/**
 * web配置
 */
@Configuration
//声明这个类为 Spring 的配置类。
public class MyWebMvcConfig extends WebMvcConfigurationSupport {
    //java配置类，自定义 Spring MVC 的配置。
    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        // 注册 Sa-Token 拦截器，校验规则为 StpUtil.checkLogin() 登录校验。
        registry.addInterceptor(new SaInterceptor(handle -> StpUtil.checkLogin()))
                .addPathPatterns("/**")
                .excludePathPatterns("/", "/login", "/register", "/email", "/password/reset", "/file/download/**", "/**/export")
                .excludePathPatterns("/swagger**/**", "/webjars/**", "/v3/**", "/doc.html", "/favicon.ico");  // 排除 swagger拦截
    }
    /*
    注册 SaInterceptor，这是一个安全拦截器，用于处理登录校验。
设置拦截路径为所有路径（"/**"），但排除了一些特定的路径，如登录、注册、邮箱处理、密码重置、文件下载、导出等。
排除 Swagger 相关路径，以确保 Swagger 文档能够正常访问。

     */

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        /*
        添加资源处理器。
配置 Swagger UI 的资源处理器，使得 Swagger UI 能够正确访问。
         */
        registry.
                addResourceHandler("/swagger-ui/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/springfox-swagger-ui/")
                .resourceChain(false);
    }

    @Override
    protected void addViewControllers(ViewControllerRegistry registry) {
        registry.addRedirectViewController("/swagger-ui/", "/swagger-ui/index.html");
    }
    /*
    添加视图控制器。
配置 Swagger UI 的重定向，将 /swagger-ui/ 重定向到
     */
}
/*
在 Spring Boot 中，WebMvcConfigurationSupport 类是一个抽象类，它提供了一些默认的配置，包括拦截器的配置。
通过继承 WebMvcConfigurationSupport 类，你可以根据自己的需求，覆盖或扩展这些默认配置。
 */
/*
通过 SaInterceptor 提供的安全拦截器来保护应用的路由，确保用户在访问特定资源前已经登录。
配置 Swagger UI 的资源和视图，以便能够通过 Swagger UI 访问和测试 API 文档。
排除一些不需要登录校验的路径，如登录、注册等公开接口。
 */

