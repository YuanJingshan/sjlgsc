package cn.jingshan.stlgsc.web.billgoods.mapper;

import cn.jingshan.stlgsc.web.billgoods.po.BillGoods;

public interface BillGoodsMapper {
    int insert(BillGoods record);

    int insertSelective(BillGoods record);
}