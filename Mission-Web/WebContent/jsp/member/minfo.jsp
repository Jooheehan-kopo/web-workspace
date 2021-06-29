<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


/* MemberVO member = new MemberVO(String id,String name, String email,String phone,String post,
		String addr1,String addr2,String type,String regDate); */
request.setCharacterEncoding("utf-8");
String memId = request.getParameter("ID");
System.out.println(memId);
MemberDAO dao = new MemberDAO();
MemberVO member = dao.memInfo(memId);
		
pageContext.setAttribute("member",member);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr width="80%">
			<h2>회원 상세정보</h2>
			<hr width="80%">
			<br>
			<table border="1">
				<tr>
					<th width="25%">아이디</th>
					<td>${ member.id }</td>
				</tr>
				<tr>
					<th width="25%">이름</th>
					<td>${member.name }</td>
				</tr>
				<tr>
					<th width="25%">이메일</th>
					<td>${member.email }</td>
				</tr>
				<tr>
					<th width="25%">전화번호</th>
					<td>${member.phone }</td>
				</tr>
				<tr>
					<th width="25%">우편번호</th>
					<td>${member.post }</td>
				</tr>
				<tr>
					<th width="25%">주소</th>
					<td>${member.addr1 }</td>
				</tr>
				<tr>
					<th width="25%">세부 주소</th>
					<td>${member.addr2 }</td>
				</tr>
				<tr>
					<th width="25%">타입</th>
					<td>${member.type }</td>
				</tr>
				<tr>
					<th width="25%">가입일자</th>
					<td>${member.regDate }</td>
				</tr>

			</table>
			<br>


		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp"%>
	</footer>

</body>
</html>