package cn.jingshan.stlgsc.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.jingshan.stlgsc.web.manager.po.Manager;

/**
 * <p>ClassName: LoginInterceptor</p>
 * <p>Description: 登录拦截器</p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-22
 * @vession 1.0.0
 */
public class LoginInterceptor implements HandlerInterceptor {

	/**
	 * 进入handler方法之前执行
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		
		// 获取请求地址
		String url = request.getRequestURI();
		// 获取sesson
		HttpSession session = request.getSession();
              
		// 根据地址进行处理
		if (url.indexOf("manage") > 0) {
			if (url.indexOf("login") > 0) {
				return true;
			}
			// 后端地址
			Manager manager = (Manager)session.getAttribute("sessionManager");
			if (manager != null) {
				return true;
			}
			if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
		    	//如果是ajax请求响应头会有，x-requested-with
				//在响应头设置session状态 
		    	response.setHeader("sessionstatus", "non");
		    	return true;
		    } else {
		    	request.getRequestDispatcher("/manage/login.jsp").forward(request, response);
			}
		} else if (url.indexOf("sgyz") > 0) {
//			// 前端地址
//			User user = (User)session.getAttribute("sessionUser");
//			if (user != null) {
//				return true;
//			}
//			request.getRequestDispatcher("/sgyz/manage/login.jsp").forward(request, response);
			return true;
		}
		
		// 不放行
		return false;
	}
	
	/**
	 * 进入handler方法之后
	 * 返回modelAndView之前执行
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView ex) throws Exception {
	}
	
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
}
