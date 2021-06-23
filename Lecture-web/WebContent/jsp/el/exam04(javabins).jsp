<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    BoardVO board = new BoardVO();
    board.setNo(1);
    board.setTitle("test");
    //pageContext 영역 이름: boardVO 값 : 생성된 BoardVO
    
    pageContext.setAttribute("boardVO", board);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	no : <%= board.getNo() %><br>
	no : <%= ((BoardVO)pageContext.getAttribute("boardVO")).getNo() %><br>
	
	title: <%= board.getTitle() %><br>
	title: <%= ((BoardVO)pageContext.getAttribute("boardVO")).getTitle() %><br>
	
	el no: ${boardVO.no}<br>
	el title: ${boardVO.title }<br>
	el title: ${boardVO['title'] }<br>
	
<%-- el aaa: ${boardVO.aaa }<br> --%>	
</body>
</html>