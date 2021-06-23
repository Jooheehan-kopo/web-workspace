<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//객체 등록 : 공유영역명.setAttribute(이름, 값)
		//객체조회 : 공유영역명.getAttribute(이름)
		//공유영역 4가지 pageContext, request, session, application  - jsp
		
		pageContext.setAttribute("msg","pageContext영역에 등록");   //등록해줬기에 empty 메시지의 값이 f 임.
		String message = (String)pageContext.getAttribute("msg");
		
		//request 영역에 id라는 이름으로 hong 값을 등록
		request.setAttribute("id","hong");
		request.setAttribute("msg","request영역에 객체등록");
	 %>

	empty msg : ${empty msg }<br>
	msg : <%=message %><br>
	msg : <%=pageContext.getAttribute("msg") %><br>
	
	<%-- el 공유영역
		pagescope, requestScope, sessionScope,applicationScope
		
		그 영역에 있는 값을 가져오고 싶을때는 공유영역이름을 써줘야함
	 --%>
	el msg: ${msg}<br>
	request msg: ${requestScope.msg}<br>
	el id : ${id }<br>
</body>
</html>