package cn.jingshan.stlgsc.web.bill.mapper;

import cn.jingshan.stlgsc.web.bill.po.Bill;

public interface BillMapper {
    int deleteByPrimaryKey(String id);

    int insert(Bill record);

    int insertSelective(Bill record);

    Bill selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Bill record);

    int updateByPrimaryKey(Bill record);
}