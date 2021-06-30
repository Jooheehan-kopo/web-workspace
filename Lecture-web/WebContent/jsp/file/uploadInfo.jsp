<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>전송된 정보 출력</h2>

<%
	InputStreamReader isr = new InputStreamReader(request.getInputStream(), "utf-8"); //데이터 받아옴. 한글이니까 
	BufferedReader br =new BufferedReader(isr); //한 라인씩 읽어옴.
	
	while(true){  //요청 받아서 보여주겠다는 것.
		String data = br.readLine();
		if(data ==null) break;   //만약 값이 없다면 브레이크로 나감.
		out.println(data+"<br>"); 
		
		
	}
%>
</body>
</html>