package kr.co.jh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jh.vo.MemberVO;

public class SocialLoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("profile_nickname");
		String user_email = request.getParameter("email");
		
		MemberVO member = new MemberVO();
		member.setUser_id(user_id);
		member.setUser_email(user_email);
		System.out.println("user_id: "+ user_id);
		System.out.println("user_email"+ user_email);
		
		
		
		
		return "/login/loginProcess.jsp";
	}

	
	
}
