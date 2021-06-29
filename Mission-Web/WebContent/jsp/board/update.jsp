<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 작업순서.
    1. 파라미어(제목, 작성자, 내용 추출)
    2. 추출된 데이터를 db t_board에 삽입
    3. 목록페이지 이동 --%>
<%
request.setCharacterEncoding("utf-8");

String title = request.getParameter("title");
String writer = request.getParameter("writer");  //인풋으로 받지 않지만, 세션에 있음. 가져올 수 있음..
String content = request.getParameter("content");
int no = Integer.parseInt(request.getParameter("no"));

BoardVO board = new BoardVO();

board.setTitle(title);
board.setWriter(writer);
board.setContent(content);
board.setNo(no);

BoardDAO dao = new BoardDAO();
dao.update(board);

%>

<script>
	alert('글이 수정되었습니다.')
	location.href = "list2(el).jsp"
</script>