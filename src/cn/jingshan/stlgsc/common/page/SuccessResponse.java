package cn.jingshan.stlgsc.common.page;

/**
 * 操作成功Controller返回結果
 * 
 * @author shishun
 *
 */
public class SuccessResponse implements Response {

	public String getResponseCode() {
		return Response.CODE_SUCCESS;
	}

	public String getResponseMsg() {
		return Response.MSG_SUCCESS;
	}

}
