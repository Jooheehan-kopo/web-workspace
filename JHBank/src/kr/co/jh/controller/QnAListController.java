package kr.co.jh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jh.dao.QnADAO;
import kr.co.jh.vo.QnAVO;

public class QnAListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		  QnADAO dao = new QnADAO(); 
		  List<QnAVO> list = dao.list();
		 request.setAttribute("list",list);
		 
		
		
//		QnAVO qna = new QnAVO();
		
//		int q_no = qna.getQ_no();
//		String user_id = qna.getUser_id();
//		String q_title = qna.getQ_title();
//		int comment_cnt = qna.getCommnet_cnt();
//		int q_viewcnt = qna.getQ_viewCnt();
//		String q_date = qna.getQ_date();
		

		
		return "/qna/list.jsp";
			
		
		
	}

}
