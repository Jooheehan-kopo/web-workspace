<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //입력받은 값 받아오기. post이기에 인코딩 설정
    request.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    
    MemberVO member = new MemberVO();
    member.setId(id);
    member.setPassword(password);
    
    //뽑아온 데이터를 세션에 등록시키기. 
    session.setAttribute("member", member);
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>session 설정 완료</h2>
	<a href = "get.jsp">설정된 세션 정보 조회</a>
</body>
</html>