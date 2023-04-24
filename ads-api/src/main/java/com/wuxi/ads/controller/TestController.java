package com.wuxi.ads.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/test")
public class TestController {
    @RequestMapping(method = RequestMethod.GET, value = "/hello")
    public String hello() {
        return "Hello, World!";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/greet")
    public String greet(String name) {
        return "Hello, " + name + "!";
    }
}
