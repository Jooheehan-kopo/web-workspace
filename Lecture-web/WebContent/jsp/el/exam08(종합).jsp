<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//String [] boardList ={"가","나","다"};
//pageContext.setAttribute("boardList", boardList);

/*
//1. 자바빈즈+클래스 (일반적)

BoardVO board = new BoardVO();
board.setTitle("성공");
List<BoardVO> boardlist = new ArrayList<BoardVO>();

boardlist.add(board);
*/

/*
//2. 자바빈즈 + 배열
BoardVO board = new BoardVO();
board.setTitle("성공");
BoardVO[] boardList = new BoardVO[]{board};
*/


/*
//3. 맵객체 + 배열

Map<String, String> board = new HashMap<>();
board.put("title", "성공");
Map[] boardList = {board};
*/


//4. 맵객체+ 콜랙션

Map<String, String> board = new HashMap<>();
board.put("title", "성공");
List<Map<String,String>> boardList = new ArrayList<>();
boardList.add(board);

pageContext.setAttribute("boardList", boardList);



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	성공/실패 ? ${boardList[0].title}
	<br>
</body>
</html>