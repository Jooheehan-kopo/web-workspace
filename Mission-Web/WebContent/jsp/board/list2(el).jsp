<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Connection conn = new ConnectionFactory().getConnection();
StringBuilder sql = new StringBuilder();
sql.append("select no,title, writer, to_char(reg_date, 'yyyy-mm-dd')as reg_date");
sql.append("  from t_board ");
sql.append("order by no desc");

PreparedStatement pstmt = conn.prepareStatement(sql.toString());
ResultSet rs = pstmt.executeQuery();
//rs.nest가 false 가 될때까지

List<BoardVO> list = new ArrayList<>();
while (rs.next()){
	int no = rs.getInt("no");
	String title = rs.getString("title");
	String writer = rs.getString("writer");
	String regDate = rs.getString("reg_date");
	
	BoardVO board = new BoardVO();
	board.setNo(no);
	board.setTitle(title);
	board.setWriter(writer);
	board.setRegDate(regDate);
	
	list.add(board);

	pageContext.setAttribute("list",list);  // 데이터를 ${list[0].no}으로 접근해야하는데, 계속 반복하기 위해서는, foreach 사용
}

JDBCClose.close(conn, pstmt); //db 끝내주고. 비즈니스 로직 끝내고 출력임.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel ="stylesheet" href="/Mission-Web/resources/css/board.css" />
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = "writeForm.jsp"
		})
	})
</script>
</head>
<body>
	<header>
		<jsp:include page ="/jsp/include/topMenu.jsp" />
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
			 	<a href="detail(el).jsp?no=${board.no}">
			 	<c:out value = "${board.title }"/>
			 	</a>
			 	</td>
			 	<td>${board.writer }</td>
			 	<td>${board.regDate }</td>
			 	
			</tr>
			</c:forEach>
		</table>
		<br>
		<button id="addBtn">새글등록</button>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>























