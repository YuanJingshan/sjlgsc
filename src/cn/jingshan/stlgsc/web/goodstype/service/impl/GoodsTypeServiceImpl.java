package cn.jingshan.stlgsc.web.goodstype.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.FailedResponse;
import cn.jingshan.stlgsc.common.page.ObjectResponse;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.common.page.SuccessResponse;
import cn.jingshan.stlgsc.web.goodstype.mapper.GoodsTypeMapper;
import cn.jingshan.stlgsc.web.goodstype.po.GoodsType;
import cn.jingshan.stlgsc.web.goodstype.service.GoodsTypeService;

/**
 * <p>Description: 商品类别service实现</p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-22
 * @vession 1.0.0
 */
@Service(value="goodsTypeService")
public class GoodsTypeServiceImpl implements GoodsTypeService {
	
	@Autowired
	private GoodsTypeMapper goodsTypeMapper;

	public CountNum getCount() {
		CountNum countNum = goodsTypeMapper.selectCount();
		if (countNum == null) {
			countNum = new CountNum();
		}
		return countNum;
	}

	public List<GoodsType> queryByPaging(PageParameter pager) {
		return goodsTypeMapper.queryByPaging(pager);
	}

	public Response save(GoodsType goodsType) {
		try {
			GoodsType object = goodsTypeMapper.queryByName(goodsType.getName());
			if (object != null) {
				return new FailedResponse("商品类别信息已存在！");
			} 
			goodsTypeMapper.insert(goodsType);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("添加商品类别失败！");
		}
	}

	public Response queryById(String id) {
		try {
			return new ObjectResponse<GoodsType>(goodsTypeMapper.selectByPrimaryKey(id));
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("查询商品类别失败！");
		}
	}

	public Response delete(String id) {
		try {
			goodsTypeMapper.deleteByPrimaryKey(id);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("删除失败！");
		}
	}

	public Response deleteBatch(List<String> ids) {
		try {
			goodsTypeMapper.deleteBatch(ids);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("删除失败！");
		}
	}

	public Response update(GoodsType goodsType) {
		try {
			goodsTypeMapper.updateByPrimaryKey(goodsType);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("更新失败！");
		}
	}
}
