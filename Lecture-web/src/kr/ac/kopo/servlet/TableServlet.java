package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:9999/lecture-web/servlet/table?row=4&col=3 요청시

@WebServlet("/servlet/tableExam") //가상의 url 생성? --> 내가 url 지정해줌. 이렇게 쳐도 나오게 됨. 겹치면 안됨. 하나의 서블릿에 여러 url 가능. 가상의 url과 같으면 에러남.
public class TableServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		int row =5;
		int col =5;
		
		response.setContentType("text/html; charset=utf-8");
		
//		int row = Integer.parseInt(request.getParameter("row"));
//		int col = Integer.parseInt(request.getParameter("col"));
		
		PrintWriter out = response.getWriter(); // 아웃풋장치를 얻어옴.PrintWriter가 리턴타입임.
		

		
		for(int i=1; i<row; i++) {
		out.println("<tr>");
			for(int j=1;j<col;j++) {
			out.println("<td>");
			out.println("</td>");
			}
		out.println("</tr>");
		}
		out.println("<html>");
		out.println("	<head>");
		out.println("		<title> 테이블</title>");
		out.println("	</head>");
		out.println("	<body>");
		out.println("<table border ='1'>");
//		out.println("<tr>");
//		out.println("<td>");
//		out.println("</td>");
//		out.println(" </tr>");
		out.println("	</body>");
		out.println("<html>");

		out.flush();
		out.close(); // 접속을 해제*/
	
		
		//교수님 코드	
		int row = 5;
		int col = 5;
		
		String rowStr = request.getParameter("row");
		String colStr = request.getParameter("col");
		if(rowStr != null)
			row = Integer.parseInt(rowStr);
		col = colStr == null ? 5 : Integer.parseInt(colStr);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("  <title>테이블생성</title>");
		sb.append("<style>");
		sb.append(" td { ");
		sb.append("  padding: 0 10px; ");
		sb.append(" } ");
		sb.append("</style>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("  <table border='1'>");
		for(int i = 0; i < row; i++) {
			sb.append("   <tr>");
			for(int j = 0; j < col; j++) {
				sb.append("<td>");
				sb.append("cell( " + i + ", " + j + ")");
				sb.append("</td>");
			}
			sb.append("   </tr>");
		}
		sb.append("  </table>");
		sb.append("</body>");
		sb.append("</html>");
		
		out.println(sb.toString());
		out.flush();
		out.close();
		
		
		
	}
	
	
}
