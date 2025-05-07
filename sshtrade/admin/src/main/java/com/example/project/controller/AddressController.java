package com.example.project.controller;

import cn.hutool.core.util.IdUtil;
import cn.hutool.crypto.digest.BCrypt;
import com.example.project.common.annotation.AutoLog;
import cn.hutool.core.date.DateUtil;
import com.example.project.entity.User;
import com.example.project.mapper.UserMapper;
import com.example.project.utils.SessionUtils;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.project.utils.SpringContextUtil;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;
import com.example.project.service.IUserService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.project.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.project.service.IAddressService;
import com.example.project.entity.Address;

import org.springframework.web.bind.annotation.RestController;
/*
包括 Hutool 工具类、Spring MVC 注解、
Spring 框架的资源注解、MyBatis Plus 分页插件等。
 */
/*
* 收货地址 前端控制器
*/
@RestController
@RequestMapping("/address")
public class AddressController {
//是一个 Spring Boot 控制器类，用于处理与收货地址相关的 HTTP 请求。
    @Resource
    private IAddressService addressService;

    @AutoLog("新增收货地址")
    @PostMapping
    public Result save(@RequestBody Address address) {
	

        User user = SessionUtils.getUser();
        address.setUserId(user.getId());
		
        addressService.save(address);
        return Result.success();
    }

    @AutoLog("编辑收货地址")
    @PutMapping
    public Result update(@RequestBody Address address) {
        addressService.updateById(address);


        return Result.success();
    }

    @AutoLog("删除收货地址")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        addressService.removeById(id);
        return Result.success();
    }

    @AutoLog("批量删除收货地址")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        addressService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(addressService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(addressService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Address> queryWrapper = new QueryWrapper<Address>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
		
		//User user = SessionUtils.getUser();  //获取登录用户
		

		
        return Result.success(addressService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Address> list = addressService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Address信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    /**
    * excel 导入
    * @param file
    * @throws Exception
    */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Address> list = reader.readAll(Address.class);

        addressService.saveBatch(list);
        return Result.success();
    }

}
/*
提供了收货地址的增删改查功能。
支持分页查询和条件查询。
支持导出收货地址信息到 Excel 文件。
支持从 Excel 文件批量导入收货地址信息。
这个控制器类的主要作用是处理客户端发来的关于收货地址的 HTTP 请求，
并调用后端服务进行相应的业务处理，最后将处理结果返回给客户端。
 */