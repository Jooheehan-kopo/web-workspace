<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="set.jsp" method ="post">
		쿠키이름: <input type ="text" name ="cName"> <br>
		쿠키 값 : <input type ="text" name ="cValue"><br>
		유효시간(분): <input type ="text" name ="cAge"><br>
		<input type ="submit" value ="쿠키설정">
	</form>
</body>
</html>