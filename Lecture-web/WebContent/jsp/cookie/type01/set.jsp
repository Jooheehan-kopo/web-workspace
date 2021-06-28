<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//인코딩
 	request.setCharacterEncoding("utf-8");
 	//객체 추출
 	String cName = request.getParameter("cName");
 	String cValue = request.getParameter("cValue");
 	//쿠키를 생성
 	Cookie cookie = new Cookie(cName,cValue); //servlet 코드에 이미 임포트된게 있기에 에러 안남.
 	//쿠키 전송 - response.addCookie
 	response.addCookie(cookie);
 	
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키설정 완료</h2>
	<a href ="get.jsp">설정된 쿠키조회</a>
</body>
</html>