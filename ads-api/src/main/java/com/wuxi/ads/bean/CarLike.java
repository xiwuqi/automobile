package com.wuxi.ads.bean;

import org.springframework.stereotype.Component;

@Component
public class CarLike {
    private Integer likeid;
    private Integer userid;
    private Integer modelid;

    public Integer getLikeid() {
        return likeid;
    }

    public void setLikeid(Integer likeid) {
        this.likeid = likeid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getModelid() {
        return modelid;
    }

    public void setModelid(Integer modelid) {
        this.modelid = modelid;
    }
}
