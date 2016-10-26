package cn.jingshan.stlgsc.web.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.FailedResponse;
import cn.jingshan.stlgsc.common.page.ObjectResponse;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.common.page.SuccessResponse;
import cn.jingshan.stlgsc.web.goods.mapper.GoodsMapper;
import cn.jingshan.stlgsc.web.goods.po.Goods;
import cn.jingshan.stlgsc.web.goods.service.GoodsService;

/**
 * <p>Description: </p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-23
 * @vession 1.0.0
 */
@Service(value="goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	public CountNum getCount() {
		CountNum countNum = goodsMapper.selectCount();
		if (countNum == null) {
			countNum = new CountNum();
		}
		return countNum;
	}

	public List<Goods> queryByPaging(PageParameter pager) {
		return goodsMapper.selectByPaging(pager);
	}

	public Response save(Goods goods) {
		try {
			goodsMapper.insert(goods);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("添加商品失败！");
		}
	}

	public Response delete(String id) {
		try {
			goodsMapper.deleteByPrimaryKey(id);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("删除商品失败！");
		}
	}

	public Response deleteBatch(List<String> ids) {
		try {
			goodsMapper.deleteBatch(ids);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("删除商品失败！");
		}
	}

	public Response queryById(String id) {
		try {
			return new ObjectResponse<Goods>(goodsMapper.selectByPrimaryKey(id));
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("查询商品失败！");
		}
	}

	public Response update(Goods goods) {
		try {
			goodsMapper.updateByPrimaryKey(goods);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("修改商品失败！");
		}
	}

}
