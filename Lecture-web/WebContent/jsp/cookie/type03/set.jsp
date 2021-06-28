<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//인코딩
 	request.setCharacterEncoding("utf-8");
 	//객체 추출
 	String cName = request.getParameter("cName");  // 한글 입력안됨. 인코딩해줘야함.
 	cName =URLEncoder.encode(cName,"utf-8");
 	String cValue = request.getParameter("cValue");
 	cValue= URLEncoder.encode(cValue,"utf-8");
 	String cAge = request.getParameter("cAge");
 	

 	
 	
 	//쿠키를 생성
 	Cookie cookie = new Cookie(cName,cValue); //servlet 코드에 이미 임포트된게 있기에 에러 안남.
 	
 	//유효시간 설정
	if(cAge !=null &&cAge.length() !=0){   //cage = & 로 비어서 올수있음
		cookie.setMaxAge(Integer.parseInt(cAge)*60); // 값을 지정했을때. 분을 초로 해야함
	}
 	
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