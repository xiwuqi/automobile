package com.wuxi.ads.mapper;

import com.wuxi.ads.bean.CarModel;

public interface CarModelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CarModel record);

    int insertSelective(CarModel record);

    CarModel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CarModel record);

    int updateByPrimaryKeyWithBLOBs(CarModel record);

    int updateByPrimaryKey(CarModel record);
}