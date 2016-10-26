package cn.jingshan.stlgsc.web.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.log.Mylog;
import cn.jingshan.stlgsc.log.MylogConfig;
import cn.jingshan.stlgsc.web.user.po.User;
import cn.jingshan.stlgsc.web.user.service.UserService;

/**
 * <p>Description: 会员controller</p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-24
 * @vession 1.0.0
 */
@Controller
@RequestMapping("/manage/user/")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="getCount", method=RequestMethod.POST)
	@ResponseBody
	public CountNum getCount() throws Exception {
		return userService.getCount();
	}
	
	@RequestMapping(value="getByPaging", method=RequestMethod.POST)
	@ResponseBody
	public List<User> getByPaging(PageParameter pager) throws Exception {
		return userService.getByPaging(pager);
	}
	
	@ResponseBody
	@RequestMapping("/manage/user/batchDelete")
	public ReturnCode batchDelete(String idStr) throws Exception {
		// 定义返回值
		ReturnCode returnCode = new ReturnCode();
		// 日志
		Mylog.getInstance().error(
				MylogConfig.controller_log_path, 
				this.getClass() + " ReturnCode delete(String idStr) parameter: idStr=" + idStr);
		
		// 处理
		String[] idArray = idStr.split(",");
		List<String> idList = new ArrayList<String>();
		for (String item : idArray) {
			idList.add(item);
		}
		// 批量删除
		int num = userService.delete(idList);
		returnCode.setReCode(num);
		
		// 根据删除结果返回提示消息
		if (num > 0) {
			returnCode.setMsg(Message.USER_DEL_SUCCESS);
		} else {
			returnCode.setMsg(Message.USER_DEL_ERROR);
		}
		
		// 返回值
		return returnCode;
	}
	
	@ResponseBody
	@RequestMapping("/manage/user/delete")
	public Response delete(String id) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除会员");
		return userService.delete(id);
	}
	
}
