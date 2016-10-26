package cn.jingshan.stlgsc.web.manager.mapper;

import java.util.List;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.web.manager.po.Manager;

/**
 * <p>ClassName: ManagerMapper</p>
 * <p>Description: 系统管理员--mapper</p>
 * <p>Company: www.jingshan.com</p>
 * @author  yjs
 * @date    2016-9-4
 * @vession 1.0.0
 */
public interface ManagerMapper {
    int deleteByPrimaryKey(String id);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
    
    // 手动添加
    CountNum selectCount();
    
    List<Manager> selectPageList(PageParameter pageParameter);
    
    Manager selectByCon(Manager manager);
    
    int deleteBatch(List<String> id);

	int pwdRest(Manager manager);

}