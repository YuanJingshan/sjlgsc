
package cn.jingshan.stlgsc.web.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.log.Mylog;
import cn.jingshan.stlgsc.log.MylogConfig;
import cn.jingshan.stlgsc.web.user.mapper.UserMapper;
import cn.jingshan.stlgsc.web.user.service.UserService;

/**
 * <p>Description: 会员service实现</p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-24
 * @vession 1.0.0
 */
@Service(value="userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

//	public int getCount() throws Exception {
//		int returnValue = 0;
//		// 日志(开始)
//		Mylog.getInstance().info(
//				MylogConfig.controller_log_path, 
//				this.getClass() + " CountNum getCount() start");
//		
//		returnValue = userMapper.selectCount();
//		
//		// 日志(结束)
//		Mylog.getInstance().info(
//				MylogConfig.controller_log_path, 
//				this.getClass() + " CountNum getCount() end");
//		
//		// 返回值
//		return returnValue;
//	}
//
//	public List<User> getPageList(PageParameter pageParameter) throws Exception {
//		// 定义返回值
//		List<User> returnList = null;
//		
//		// 日志(开始)
//		Mylog.getInstance().info(
//				MylogConfig.controller_log_path, 
//				this.getClass() + " CountNum getCount() start");
//		// 处理
//		returnList = userMapper.selectPageList(pageParameter);
//		
//		// 日志(结束)
//		Mylog.getInstance().info(
//				MylogConfig.controller_log_path, 
//				this.getClass() + " CountNum getCount() end");
//		
//		// 返回
//		return returnList;
//	}
//
//	public int delete(List<String> idList) throws Exception {
//		// 定义返回值
//		int returnValue = 0;
//		
//		// 日志
//		Mylog.getInstance().info(MylogConfig.controller_log_path, 
//				this.getClass() + " int delete(List<String> idList) start"
//				+ "parameter: idList=" + idList.toString());
//		
//		returnValue = userMapper.deleteBatch(idList);
//		
//		// 日志
//		Mylog.getInstance().info(MylogConfig.controller_log_path, 
//				this.getClass() + " int delete(List<String> idList) end");
//		
//		// 返回
//		return returnValue;
//	}
//
//	public int delete(String id) throws Exception {
//		// 定义返回值
//		int returnValue = 0;
//		
//		// 日志
//		Mylog.getInstance().info(MylogConfig.controller_log_path, 
//				this.getClass() + " int delete(String id) start parameter: id=" + id);
//		
//		returnValue = userMapper.delete(id);
//		
//		// 日志
//		Mylog.getInstance().info(MylogConfig.controller_log_path, 
//				this.getClass() + " int delete(List<String> idList) end");
//		
//		// 返回
//		return returnValue;
//	}

}
