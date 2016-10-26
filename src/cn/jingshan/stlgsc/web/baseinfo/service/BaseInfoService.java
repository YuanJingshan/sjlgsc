package cn.jingshan.stlgsc.web.baseinfo.service;

import java.util.List;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.web.baseinfo.po.BaseInfo;

/**
 * <p>Description: </p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-24
 * @vession 1.0.0
 */
public interface BaseInfoService {

	/**
	 * Description:
	 * @param
	 * @return: CountNum
	 */
	CountNum getCount();

	/**
	 * Description:
	 * @param
	 * @return: List<BaseInfo>
	 */
	List<BaseInfo> getByPaging(PageParameter pager);

	/**
	 * Description:
	 * @param
	 * @return: Response
	 */
	Response getById(String id);

	/**
	 * Description:
	 * @param
	 * @return: Response
	 */
	Response save(BaseInfo baseInfo);

	/**
	 * Description:
	 * @param
	 * @return: Response
	 */
	Response delete(String id);

	/**
	 * Description:
	 * @param
	 * @return: Response
	 */
	Response deleteBatch(List<String> asList);

	/**
	 * Description:
	 * @param
	 * @return: Response
	 */
	Response update(BaseInfo baseInfo);

}
