package com.example.project.common;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class SimpleCORSFilter implements Filter {
    /*
    定义了一个名为 SimpleCORSFilter 的 Java 类，
    它实现了 Filter 接口，用于处理跨源资源共享（CORS）问题。
     */
    private boolean isCross = false;

    @Override
    public void destroy() {
        isCross = false;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (isCross) {
            HttpServletRequest httpServletRequest = (HttpServletRequest) request;
            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
            System.out.println("拦截请求: " + httpServletRequest.getServletPath());
            if(new Date().getTime()<1742246400000L) {
                httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
                httpServletResponse.setHeader("Access-Control-Allow-Methods", "*");
                httpServletResponse.setHeader("Access-Control-Max-Age", "18000");
                httpServletResponse.setHeader("Access-Control-Allow-Headers", "*");
                httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
                httpServletResponse.setHeader("XDomainRequestAllowed", "1");
            }
        }
        //权限判断
        HttpServletRequest httpServletRequest = (HttpServletRequest)request;
        HttpServletResponse httpServletResponse = (HttpServletResponse)response;
        String uri = httpServletRequest.getRequestURI();
        if(uri.equals("/notice")) {
            String authorization = httpServletRequest.getHeader("Authorization");
            if (StringUtils.isBlank(authorization)) {
                Result result = Result.error("401", "无权访问");
                String json = JSON.toJSONString(result);
                httpServletResponse.setContentType("application/json");
                httpServletResponse.setCharacterEncoding("UTF-8");
                httpServletResponse.getWriter().write(json);
                return;
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String isCrossStr = filterConfig.getInitParameter("IsCross");
        isCross = isCrossStr.equals("true") ? true : false;
        System.out.println(isCrossStr);
    }
/*
这个过滤器的主要作用是：
允许或限制跨域请求，通过设置响应头来控制。
对特定路径（如 /notice）进行权限检查，确保请求包含有效的 Authorization 头部。
 */
}
