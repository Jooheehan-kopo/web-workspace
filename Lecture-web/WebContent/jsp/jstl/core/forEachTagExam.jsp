<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	String[] names = {"홍", "고","박","윤"} ;
	// 공유영역에서만 접근이 가능하기에, 밑의 foreach가 찾을 수 있도록
	pageContext.setAttribute("names",names);

	pageContext.setAttribute("namesLength", names.length);  // 등록해줌.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

'hello world'의 문자열 길이 : ${fn : length("hello world") }<br>
배열의 요소개수 : ${fn: length(names) }<br>
<hr>
<hr>
	<h2>1~10까지의 정수 출력</h2>
	<c:forEach begin="1" end="10" var="i">
		${i }<br>
	</c:forEach>
	년도 선택 : 
	<select>
	
	<!-- 	<option>2000</option>
		<option>2001</option>
		<option>2002</option> -->
		<c:forEach begin ="1940" end ="2021" var ="year" step = "5">
		<option>${year }</option>
		</c:forEach>
	</select>
	
	<hr>
<%-- 	<c:forEach items= "${names }" var = "name">
	<c:if test = "${not empty names[names.length]}">
	${name },
	</c:if> </c:forEach> --%>
	
	
	
	<c:forEach begin="0" end="${namesLength-1 }" var="i">
	<%--                      ${fn:length(names)-1 }  이라고도 쓸 수 있음.    --%>
	
		<%-- <c:if test="${i ne 0 }"> --%>
		${names[i] }
		<c:if test="${not empty names[i+1] }">
		,
		</c:if>
	</c:forEach>
	
	<hr>
	
	<c:set var= "cnt" value="0"/> 
	<c:forEach items= "${names }" var = "name">
	<c:if test = "${cnt !=0 }">
	,
	</c:if>
		${name } 
			<c:set var="cnt" value = "${cnt+1 }"/>
	</c:forEach>
	<c:remove var =" cnt" scope ="page"/>
	
	<hr>
	자신의 객체 정보 확인 - varStatus<br>
	first:index:count:last<br>
	<c:forEach items= "${names }" var="name" varStatus ="loop">
		${loop.first } : ${loop.index } : ${loop.count } : ${loop.last }<br>
	</c:forEach>
	
<hr>

	<c:forEach items="${names }" var="name" varStatus ="loop">
	<%-- 	<c:if test="${loop.index ne 0 }"> --%>
	<%-- 	<c:if test="${loop.count ne 1 }"> --%>
	 <c:if test= "${not loop.first }"> 
	
		,
		</c:if>
		${name }
	</c:forEach>
	
</body>
</html>