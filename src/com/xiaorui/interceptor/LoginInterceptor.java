package com.xiaorui.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xiaorui.pojo.User;

/**
 * 登录认证拦截器
 * @author 肖锐
 *
 */
public class LoginInterceptor implements HandlerInterceptor{
	/** 
     * Handler执行完成之后调用这个方法 
     */ 
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	/** 
     * Handler执行之后，ModelAndView返回之前调用这个方法 
     */ 
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	/** 
     * Handler执行之前调用这个方法 
     */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String url = request.getRequestURI();
		System.out.println("url:"+url);
		if (url.indexOf("login.action")>=0) {
			return true;
		}
		
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		if (user !=null) {
			String userName = user.getUserName();
			String password = user.getPassword();
			System.out.println("userName:"+userName+",password:"+password);
			if (userName != null && password != null) {
				return true;
			}
		}
		//不符合条件的，跳转到登录界面
		request.getRequestDispatcher("/WEB-INF/jsp/login/login.jsp").forward(request, response);
		return false;
	}

}
