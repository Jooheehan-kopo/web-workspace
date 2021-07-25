package kr.co.jh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jh.dao.*;

import kr.co.jh.vo.MemberVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		MemberVO member = new MemberVO();
		member.setUser_id(user_id);
		member.setUser_pw(user_pw);
		
		LoginDAO dao = new LoginDAO();
		MemberVO userVO = dao.login(member);
		
		String msg = "";
		String url = "";
		System.out.println("user_id"+ user_id);
		System.out.println("user_pw"+ user_pw);
		
		if(userVO == null) {
			// 로그인 실패
			msg = "아이디 또는 패스워드를 잘못입력하셨습니다";
			url = request.getContextPath() + "/login.do";
		} else {
			// 로그인 성공
			msg = "로그인을 성공하였습니다";
			url = request.getContextPath();
			
			// 세션 등록
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
		
		System.out.println("msg" + msg);
		System.out.println("url"+url);
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/login/loginProcess.jsp";
	}

}











