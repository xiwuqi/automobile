package com.wuxi.ads;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@MapperScan(value = "com.wuxi.ads.mapper")
public class AutoDisplayApplication {

    public static void main(String[] args) {
        SpringApplication.run(AutoDisplayApplication.class, args);
    }
}
