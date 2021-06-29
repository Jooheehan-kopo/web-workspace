<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
int boardNo = Integer.parseInt(request.getParameter("no")); 
BoardDAO dao = new BoardDAO();

BoardVO board= dao.detail(boardNo);
pageContext.setAttribute("board",board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>
<script type="text/javascript"
	src="/Mission-Web/resources/js/jquery-3.6.0.min.js">
	
</script>
<script>
	
	if('${userVO}'==''){
		location.href="/Mission-Web/jsp/login/login.jsp"   //userVO 값이 비어있을때, 로그인이 안되어있을때.
	}
	$(document).ready(function() {
		$('#cancel').click(function() {
			location.href = "list2(el).jsp"
		})

	})
// 위에 안에 넣어주면 안됨. 밖으로 빼줘야함.
	function whenSubmit() {
		let t = document.inputForm
		if (t.title.value == "") {
			alert("제목을 입력하세요!")
			t.title.focus()
			return false
		}
		if (t.writer.value == "") {
			alert("작성자를 입력하세요!")
			t.writer.focus()
			return false
		}
		if (t.content.value == "") {
			alert("내용을 입력하세요!")
			t.content.focus()
			return false
		}
		return true
	}
</script>



<link rel ="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel ="stylesheet" href="/Mission-Web/resources/css/board.css" />
</head>
<body>
	<header>
		<jsp:include page ="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr width="80%">
		<h2>게시글 수정</h2>
		<hr width="80%">
		<br>
		<form name="updateForm" action="update.jsp" method="post"
			onsubmit="return whenSubmit()">
			
			<input type ="hidden" name="writer" value="${userVO.id }">
			<input type ="hidden" name="no" value="${board.no }">
			<table border="1" width="80%">
				<tr>
					<th width="25%">제목</th>
					<td><input type="text" size="60" name="title" value="${board.title }"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td><c:out value="${userVO.id }"/>
					<%-- <input type="text" size="60" name="writer" value="${userVO.id }" readonly> --%></td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td><textarea row="8" cols="60" name="content">${board.content }</textarea></td>
				</tr>

			</table>
			<input type="submit" value="수정"> 
			<input type="button"
				value="취소" id="cancel">

		</form>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>

	
</body>
</html>