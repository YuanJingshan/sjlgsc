package cn.jingshan.stlgsc.web.manager.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jingshan.stlgsc.common.MD5Util;
import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.log.Mylog;
import cn.jingshan.stlgsc.log.MylogConfig;
import cn.jingshan.stlgsc.web.manager.po.Manager;
import cn.jingshan.stlgsc.web.manager.service.ManagerService;

/**
 * <p>Description: 管理员</p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-15
 * @vession 1.0.0
 */
@Controller
@RequestMapping("/manage/manager/")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	//登录
	private static String LOGIN="/manage/login";
	//首页
	private static String INDEX="/manage/index";
	
	/**
	 * Description: 登录
	 * @param manager
	 * @param model
	 * @param session
	 * @return: String
	 */
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Manager manager, Model model, HttpSession session) throws Exception{
		Mylog.getInstance().info(MylogConfig.controller_log_path, "用户" + manager.getName() + "登录");
		if (manager.getName().equals("admin") && manager.getPassword().equals("password")) {
			manager.setRole("2");
			// 将后台账户存session
			session.setAttribute("sessionManager", manager);
			return INDEX;
		} else {
			manager.setPassword(MD5Util.string2MD5(manager.getPassword()));
			manager = managerService.getManager(manager);
			if (manager == null) {
				return LOGIN;
			} else {
		        // 将后台账户存session
				session.setAttribute("sessionManager", manager);
				return INDEX;
			}
		}
	}
	
	/**
	 * Description: 退出
	 * @param session
	 * @return: String
	 */
	@RequestMapping(value="logout", method={RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpSession session) {
		session.invalidate();
		return LOGIN;
	}
	
	/**
	 * Description: 查选总数
	 * @param 
	 * @return: CountNum
	 */
	@ResponseBody
	@RequestMapping(value="count", method=RequestMethod.POST)
	public CountNum count() throws Exception {
		return managerService.getCount();
	}
	
	/**
	 * Description: 根据id查询
	 * @param id 管理员id
	 * @return: Manager
	 */
	@RequestMapping(value="queryManagerById", method=RequestMethod.POST)
	@ResponseBody
	public Response queryManagerById(String id) throws Exception {
		return managerService.getManager(id);
	}
	
	/**
	 * Description: 分页查询
	 * @param pager 页面参数
	 * @return: List<Manager>
	 */
	@ResponseBody
	@RequestMapping(value="queryBypaging", method=RequestMethod.POST)
	public List<Manager> queryBypaging(PageParameter pager) throws Exception {
		return managerService.getPageList(pager);
	}
	
	/**
	 * Description: 添加
	 * @param manager 管理员信息
	 * @return: String
	 */
	@RequestMapping(value="save", method=RequestMethod.POST)
	@ResponseBody
	public Response save(Manager manager) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "添加管理员" + manager.getName());
		return managerService.save(manager);
	}
	
	/**
	 * Description: 删除
	 * @param id 管理员id
	 * @return: Response
	 */
	@RequestMapping(value="delete", method=RequestMethod.POST)
	@ResponseBody
	public Response delete(String id) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除id=" + id + "的管理员");
		return managerService.delete(id);
	}
	
	/**
	 * Description: 删除（批量）
	 * @param id 管理员id
	 * @return: Response
	 */
	@RequestMapping(value="deletebatch", method=RequestMethod.POST)
	@ResponseBody
	public Response deleteBatch(@RequestBody String[] ids) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "删除id=" + ids.toString() + "的管理员");
		return managerService.delete(Arrays.asList(ids));
	}
	
	/**
	 * Description: 更新
	 * @param manager信息
	 * @return: String
	 */
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public Response update(Manager manager) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "修改id=" + manager.getId() + "管理员信息");
		return managerService.update(manager);
	}
	
	/**
	 * Description: 密码重置
	 * @param id 管理员id
	 * @return: Response
	 */
	@RequestMapping(value="pwdreset", method=RequestMethod.POST)
	@ResponseBody
	public Response pwdReset(String id) throws Exception {
		Mylog.getInstance().info(MylogConfig.controller_log_path, "重置id=" + id + "管理员密码");
		return managerService.pwdReset(id);
	}
}