/**
 * <p>FileName: MyExceptionResolver.java</p>
 * <p>Description: </p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-22
 * @vession 1.0.0
 */
package cn.jingshan.stlgsc.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import cn.jingshan.stlgsc.log.Mylog;
import cn.jingshan.stlgsc.log.MylogConfig;

/**
 * <p>ClassName: MyExceptionResolver</p>
 * <p>Description: 自定义全局异常处理器</p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-22
 * @vession 1.0.0
 */
public class MyExceptionResolver implements HandlerExceptionResolver {

	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		// 解析异常类型
		MyException myException = null;
		
		if (ex instanceof MyException) {
			// 系统自定义异常
			myException = (MyException)ex;
		} else {
			// 其他异常
			myException = new MyException("未知错误！");
		}
		
		// 错误信息
		String message = myException.getMessage();
		
		// 日志
		Mylog.getInstance().error(MylogConfig.error_log_path, message);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("message", message);
		modelAndView.setViewName("error");
		return modelAndView;
	}

}
