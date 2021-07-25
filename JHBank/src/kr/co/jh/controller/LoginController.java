package kr.co.jh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String msg = (String)session.getAttribute("msg");
		session.removeAttribute("msg");
		request.setAttribute("msg", msg);
		
		return "/login/login.jsp";
	}

	
}
