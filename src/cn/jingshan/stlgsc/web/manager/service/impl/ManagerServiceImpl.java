package cn.jingshan.stlgsc.web.manager.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jingshan.stlgsc.common.MD5Util;
import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.FailedResponse;
import cn.jingshan.stlgsc.common.page.ObjectResponse;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.common.page.SuccessResponse;
import cn.jingshan.stlgsc.web.manager.mapper.ManagerMapper;
import cn.jingshan.stlgsc.web.manager.po.Manager;
import cn.jingshan.stlgsc.web.manager.service.ManagerService;

/**
 * <p>Description: 管理员service</p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-15
 * @vession 1.0.0
 */
@Service(value="managerService")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerMapper managerMapper;

	public Manager getManager(Manager manager) throws Exception {
		return managerMapper.selectByCon(manager);
	}

	public CountNum getCount() throws Exception {
		CountNum countNum = managerMapper.selectCount();
		if (countNum == null) {
			countNum = new CountNum();
		}
		return countNum;
	}
	
	public List<Manager> getPageList(PageParameter pager) throws Exception {
		return managerMapper.selectPageList(pager);
	}

	public Response update(Manager manager) {
		try {
			managerMapper.updateByPrimaryKeySelective(manager);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("修改管理员信息失败！");
		}
	}

	public Response delete(String id) {
		try {
			managerMapper.deleteByPrimaryKey(id);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("删除id=" + id + "管理员！");
		}
	}
	
	public Response delete(List<String> id) {
		try {
			managerMapper.deleteBatch(id);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("删除id=" + id.toString() + "管理员！");
		}
	}

	public Response save(Manager manager) {
		try {
			Manager queryObj = new Manager();
			queryObj.setName(manager.getName());
			Manager obj = managerMapper.selectByCon(queryObj);
			if(obj != null) {
				return new FailedResponse("该管理员已经存在！");
			} else {
				manager.setPassword(MD5Util.string2MD5(manager.getPassword()));
				manager.setInsertDt(new Date());
				managerMapper.insert(manager);
			}
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("保存信息失败！");
		}
	}

	public Response pwdReset(String id) {
		try {
			Manager manager = new Manager();
			manager.setId(id);
			manager.setPassword(MD5Util.string2MD5("123456"));
			managerMapper.pwdRest(manager);
			return new SuccessResponse();
		} catch (Exception e) {
			e.printStackTrace();
			return new FailedResponse("密码重置失败！");
		}
	}

	public Response getManager(String id) {
		try {
			return new ObjectResponse<Manager>(managerMapper.selectByPrimaryKey(id));
		} catch (Exception e) {
			return new FailedResponse("查询管理员失败！");
		}
	}
}