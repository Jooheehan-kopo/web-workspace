package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PInfoInput extends HttpServlet {

	@Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
      String name = request.getParameter("name");
      String id = request.getParameter("id");
      String pwd = request.getParameter("password");
      String gen = request.getParameter("gen");
//   String[] mails= new String[]{"공고","광고","배송"};
      String[] getmail = request.getParameterValues("mail");
      String job = request.getParameter("job");
      System.out.println(job);
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      
      out.println("<html>");
      out.println("   <head>");
      out.println("      <title>개인정보</title>");
      out.println("   </head>");
      out.println("   <body>");
      out.println("<br>");
      out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인 정보 출력<br>");
      out.println("<br>");
      out.println("이름 : " + name + "<br>");
      out.println("아이디 : " + id + "<br>");
      out.println("비밀번호 : " + pwd + "<br>");
      out.println("성별 : " + gen + "<br>");
      
//      String noti = Arrays.toString(getmail);
      String[] mails = {"받음", "받지않음"};
      
      
      if(getmail != null) {
    	  for(int i =0; i<getmail.length;i++) {
    		
    	  }
      }else {
    	  out.println("체크사항이 없습니다.");
      }
      
  
      out.println("공지메일: "+ mails);
      out.println("광고메일: " + getmail + "<br>");
      out.println("배송 확인 메일: " + getmail + "<br>");
            
//      out.println(Arrays.toString(getmail));
      out.println("직업 : " + job + "<br>");
      out.println("====================================================<br>");
      out.println("   </body>");
      out.println("<html>");
      
      out.flush();
      out.close();
   }
   

}