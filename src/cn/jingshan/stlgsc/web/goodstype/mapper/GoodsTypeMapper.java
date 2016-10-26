package cn.jingshan.stlgsc.web.goodstype.mapper;

import java.util.List;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.web.goodstype.po.GoodsType;

public interface GoodsTypeMapper {
    int deleteByPrimaryKey(String id);

    int insert(GoodsType record);

    int insertSelective(GoodsType record);

    GoodsType selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(GoodsType record);

    int updateByPrimaryKey(GoodsType record);
    
    //
    CountNum selectCount();
    
    List<GoodsType> queryByPaging(PageParameter pager);
    
    GoodsType queryByName(String id);
    
    int deleteBatch(List<String> id);
}