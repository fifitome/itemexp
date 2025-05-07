package com.example.project.entity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import cn.hutool.core.annotation.Alias;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.example.project.common.LDTConfig;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

/**
* <p>
* 收货地址
* </p>
*/
@Getter
@Setter
@ApiModel(value = "Address对象", description = "收货地址")
public class Address implements Serializable {

private static final long serialVersionUID = 1L;

    // 收货地址编号
    @ApiModelProperty("收货地址编号")
    @Alias("收货地址编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    // 姓名
    @ApiModelProperty("姓名")
    @Alias("姓名")
    private String name;


    // 手机
    @ApiModelProperty("手机")
    @Alias("手机")
    private String phone;


    // 详细地址
    @ApiModelProperty("详细地址")
    @Alias("详细地址")
    private String address;


    // 邮编
    @ApiModelProperty("邮编")
    @Alias("邮编")
    private String postcode;


    // 用户编号
    @ApiModelProperty("用户编号")
    @Alias("用户编号")
    private Integer userId;


    // 是否默认
    @ApiModelProperty("是否默认")
    @Alias("是否默认")
    private String defaultRadio;



}