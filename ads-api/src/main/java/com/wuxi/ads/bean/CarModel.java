package com.wuxi.ads.bean;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class CarModel {
    private Integer modelid;
    private String modelname;
    private String seriesid;
    private Integer modelprice;
    private String modeldesc;
    private String modelimg;
    private Date releasedate;
    private String releasedatestr;

    public Integer getModelid() {
        return modelid;
    }

    public void setModelid(Integer modelid) {
        this.modelid = modelid;
    }

    public String getModelname() {
        return modelname;
    }

    public void setModelname(String modelname) {
        this.modelname = modelname;
    }

    public String getSeriesid() {
        return seriesid;
    }

    public void setSeriesid(String seriesid) {
        this.seriesid = seriesid;
    }

    public Integer getModelprice() {
        return modelprice;
    }

    public void setModelprice(Integer modelprice) {
        this.modelprice = modelprice;
    }

    public String getModeldesc() {
        return modeldesc;
    }

    public void setModeldesc(String modeldesc) {
        this.modeldesc = modeldesc;
    }

    public String getModelimg() {
        return modelimg;
    }

    public void setModelimg(String modelimg) {
        this.modelimg = modelimg;
    }

    public Date getReleasedate() {
        return releasedate;
    }

    public void setReleasedate(Date releasedate) {
        this.releasedate = releasedate;
    }

    public String getReleasedatestr() {
        return releasedatestr;
    }

    public void setReleasedatestr(String releasedatestr) {
        this.releasedatestr = releasedatestr;
    }
}
