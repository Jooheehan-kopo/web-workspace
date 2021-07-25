package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardListController implements Controller{
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*
		 * BoardDAO dao = new BoardDAO(); 
		 * List<BoardVO> list = dao.selectAll();
		 * request.setAttribute("list",list);
		 */
		
		return "/board/list.jsp";
	}

}
