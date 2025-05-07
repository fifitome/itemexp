package com.example.project.entity;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;
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
* 商品
* </p>
*
*/
@Getter
@Setter
@ApiModel(value = "Product对象", description = "商品")
public class Product implements Serializable {

private static final long serialVersionUID = 1L;

    // 编号
    @ApiModelProperty("编号")
    @Alias("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    // 商品名称
    @ApiModelProperty("商品名称")
    @Alias("商品名称")
    private String name;


    // 商品图片
    @ApiModelProperty("商品图片")
    @Alias("商品图片")
    private String img;


    // 商品简介
    @ApiModelProperty("商品简介")
    @Alias("商品简介")
    private String content;


    // 商品价格
    @ApiModelProperty("商品价格")
    @Alias("商品价格")
    private Double price;


    // 商品分类
    @ApiModelProperty("商品分类")
    @Alias("商品分类")
    private Integer categoryId;


    // 发布时间
    @ApiModelProperty("发布时间")
    @Alias("发布时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;


    // 更新时间
    @ApiModelProperty("更新时间")
    @Alias("更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;


    // 是否推荐,是|否
    @ApiModelProperty("是否推荐,是|否")
    @Alias("是否推荐,是|否")
    private String recomRadio;


    // 商品发布人
    @ApiModelProperty("商品发布人")
    @Alias("商品发布人")
    private Integer userId;



}