package cn.jingshan.stlgsc.web.baseinfo.controller;

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
import cn.jingshan.stlgsc.web.baseinfo.po.BaseInfo;
import cn.jingshan.stlgsc.web.baseinfo.service.BaseInfoService;

/**
 * <p>Description: </p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-24
 * @vession 1.0.0
 */
@Controller
@RequestMapping("/manage/baseinfo/")
public class BaseInfoController {

	@Autowired
	private BaseInfoService baseInfoService;
	
	@RequestMapping(value="getCount", method=RequestMethod.POST)
	@ResponseBody
	public CountNum getCount() throws Exception {
		return baseInfoService.getCount();
	}
	
	@RequestMapping(value="getByPaging", method=RequestMethod.POST)
	@ResponseBody
	public List<BaseInfo> getByPaging(PageParameter pager) throws Exception {
		return baseInfoService.getByPaging(pager);
	}
	
	@RequestMapping(value="getById", method=RequestMethod.POST)
	@ResponseBody
	public Response getById(String id) throws Exception {
		return baseInfoService.getById(id);
	}
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	@ResponseBody
	public Response save(BaseInfo baseInfo) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "添加基础信息,名称=" + baseInfo.getName());
		return baseInfoService.save(baseInfo);
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	@ResponseBody
	public Response delete(String id) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除基础信息,id=" + id);
		return baseInfoService.delete(id);
	}
	
	@RequestMapping(value="deleteBatch", method=RequestMethod.POST)
	@ResponseBody
	public Response deleteBatch(@RequestBody String ids) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除基础信息,id=" + ids.toString());
		return baseInfoService.deleteBatch(Arrays.asList(ids));
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public Response update(BaseInfo baseInfo) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "修改基础信息,id=" + baseInfo.toString());
		return baseInfoService.update(baseInfo);
	}
}
