<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function action() {
		alert('!!!!')
	}
	
	function move(){
		location.href="<%=request.getContextPath()%>/page.jsp";
	}
</script>
<style>
body {
	color: blue;
}

.second {
	color: red;
}

input::placeholder {
	color: green;
}

input::-webkit-input-placeholder {
	color: green;
}

input:-ms-input-placeholder {
	color: green;
}

textarea::placeholder {
	color: green;
}

textarea::-webkit-input-placeholder {
	color: green;
}

textarea:-ms-input-placeholder {
	color: green;
}
</style>
</head>
<body>
	<button type='submit' onclick="action()">눌러라버튼!</button>
	<table>
		<tr>
			<td class="first">a</td>
			<td class="first">b</td>
			<td class="first">c</td>
			<td class="first">d</td>
		</tr>
		<tr>
			<td class="second">a</td>
			<td class="second">b</td>
			<td class="second">c</td>
			<td class="second">d</td>
		</tr>
	</table>
	<h2>[인사]</h2>
	<input type="text" placeholder="원하는 글을 쓰시오">
	
	<button type ="submit" onclick="move()">이동!</button>
</body>
</html>