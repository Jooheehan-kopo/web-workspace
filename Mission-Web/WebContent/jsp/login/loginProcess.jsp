<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 작업순서
    1. login.jsp 파일에서 날라오는 파라미터 추출(id,password)
    2. 추출된 ID, PASSWORD 에 맞는 회원의 존재여부 판단(DB, t_member)
    - 만일 로그인 성공시 세션에 회원정보를 등록.
    3. 존재여부에 따른 페이지를 이동(로그인을 성공 : index.jsp 로 / 로그인 실패시 : login.jsp)
    --%>
 <%
 //1.
 request.setCharacterEncoding("utf-8");
  
 String cid = request.getParameter("id");
 String cpassword = request.getParameter("password");
 
 //2.디비 연결,
 Connection conn = new ConnectionFactory().getConnection();
 StringBuilder sql = new StringBuilder();
 sql.append("select id, password  from members");
 sql.append("  where id=? , password=?  ");
 
 PreparedStatement pstmt = conn.prepareStatement(sql.toString());
 pstmt.setString(1,cid);
 pstmt.setString(2,cpassword);
 
 ResultSet rs = pstmt.executeQuery();
 rs.next();
 
 JDBCClose.close(conn,pstmt);
 
 String id = rs.getString("id"); 
 String pwd = rs.getString("password"); 
 
 //. 세션 등록
 MemberVO member = new MemberVO();
 member.setId(id);
 member.setPassword(pwd);
 
 session.setAttribute("id", id);
 session.setAttribute("password", pwd );
 
 
 
 
 %>
 <c:if test = "${param.id}" eq cid>

 	  <jsp:forward page ="/index.jsp"/>
 
