<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%-- http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=2 
	1. 파라미터에서 조회하고자하는 게시글 번호를 먼저 추출해야함.  request.getParameter
	2. 추출하려는 게시글 번호를 가지고와서(키보드..?)
	3. 화면에 보여줌.
	--%>
	<%
	//게시물번호 추출
	int boardNo = Integer.parseInt(request.getParameter("no"));  //문자열임. 정수로 뽑고싶은것 parseint로 바꿔줌
	
	//2. 데이터베이스 테이블에서 게시물 조회. 접속하여 객체 가져오기
	Connection conn= new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, content, view_cnt ");
	sql.append("   , to_char(reg_date, 'yyyy-mm-dd')as reg_date ");
	sql.append("  from t_board ");
	sql.append(" where no =?  ");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1,boardNo);
	ResultSet rs = pstmt.executeQuery();  //클릭으로 가면 최소 한개행...?
			
	rs.next(); // 내가 추출한 행을 가리킴   
	int no = rs.getInt("no");
	String title = rs.getString("title");
	String writer = rs.getString("writer");
	String content = rs.getString("content");
	int viewCnt = rs.getInt("view_cnt");
	String regDate = rs.getString("reg_date");
	
//	pageContext.setAttribute("no", no); //no 라는 이름으로 no값 지정
//	pageContext.setAttribute("title",title);
//	pageContext.setAttribute("writer",writer);
//	pageContext.setAttribute("content",content);
//	pageContext.setAttribute("viewCnt",viewCnt);
//	pageContext.setAttribute("regDate",regDate);

JDBCClose.close(conn,pstmt);  

BoardVO board = new BoardVO(no,title,writer,content,viewCnt,regDate);

pageContext.setAttribute("board",board);
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>게시판 상세</h2>
		<hr width="80%">
		
		<br>
		<table border ="1">
			<tr> <th width ="25%"> 번호</th>
			<td>${ board.no }</td>
			</tr>
			<tr> <th width ="25%"> 제목</th>
			<td>${board.title } </td>
			</tr>
			<tr> <th width ="25%"> 작성자</th>
			<td>${board.writer }</td>
			</tr>
			<tr> <th width ="25%"> 내용</th>
			<td>${board.content }</td>
			</tr>
			<tr> <th width ="25%"> 조회수</th>
			<td>${board.viewCnt }</td>
			</tr>
			<tr> <th width ="25%"> 등록일</th>
			<td>${board.regDate }</td>
			</tr>
		
		</table>
	</div>
</body>
</html>