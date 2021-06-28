<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
  <%
  String id = (String)session.getAttribute("id"); //오브잭트형. 명시적
  String password = (String)session.getAttribute("password"); //오브잭트형. 명시적
  
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	설정된 세션 ID: <%= id %><br>
	설정된 세션 pwd: <%= password %><br>
	<hr>
	설정된 세션 ID:  ${sessionScope.id }<br> <!-- 그냥써도 찾아보다가 나옴. -->
	설정된 세션 pwd: ${sessionScope.password }<br>
	<br>
	<a href ="remove.jsp"> 세션 삭제</a>
</body>
</html>