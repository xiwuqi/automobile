package com.wuxi.ads.mapper;

import com.wuxi.ads.bean.CarLike;

public interface CarLikeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CarLike record);

    int insertSelective(CarLike record);

    CarLike selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CarLike record);

    int updateByPrimaryKey(CarLike record);
}