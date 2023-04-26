package com.wuxi.ads.mapper;

import com.wuxi.ads.bean.CarSeries;

public interface CarSeriesMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CarSeries record);

    int insertSelective(CarSeries record);

    CarSeries selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CarSeries record);

    int updateByPrimaryKey(CarSeries record);
}