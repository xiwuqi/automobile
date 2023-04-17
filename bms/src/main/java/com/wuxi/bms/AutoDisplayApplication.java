package com.wuxi.bms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class AutoDisplayApplication {

    public static void main(String[] args) {
        SpringApplication.run(AutoDisplayApplication.class, args);
    }
}
