package cn.jingshan.stlgsc.web.goods.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.log.Mylog;
import cn.jingshan.stlgsc.log.MylogConfig;
import cn.jingshan.stlgsc.web.goods.po.Goods;
import cn.jingshan.stlgsc.web.goods.service.GoodsService;

/**
 * <p>Description: 商品信息controller</p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-23
 * @vession 1.0.0
 */
@Controller
@RequestMapping("/manage/goods/goods/")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="getCount", method=RequestMethod.POST)
	@ResponseBody
	public CountNum getCount() throws Exception {
		return goodsService.getCount();
	}
	
	@RequestMapping(value="queryByPaging", method=RequestMethod.POST)
	@ResponseBody
	public List<Goods> queryByPaging(PageParameter pager) throws Exception {
		return goodsService.queryByPaging(pager);
	}
	
	@RequestMapping(value="queryById", method=RequestMethod.POST)
	@ResponseBody
	public Response queryById(String id) throws Exception {
		return goodsService.queryById(id);
	}
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	@ResponseBody
	public Response save(Goods goods) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "添加商品，商品名称=" + goods.getName());
		return goodsService.save(goods);
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	@ResponseBody
	public Response delete(String id) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除商品，id=" + id);
		return goodsService.delete(id);
	}
	
	@RequestMapping(value="deleteBatch", method=RequestMethod.POST)
	@ResponseBody
	public Response deleteBatch(@RequestBody String[] ids) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除商品，id=" + ids.toString());
		return goodsService.deleteBatch(Arrays.asList(ids));
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public Response update(Goods goods) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "修改商品，id=" + goods.getId());
		return goodsService.update(goods);
	}
}
