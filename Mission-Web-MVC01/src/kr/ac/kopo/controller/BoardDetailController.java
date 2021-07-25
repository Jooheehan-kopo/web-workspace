package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.BoardDAO;
import kr.ac.kopo.dao.BoardVO;

public class BoardDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.selectByNo(no);
		
		request.setAttribute("board", board); //공유영역에 올려줌..
		return "/board/detail.jsp";
	}

}
