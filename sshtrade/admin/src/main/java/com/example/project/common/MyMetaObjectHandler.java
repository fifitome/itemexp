package com.example.project.common;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {
/*
定义了一个名为 MyMetaObjectHandler 的类，它实现了 MetaObjectHandler 接口，
用于在 MyBatis Plus 框架中自动填充创建时间和更新时间。
 */
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now()); // 起始版本 3.3.0(推荐使用)
        this.strictInsertFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now()); // 配置新增策略
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now()); // 起始版本 3.3.0(推荐)
    }
/*
这个类的作用是在数据表中自动维护创建时间和更新时间字段，确保每次插入和更新记录时，
这些时间字段能够自动更新为当前时间，从而减少手动维护时间字段的工作量。
 */

}
