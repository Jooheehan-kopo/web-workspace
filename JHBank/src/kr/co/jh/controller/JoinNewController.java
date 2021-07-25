package kr.co.jh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jh.dao.MemberDAO;
import kr.co.jh.vo.MemberVO;

public class JoinNewController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_res_no = request.getParameter("user_res_no");
		String user_pw = request.getParameter("user_pw");
		String user_phone = request.getParameter("user_phone");
		String user_email = request.getParameter("user_email");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String addr3=request.getParameter("addr3");
		String join_date=request.getParameter("join_date");
		String post=request.getParameter("post");
		
		
		System.out.println(user_id);
		System.out.println(user_name);
		System.out.println(user_res_no);
		System.out.println(user_pw);
		System.out.println(user_phone);
		System.out.println(user_email);
		System.out.println(addr1);
		System.out.println(addr2);
		System.out.println(addr3);
		System.out.println(join_date);
		System.out.println(post);
		
		
		MemberVO vo = new MemberVO();
		vo.setUser_id(user_id);
		vo.setUser_name(user_name);
		vo.setUser_res_no(user_res_no);
		vo.setUser_pw(user_pw);
		vo.setUser_phone(user_phone);
		vo.setUser_cid(user_res_no);
		vo.setUser_email(user_email);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setAddr3(addr3);
		vo.setJoin_date(join_date);
		vo.setPost(post);
		
		MemberDAO dao =new MemberDAO();
		System.out.println(dao);
		dao.joinnew(vo);
		
		String url ="";
		String msg ="";
		
		//알림창 안뜸!
		int result =-1;
		
		if(result != -1) {
			url="/";
			msg= "환영합니다. 회원가입이 완료되었습니다.";
		}
		else {
			url = "/joinnew.do";
			msg = "회원가입이 취소되었습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/member/joinnew.jsp";
	}
}
