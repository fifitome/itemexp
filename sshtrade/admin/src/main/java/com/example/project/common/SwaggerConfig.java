package com.example.project.common;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * <p>
 * 访问路径：http://localhost:9090/swagger-ui/index.html
 * </p>
 */

//一个 Java 配置类，用于配置 Swagger，这是一个 API 文档生成工具。

@Configuration
public class SwaggerConfig extends WebMvcConfigurationSupport {
//继承自 Spring MVC 的配置支持类。

    @Bean
    public Docket createRestAPI() {
        //定义了一个 Docket Bean，这是 Swagger 的核心配置。
        return new Docket(DocumentationType.OAS_30)
                //指定 Swagger 文档的类型为 OpenAPI 3.0 版本。
                .apiInfo(apiInfo())
                //设置 API 信息
                .select()
                //选择哪些 API 暴露给 Swagger
                .apis(RequestHandlerSelectors.basePackage("com.example.project.controller"))
                //指定扫描的包路径，只暴露该包下的控制器中的 API。
                .paths(PathSelectors.any())
                //暴露所有路径的 API。
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("RestAPI接口文档")
                .description("Restful 后台接口汇总")
                .contact(new Contact("校园淘购后台", "https://5w.fit/fogXs", "xqnode@qq.com"))
                .version("1.0")
                .build();
        /**
         * 这个配置类的主要作用是：
         * 定义 Swagger 文档的基本配置，包括文档类型、API 信息、控制器扫描路径等。
         * 提供一个访问 Swagger UI 的入口点，用户可以通过这个 URL 访问和查看 API 文档：http://localhost:9090/swagger-ui/index.html（假设应用运行在 9090 端口）。
         * 通过这个配置，开发者可以方便地生成和查看 API 文档，提高开发效率和 API 的可维护性
         */
    }

}
