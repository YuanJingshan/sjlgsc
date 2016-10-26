package cn.jingshan.stlgsc.web.goodstype.controller;

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
import cn.jingshan.stlgsc.web.goodstype.po.GoodsType;
import cn.jingshan.stlgsc.web.goodstype.service.GoodsTypeService;

/**
 * <p>Description: 商品类别controller</p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-22
 * @vession 1.0.0
 */
@Controller
@RequestMapping("/manage/goods/type/")
public class GoodsTypeController {
	
	@Autowired
	private GoodsTypeService goodsTypeService;

	/**
	 * Description: 查询总记录数
	 * @param 
	 * @return: CountNum
	 */
	@RequestMapping(value="getCount", method=RequestMethod.POST)
	@ResponseBody
	public CountNum getCount() throws Exception {
		return goodsTypeService.getCount();
	}
	
	/**
	 * Description: 分页查询
	 * @param pager 页面参数
	 * @return: List<GoodsType>
	 */
	@RequestMapping(value="queryByPaging", method=RequestMethod.POST)
	public List<GoodsType> queryByPaging(PageParameter pager) throws Exception {
		return goodsTypeService.queryByPaging(pager);
	}
	
	/**
	 * Description: 根据id查询商品类别
	 * @param
	 * @return: GoodsType
	 */
	public Response queryById(String id) throws Exception {
		return goodsTypeService.queryById(id);
	}
	
	@RequestMapping(value="batchDelete", method=RequestMethod.POST)
	@ResponseBody
	public Response batchDelete(@RequestBody String[] ids) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除id=" + ids.toString() + "商品类别");
		return goodsTypeService.deleteBatch(Arrays.asList(ids));
		
	} 
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	@ResponseBody
	public Response delete(String id) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除id=" + id + "商品类别");
		return goodsTypeService.delete(id);
	}
	
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	@ResponseBody
	public Response save(GoodsType goodsType) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "添加商品类别" + goodsType.getName());
		return goodsTypeService.save(goodsType);
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public Response update(GoodsType goodsType) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "更新id=" + goodsType.getId() + "商品类别");
		return goodsTypeService.update(goodsType);
	}
}
