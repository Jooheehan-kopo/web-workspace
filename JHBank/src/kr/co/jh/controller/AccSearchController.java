package kr.co.jh.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jh.dao.BankDAO;
import kr.co.jh.vo.BankVO;
import kr.co.jh.vo.MemberVO;

public class AccSearchController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		List<BankVO> list = new ArrayList<BankVO>();
		
		//세션에 등록되어있는 user_id 불러오기
		HttpSession session = request.getSession();
		MemberVO vo = new MemberVO();
		vo = (MemberVO) session.getAttribute("userVO");
		String user_id = vo.getUser_id();
		String user_cid = vo.getUser_cid();
		if(vo.getUser_id() != null && user_id.equals(vo.getUser_id())) {
			
			BankDAO dao = new BankDAO();
			list = dao.searchAll(user_cid);
		}
		request.setAttribute("list", list);
		
		return "/account/AccSearch.jsp";
	}

}
