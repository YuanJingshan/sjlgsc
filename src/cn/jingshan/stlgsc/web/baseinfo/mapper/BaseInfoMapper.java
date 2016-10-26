package cn.jingshan.stlgsc.web.baseinfo.mapper;

import java.util.List;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.web.baseinfo.po.BaseInfo;

public interface BaseInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(BaseInfo record);

    int insertSelective(BaseInfo record);

    BaseInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BaseInfo record);

    int updateByPrimaryKey(BaseInfo record);

    //
	CountNum selectCount();

	List<BaseInfo> selectBypaing(PageParameter pager);
	
	BaseInfo getById(String id);

	int deleteBatch(List<String> ids);
}