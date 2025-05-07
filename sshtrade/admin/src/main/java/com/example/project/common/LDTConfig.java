package com.example.project.common;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;

public class LDTConfig {

/*
文件定义了一个公共类 LDTConfig，它包含两个静态内部类，
用于处理 LocalDateTime 与时间戳之间的序列化和反序列化
 */
    public static class CmzLdtSerializer extends JsonSerializer<LocalDateTime> {
/*
这是一个 JsonSerializer 的实现，
用于将 LocalDateTime 对象序列化成13位的时间戳（毫秒级）。
 */
        @Override
        public void serialize(LocalDateTime value, JsonGenerator gen,
                              SerializerProvider serializers) throws IOException {
            gen.writeNumber(value.toInstant(ZoneOffset.ofHours(8)).toEpochMilli());
        }
    }
    /*
    LocalDateTime.toInstant(ZoneOffset.ofHours(8)).toEpochMilli() 方法
    将 LocalDateTime 转换为北京时间（UTC+8）的时间戳。
     */

    public static class CmzLdtDeSerializer extends JsonDeserializer<LocalDateTime> {
/*
这是一个 JsonDeserializer 的实现，
用于将13位的时间戳（毫秒级）反序列化成 LocalDateTime 对象。
 */
        @Override
        public LocalDateTime deserialize(JsonParser p,
                                         DeserializationContext ctxt) throws IOException {
            long timestamp = p.getLongValue();
            return LocalDateTime.ofEpochSecond(timestamp / 1000, 0, ZoneOffset.ofHours(8));
       /*
       用 LocalDateTime.ofEpochSecond(timestamp / 1000, 0, ZoneOffset.ofHours(8)) 方法
       将时间戳转换为北京时间的 LocalDateTime。
        */
        }
    }
}
/*
这两个内部类提供了在 JSON 序列化和反序列化过程中，
对 LocalDateTime 类型进行自定义处理的能力，确保日期时间以北京时间标准进行存储和解析。
这在处理需要特定时区转换的日期时间数据时非常有用。
 */
