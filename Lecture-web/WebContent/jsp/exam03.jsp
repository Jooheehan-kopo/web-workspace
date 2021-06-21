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
	int sum = 0;
	%>
	sum:
	<%=sum%><br>

	<%!public int getSum(int val1, int val2){
	int sum = 0;
	for (int i = val1; i<= val2;i++){
		sum += i;
	}
	return sum;
	}
	
	%>
	1~10사이의 총합 : <%= getSum(1,10) %>
</body>
</html>