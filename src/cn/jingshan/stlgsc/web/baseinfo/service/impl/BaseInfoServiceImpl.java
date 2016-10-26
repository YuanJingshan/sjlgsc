package cn.jingshan.stlgsc.web.baseinfo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.FailedResponse;
import cn.jingshan.stlgsc.common.page.ObjectResponse;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.common.page.SuccessResponse;
import cn.jingshan.stlgsc.web.baseinfo.mapper.BaseInfoMapper;
import cn.jingshan.stlgsc.web.baseinfo.po.BaseInfo;
import cn.jingshan.stlgsc.web.baseinfo.service.BaseInfoService;

/**
 * <p>Description: </p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-24
 * @vession 1.0.0
 */
@Service(value="baseInfoService")
public class BaseInfoServiceImpl implements BaseInfoService {
	
	@Autowired
	private BaseInfoMapper baseInfoMapper;

	public CountNum getCount() {
		CountNum count = baseInfoMapper.selectCount();
		if (count == null) {
			count = new CountNum();
		}
		return count;
	}

	public List<BaseInfo> getByPaging(PageParameter pager) {
		return baseInfoMapper.selectBypaing(pager);
	}

	public Response getById(String id) {
		try {
			return new ObjectResponse<BaseInfo>(baseInfoMapper.getById(id));
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("查询基础信息失败！");
		}
	}

	public Response save(BaseInfo baseInfo) {
		try {
			baseInfoMapper.insert(baseInfo);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("添加基础信息失败！");
		}
	}

	public Response delete(String id) {
		try {
			baseInfoMapper.deleteByPrimaryKey(id);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("删除基础信息失败！");
		}
	}

	public Response deleteBatch(List<String> ids) {
		try {
			baseInfoMapper.deleteBatch(ids);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("删除基础信息失败！");
		}
	}

	public Response update(BaseInfo baseInfo) {
		try {
			baseInfoMapper.updateByPrimaryKey(baseInfo);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("修改基础信息失败！");
		}
	}
}
