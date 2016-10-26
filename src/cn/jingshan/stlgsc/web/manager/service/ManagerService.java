/**
 * @file AccountService.java
 * @author Administrator
 * @date 2015-11-22
 */
package cn.jingshan.stlgsc.web.manager.service;

import java.util.List;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.web.manager.po.Manager;

/**
 * @class AccountService
 * @description 
 */
public interface ManagerService {
	
	/**
	 * Description: 查询管理员
	 * @param manager 管理员信息
	 * @return: Manager
	 */
	public Manager getManager(Manager manager) throws Exception;
	
	/**
	 * Description: 查询总数
	 * @param
	 * @return: CountNum
	 */
	public CountNum getCount() throws Exception;
	
	/**
	 * Description: 分页查询
	 * @param pageParameter 页面参数
	 * @return: List<Manager>
	 */
	public List<Manager> getPageList(PageParameter pageParameter) throws Exception;

	/**
	 * Description: 更新
	 * @param manager 管理员信息
	 * @return: int
	 */
	public Response update(Manager manager) throws Exception;
	
	/**
	 * Description: 删除
	 * @param id 管理员id
	 * @return: Response
	 */
	public Response delete(String id) throws Exception;
	
	/**
	 * Description: 删除
	 * @param id 管理员id
	 * @return: int
	 */
	public Response delete(List<String> id) throws Exception;

	/**
	 * Description: 保存
	 * @param manager 管理员信息
	 * @return: String
	 */
	public Response save(Manager manager);

	/**
	 * Description: 重置密码
	 * @param id
	 * @return: Response
	 */
	public Response pwdReset(String id);

	/**
	 * Description: 根据id查询
	 * @param id 
	 * @return: Manager
	 */
	public Response getManager(String id);

}
