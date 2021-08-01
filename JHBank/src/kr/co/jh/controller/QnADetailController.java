package kr.co.jh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jh.dao.QnADAO;
import kr.co.jh.vo.QnAVO;

public class QnADetailController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		
		QnADAO dao = new QnADAO();
		QnAVO vo = dao.selectByNo(q_no);
		
		request.setAttribute("vo", vo);
		
		return "/qna/detail.jsp";
	}
	
	

}
