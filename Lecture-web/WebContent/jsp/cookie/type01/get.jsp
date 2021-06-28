<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 Cookie[] cookies =request.getCookies();
 
 StringBuilder sb = new StringBuilder();  //여기에 저장하게 만듬.
 for(Cookie c : cookies){
	 System.out.println("c");
	 String cName = c.getName();
	 String cValue = c.getValue();
	 
	 sb.append("쿠키이름 : " + cName + ", ");
	 sb.append("쿠키 값: " + cValue + "<br> "); //값 넣어줌.
	 
	 //공유영역에 등록시키는 방법도 있음.
	 //pageContext.setAttribute(“cookieData”, sb.toString());
 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>설정된 쿠키정보</h2>
	<%=sb.toString() %>
	<%-- ${cookieDate} --%>
	<a href ="makeForm.jsp">쿠키설정 이동</a>
	
</body>
</html>