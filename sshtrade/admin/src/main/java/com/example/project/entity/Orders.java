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
* 订单
* </p>
*/
@Getter
@Setter
@ApiModel(value = "Orders对象", description = "订单")
public class Orders implements Serializable {

private static final long serialVersionUID = 1L;

    // 订单编号
    @ApiModelProperty("订单编号")
    @Alias("订单编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    // 订单号
    @ApiModelProperty("订单号")
    @Alias("订单号")
    private String name;


    // 订单明细
    @ApiModelProperty("订单明细")
    @Alias("订单明细")
    private String content;


    // 订单状态,已下单|已发货|已收货|已评价|已取消
    @ApiModelProperty("订单状态,已下单|已发货|已收货|已评价|已取消")
    @Alias("订单状态,已下单|已发货|已收货|已评价|已取消")
    private String stateRadio;


    // 下单用户
    @ApiModelProperty("下单用户")
    @Alias("下单用户")
    private Integer userId;


    // 总金额
    @ApiModelProperty("总金额")
    @Alias("总金额")
    private Double amount;


    // 下单时间
    @ApiModelProperty("下单时间")
    @Alias("下单时间")
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


    // 产品编号
    @ApiModelProperty("产品编号")
    @Alias("产品编号")
    private String goodids;


    // 商品发布人
    @ApiModelProperty("商品发布人")
    @Alias("商品发布人")
    private Integer bizUserId;



}