package kr.co.jh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jh.dao.QnADAO;
import kr.co.jh.vo.MemberVO;
import kr.co.jh.vo.QnAVO;

public class QnAWriteFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		MemberVO qna = (MemberVO)session.getAttribute("userVO");
		String user_id = qna.getUser_id();
		System.out.println(user_id);
		
		
		String title = request.getParameter("q_title");
		String content= request.getParameter("q_content");
		
		System.out.println("title :"+ title);
		System.out.println("content: "+ content);
		
		
		QnAVO vo = new QnAVO();
		vo.setUser_id(user_id);
		vo.setQ_title(title);
		vo.setQ_content(content);
		
		QnADAO dao = new QnADAO();
		dao.writeQ(vo);
		String url="";
		String msg="";
		
	
		if (vo == null) {
			msg="게시글 등록이 취소되었습니다.";
			url= "redirect:/qnaList.do";
		}else {
			url="/writeForm.do";
			msg="게시글이 등록되었습니다!";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/qna/writeForm.jsp";
	}

}
