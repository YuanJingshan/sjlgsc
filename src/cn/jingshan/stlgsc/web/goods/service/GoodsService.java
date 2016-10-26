package cn.jingshan.stlgsc.web.goods.service;

import java.util.List;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.web.goods.po.Goods;


/**
 * <p>ClassName: FruitsMgrService</p>
 * <p>Description: 水果管理</p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-5-7
 * @vession 1.0.0
 */
public interface GoodsService {

	/**
	 * Description: 查询总数
	 * @param 
	 * @return: CountNum
	 */
	CountNum getCount();

	/**
	 * Description: 分页查询
	 * @param pager 页面参数
	 * @return: List<Goods>
	 */
	List<Goods> queryByPaging(PageParameter pager);

	/**
	 * Description: 保存
	 * @param goods 商品信息
	 * @return: Response
	 */
	Response save(Goods goods);

	/**
	 * Description: 删除
	 * @param id
	 * @return: Response
	 */
	Response delete(String id);

	/**
	 * Description: 批量删除
	 * @param ids
	 * @return: Response
	 */
	Response deleteBatch(List<String> ids);

	/**
	 * Description: 查询
	 * @param id
	 * @return: Response
	 */
	Response queryById(String id);

	/**
	 * Description: 修改
	 * @param goods
	 * @return: Response
	 */
	Response update(Goods goods);
}
