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
* 购物车
* </p>
*/
@Getter
@Setter
@ApiModel(value = "Cart对象", description = "购物车")
public class Cart implements Serializable {

private static final long serialVersionUID = 1L;

    // 购物车编号
    @ApiModelProperty("购物车编号")
    @Alias("购物车编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    // 购买用户
    @ApiModelProperty("购买用户")
    @Alias("购买用户")
    private Integer userId;


    // 购买商品
    @ApiModelProperty("购买商品")
    @Alias("购买商品")
    private String name;


    // 数量
    @ApiModelProperty("数量")
    @Alias("数量")
    private Integer num;


    // 单价
    @ApiModelProperty("单价")
    @Alias("单价")
    private Double price;


    // 商品图片
    @ApiModelProperty("商品图片")
    @Alias("商品图片")
    private String img;


    // 产品编号
    @ApiModelProperty("产品编号")
    @Alias("产品编号")
    private Integer goodid;


    // 商品发布人
    @ApiModelProperty("商品发布人")
    @Alias("商品发布人")
    private Integer bizUserId;



}