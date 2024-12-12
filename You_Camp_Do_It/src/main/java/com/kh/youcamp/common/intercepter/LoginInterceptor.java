package com.kh.youcamp.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, 
							 HttpServletResponse response, 
							 Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginMember") != null) {
			// 로그인이 된 상태
			return true;
			
		} else { // 로그인이 안된 상태
			
			// 세션에 일회성 알람 문구를 담고,
			// 메인페이지로 url 재요청하기!!
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
			// 로그인이 필요한 페이지로 진입을 막기 위해
			return false;
		}
		
		
	}
}
