<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- http://localhost:9999/Lecture-web/jsp/el/exam02.jsp?id=aaa&name=bbb&hobby=music&hobby=movie
	 요청했을때 id, name 값을 추출 --%>
	<% 
		String id = request.getParameter("id");
		String[] hobbies = request.getParameterValues("hobby");
		if(hobbies ==null){
			hobbies = new String[]{"파라미터 없음"};
		}
	%>
	id: <%=id %><br>
	id: <%=request.getParameter("id") %><br>
	
	el id: ${param.id}<br>
	name: <%= request.getParameter("name") %><br>
	el name : ${param.name }<br>
	
	hobby : <%= hobbies[0] %><br>
	
	el hobby_music: ${param.hobby }<br>
	el hobby_val_1: ${paramValues.hobby[0] }<br>
	el hobby_val_2: ${paramValues.hobby[1] }<br>
	
</body>
</html>