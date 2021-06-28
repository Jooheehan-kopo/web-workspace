<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="common.jsp" %>
<%
	request.setAttribute("id","hong"); // 변수 등록. 공유하고자하는 변수임. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	msg: <%= msg %><br>
	id: ${id }<br>
	<h2>인클루드전</h2>
	<strong>파라미터 미설정</strong>
	<jsp:include page="one.jsp" />
	<strong>파라미터 설정</strong>
	<jsp:include page="one.jsp">
		<jsp:param value="hong-gil-dong" name="name"/>
		<jsp:param value="56" name="age"/>
	
	</jsp:include>
	<h2>인클루드후</h2>
	phone:${phone }<br>
</body>
</html>