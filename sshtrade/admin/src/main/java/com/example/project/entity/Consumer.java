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
* 用户
* </p>
*/
@Getter
@Setter
@ApiModel(value = "Consumer对象", description = "用户")
public class Consumer implements Serializable {

private static final long serialVersionUID = 1L;

    // 编号
    @ApiModelProperty("编号")
    @Alias("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    // 登录账户
    @ApiModelProperty("登录账户")
    @Alias("登录账户")
    private String username;


    // 姓名
    @ApiModelProperty("姓名")
    @Alias("姓名")
    private String name;


    // 所属用户
    @ApiModelProperty("所属用户")
    @Alias("所属用户")
    private Integer userId;



}