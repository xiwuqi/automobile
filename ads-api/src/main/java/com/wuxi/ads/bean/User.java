package com.wuxi.ads.bean;


import org.springframework.stereotype.Component;

@Component
public class User {
    private Integer userid;
    private String username;
    private String password;
    private Byte role;  // 三重模式，0：经理，1：管理员，2：游客，为后期加上工作流做准备

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Byte getRole() {
        return role;
    }

    public void setRole(Byte role) {
        this.role = role;
    }
}