package com.qingke.boma.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * @author yyh
 */
public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		//请求URL
		String path = request.getRequestURI();
		String relativePath = path.substring(path.lastIndexOf("/")+1);
		//login请求
		if ("login".equals(relativePath)) {
			return true;
		}
		HttpSession session = request.getSession();
		//已登录
		if (session.getAttribute("user") != null) {
			return true;
		}
		//未登录
		request.setAttribute("msg", "请先登录操作!!");
		request.getRequestDispatcher("/Login.jsp").forward(request, response);
		return false;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}
}
