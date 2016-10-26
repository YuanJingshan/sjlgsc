package cn.jingshan.stlgsc.web.goods.mapper;

import java.util.List;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.web.goods.po.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(String id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

    //
	CountNum selectCount();

	List<Goods> selectByPaging(PageParameter pager);

	int deleteBatch(List<String> ids);
}