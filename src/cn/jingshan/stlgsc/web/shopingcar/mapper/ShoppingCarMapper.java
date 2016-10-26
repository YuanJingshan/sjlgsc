package cn.jingshan.stlgsc.web.shopingcar.mapper;

import cn.jingshan.stlgsc.web.shopingcar.po.ShoppingCar;

public interface ShoppingCarMapper {
    int insert(ShoppingCar record);

    int insertSelective(ShoppingCar record);
}