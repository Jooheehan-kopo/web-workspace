package kr.ac.kopo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.HandlerMapping;

public class FrontControllerServlet extends HttpServlet {
	
	private HandlerMapping mappings;
	
	@Override
	public void init(ServletConfig config) throws ServletException{
		String propLoc = config.getInitParameter("propertyLocation");
		
		mappings = new HandlerMapping(propLoc); //매번 새로 만들지 않기위해.. 근데 독립적임..
		
		if(propLoc != null) {
	         mappings = new HandlerMapping(propLoc);
	      }else {
	         mappings = new HandlerMapping();
	      }
	}
		
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		// System.out.println("요청처리");

		String context = request.getContextPath();
		System.out.println("context: " + context);

		String uri = request.getRequestURI();
		uri = uri.substring(context.length());
		//System.out.println("요청 uri : " + uri);
		
		//String callPage ="";
		
		try {
			
			Controller control = mappings.getController(uri);
		//	switch (uri) {
		//	case "/board/list.do":
				//BoardListController list = new BoardListController();
			//	control = new BoardListController();
				
				//break;
			//case "/board/writeForm.do":
				//WriteFormController writeForm = new WriteFormController();
			//	control = new WriteFormController();
			
				//break;
			//}
			if(control !=null) {
				
				String callPage = control.handleRequest(request, response); //모든 비즈니스 로직 실행한 것임..화면 출력만 필요함
				//forward, response.sendRedirect(); jsp는 말고,자바로
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request,response);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
