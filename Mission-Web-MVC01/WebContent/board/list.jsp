<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판메인</title>
<link rel ="stylesheet" href="<%= request.getContextPath() %>/resources/css/layout.css" />
<link rel ="stylesheet" href="<%= request.getContextPath() %>/resources/css/board.css" />
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = "writeForm.jsp"
		})
	})
	function doAction(no){
		//디테일로 이동하는 것이 목적 /  jstl 해석(서버)이 먼저기때문에 자바스크립트 안에도 쓸수 가 있음.
		<c:choose>
			<c:when test ="${not empty userVO}">
				location.href='detail(el).jsp?no='+no+ '&type=list'; //로그인이 되어있을때만 가능. 로그인여부 알아야함./ list에서 왔다.
			</c:when>
			<c:otherwise>
				if(confirm('로그인이 필요한 서비스입니다 \n 로그인페이지로 이동하시겠습니까?'))//참이라면
					location.href = "/Mission-Web/jsp/login/login.jsp"
			</c:otherwise>
		</c:choose>
			
		
	}
</script>
</head>
<body>
	<header>
		<%-- <jsp:include page ="/jsp/include/topMenu.jsp" /> --%>
	</header>
	<section>
		<div align="center">
		<hr>
		<h2>게시판 목록</h2>
		<hr>
		<br>
		<table border="1" style="width:100%" id="list" >
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">등록일</th>
			</tr>
			
			<c:forEach items= "${list }" var ="board" varStatus="loop">
			<tr <c:if test = "${loop.index mod 2 ne 0 }"> class="odd"</c:if>>
			 	<td>${board.no }</td>
			 	<td>
			 	
			 <a href="<%= request.getContextPath() %>/board/detail.do?no=${board.no}"> 
			 
			<!--  <a onclick="doAction()"> -->
			
			<%-- <a href="javascript: doAction(${board.no})" > --%>
			 	<c:out value = "${board.title }"/>
			 	</a>
			 	</td>
			 	<td>${board.writer }</td>
			 	<td>${board.regDate }</td>
			 	
			</tr>
			</c:forEach>
		</table>
		<br>
		
		<c:if test ="${not empty userVO }">
		<button id="addBtn">새글등록(로그인시)</button>
		</c:if>
	</div>
	</section>
	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp" %> --%>
	</footer>
</body>
</html>







