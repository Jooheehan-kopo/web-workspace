<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	 exam04(iftag).jsp?type=U or exam04(iftag).jsp?type=S
	 
	 u면 일반사용자님 환영합니다, s면 관리자님 환영합니다.
	 
	 true라고 test값 주면 나오고 false라고 하면 안나옴.
	if elseif  같은 형식이 필요함. --> choose : 다중선택
 --%>
 
 <c:if test="${param.type=='S' }">
 <h2> 관리자님 환영합니다 </h2>
 </c:if>
 
 <c:if test="${param.type=='U' }">
 <h2> 일반사용자님 환영합니다 </h2>
 </c:if>
 
 
</body>
</html>