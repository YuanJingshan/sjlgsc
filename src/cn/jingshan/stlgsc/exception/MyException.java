/**
 * <p>FileName: MyException.java</p>
 * <p>Description: </p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-22
 * @vession 1.0.0
 */
package cn.jingshan.stlgsc.exception;

/**
 * <p>ClassName: MyException</p>
 * <p>Description: 自定义异常</p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-22
 * @vession 1.0.0
 */
public class MyException extends Exception {

	//
	private static final long serialVersionUID = 1844635999770522440L;
	
	// 异常消息
	private String message;

	public MyException(String message) {
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
