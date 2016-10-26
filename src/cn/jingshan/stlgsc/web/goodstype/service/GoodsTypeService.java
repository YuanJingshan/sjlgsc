package cn.jingshan.stlgsc.web.goodstype.service;

import java.util.List;

import cn.jingshan.stlgsc.common.page.CountNum;
import cn.jingshan.stlgsc.common.page.PageParameter;
import cn.jingshan.stlgsc.common.page.Response;
import cn.jingshan.stlgsc.web.goodstype.po.GoodsType;

/**
 * <p>Description: 商品类别service</p>
 * <p>Company: </p>
 * @author  yjs
 * @date    2016-10-22
 * @vession 1.0.0
 */
public interface GoodsTypeService {

	/**
	 * Description: 获取总记录数
	 * @param 
	 * @return: CountNum
	 */
	CountNum getCount();

	/**
	 * Description: 获取页面数据
	 * @param pager 页面参数
	 * @return: List<GoodsType>
	 */
	List<GoodsType> queryByPaging(PageParameter pager);

	/**
	 * Description: 保存商品种类
	 * @param goodsType 商品种类信息
	 * @return: Response
	 */
	Response save(GoodsType goodsType);

	/**
	 * Description: 根据id查询商品类别
	 * @param id 
	 * @return: Response
	 */
	Response queryById(String id);

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
	 * Description: 更新商品信息
	 * @param goodsType
	 * @return: Response
	 */
	Response update(GoodsType goodsType);
	
//
//	/**
//	 * <p>MethodName: getPageList</p>
//	 * <p>Description: </p>
//	 * <p>Company: www.shuiguoyizhan.com</p>
//	 * <p>Parameter: </P>
//	 * <p>Return Type: List<Courier></P>
//	 * @author  yjs
//	 * @date    2016-5-6
//	 * @vession 1.0.0
//	 */
//	List<FruitsType> getPageList(PageParameter pageParameter) throws Exception;
//
//	/**
//	 * <p>MethodName: delete</p>
//	 * <p>Description: 批量删除</p>
//	 * <p>Company: www.shuiguoyizhan.com</p>
//	 * <p>Parameter: idList</P>
//	 * <p>Return Type: int</P>
//	 * @author  yjs
//	 * @date    2016-5-6
//	 * @vession 1.0.0
//	 */
//	int delete(List<Integer> idList) throws Exception;
//
//	/**
//	 * <p>MethodName: delete</p>
//	 * <p>Description: 删除</p>
//	 * <p>Company: www.shuiguoyizhan.com</p>
//	 * <p>Parameter: id</P>
//	 * <p>Return Type: int</P>
//	 * @author  yjs
//	 * @date    2016-5-6
//	 * @vession 1.0.0
//	 */
//	int delete(String id) throws Exception;
//
//	/**
//	 * <p>MethodName: isExist</p>
//	 * <p>Description: 判断是否存在</p>
//	 * <p>Company: www.shuiguoyizhan.com</p>
//	 * <p>Parameter: fruitsType</P>
//	 * <p>Return Type: boolean</P>
//	 * @author  yjs
//	 * @date    2016-5-7
//	 * @vession 1.0.0
//	 */
//	boolean isExist(FruitsType fruitsType) throws Exception;
//
//	/**
//	 * <p>MethodName: add</p>
//	 * <p>Description: 添加</p>
//	 * <p>Company: www.shuiguoyizhan.com</p>
//	 * <p>Parameter: fruitsType</P>
//	 * <p>Return Type: int</P>
//	 * @author  yjs
//	 * @date    2016-5-7
//	 * @vession 1.0.0
//	 */
//	int add(FruitsType fruitsType) throws Exception;
//
//	/**
//	 * <p>MethodName: getFruitsTypeById</p>
//	 * <p>Description: </p>
//	 * <p>Company: www.shuiguoyizhan.com</p>
//	 * <p>Parameter: </P>
//	 * <p>Return Type: FruitsType</P>
//	 * @author  yjs
//	 * @date    2016-5-7
//	 * @vession 1.0.0
//	 */
//	FruitsType getFruitsTypeById(Byte typeId) throws Exception;
//
//	/**
//	 * <p>MethodName: update</p>
//	 * <p>Description: </p>
//	 * <p>Company: www.shuiguoyizhan.com</p>
//	 * <p>Parameter: </P>
//	 * <p>Return Type: int</P>
//	 * @author  yjs
//	 * @date    2016-5-7
//	 * @vession 1.0.0
//	 */
//	int update(FruitsType fruitsType) throws Exception;
//
//	/**
//	 * <p>MethodName: getAll</p>
//	 * <p>Description: </p>
//	 * <p>Company: www.shuiguoyizhan.com</p>
//	 * <p>Parameter: </P>
//	 * <p>Return Type: List<FruitsType></P>
//	 * @author  yjs
//	 * @date    2016-5-7
//	 * @vession 1.0.0
//	 */
//	List<FruitsType> getAll() throws Exception;

}
