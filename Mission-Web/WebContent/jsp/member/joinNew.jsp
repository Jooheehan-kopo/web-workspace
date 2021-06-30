<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>회원가입</h2>
			<hr>
			<br>
			<form >
				<table>
					<tr>
						<th>이름: </th>
						<td><input type ="text" name ="name"></td>
					</tr>
					<tr>
						<th>아이디: </th>
						<td><input type ="text" name ="id"></td>
					</tr>					
					<tr>
						<th>비밀번호: </th>
						<td><input type ="text" name ="id"></td>
					</tr>					
					<tr>
						<th>비밀번호 확인: </th>
						<td><input type ="text" name ="id"></td>
					</tr>					
				</table>
				<br>
				<input type ="submit" value ="저장">
			
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>