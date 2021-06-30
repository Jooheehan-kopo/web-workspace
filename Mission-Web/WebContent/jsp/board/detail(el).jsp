<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%-- http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=2 
	1. 파라미터에서 조회하고자하는 게시글 번호를 먼저 추출해야함.  request.getParameter
	2. 추출하려는 게시글 번호를 가지고와서(키보드..?)
	3. 화면에 보여줌.
	--%>
	<%
	
	
/* 	
	
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

 */

int boardNo = Integer.parseInt(request.getParameter("no"));  //문자열임. 정수로 뽑고싶은것 parseint로 바꿔줌
String type = request.getParameter("type"); // 조회수 관련 (from list)
BoardDAO dao = new BoardDAO();

//** 게시물 조회수 증가. 전체게시글목록에서 왔을때만. (내가 게시글 눌럿을때만 조회수 증가!!!!!!)
if(type != null && type.equals("list"))
	dao.updateViewCnt(boardNo);

//2-2 테이블에서 해당 게시물 조회.
BoardVO board= dao.detail(boardNo);

// 2-3 t_board_file테이블에서 게시물의 첨부파일 조회
List<BoardFileVO>fileList = dao.selectFileByNo(boardNo);
pageContext.setAttribute("board",board);
pageContext.setAttribute("fileList",fileList);
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#golist').click(function(){
			location.href="list2(el).jsp"
		})
	})
	
	$(document).ready(function(){
		$('#update').click(function(){
			location.href="updateForm.jsp?no=${param.no}"  //+${board.no}
		})
	})
	
	$(document).ready(function(){
		$('#delete').click(function(){
			if(confirm('${param.no} 번 게시글을 삭제할까요?'))
				location.href="delete.jsp?no=${param.no}"  //+${board.no}
		})
	})
	
	
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
		<h2>게시판 상세</h2>
		<hr width="80%">
		
		<br>
		<table border ="1">
			<tr> <th width ="25%"> 번호</th>
			<td>${ board.no }</td>
			</tr>
			<tr> <th width ="25%"> 제목</th>
			<td> <c:out value = "${board.title }"/> </td>
			</tr>
			<tr> <th width ="25%"> 작성자</th>
			<td>${board.writer }</td>
			</tr>
			<tr> <th width ="25%"> 내용</th>
			<td><c:out value ="${board.content }"/></td>
			</tr>
			<tr> <th width ="25%"> 조회수</th>
			<td>${board.viewCnt }</td>
			</tr>
			<tr> <th width ="25%"> 등록일</th>
			<td>${board.regDate }</td>
			</tr>
			
			<tr> 
			<th> 첨부파일</th>
			<td>
				<c:forEach items ="${fileList }" var= "file">
				<a href="/Mission-Web/upload/${file.fileSaveName }"> <!-- 서버저장위치.링크누르면 사진 나옴 -->
					<c:out value ="${file.fileOriName }" />
					(${file.fileSize }bytes)
					</a>
					<br>
					
				</c:forEach>
			</td>
			</tr>
			
			
		
		</table>
		<br>
		
		<button id="golist">목록</button>
		<button id="update">수정</button>
		<button id="delete">삭제</button>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>






