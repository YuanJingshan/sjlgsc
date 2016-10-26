package cn.jingshan.stlgsc.web.receiver.mapper;

import cn.jingshan.stlgsc.web.receiver.po.Receiver;

public interface ReceiverMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Receiver record);

    int insertSelective(Receiver record);

    Receiver selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Receiver record);

    int updateByPrimaryKey(Receiver record);
}