package com.wuxi.ads.mapper;

import com.wuxi.ads.bean.CarConfig;

public interface CarConfigMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CarConfig record);

    int insertSelective(CarConfig record);

    CarConfig selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CarConfig record);

    int updateByPrimaryKey(CarConfig record);
}