package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController implements Controller{ // 비즈니스 처리

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return "/login/login.jsp";
	}
}
