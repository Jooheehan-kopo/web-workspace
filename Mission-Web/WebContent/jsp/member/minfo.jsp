<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String mem_id = request.getParameter("ID");

Connection conn = new ConnectionFactory().getConnection();
StringBuilder sql = new StringBuilder();
sql.append(" select id , name , password , EMAIL_ID||email_domain , tel1||tel2||tel3 , post , basic_addr , detail_addr , type ");
sql.append(" , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
sql.append(" from members ");
sql.append(" where id = ? ");
PreparedStatement pstmt = conn.prepareStatement(sql.toString());
pstmt.setString(1, mem_id);

ResultSet rs = pstmt.executeQuery();
rs.next();

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
		<h2>회원 상세정보</h2>
		<hr width="80%">
		<br>
				<table border="1">
			<tr>
				<th width="25%">아이디</th>
				<td><%=rs.getString("id")%></td>
			</tr>
			<tr>
				<th width="25%">이름</th>
				<td><%=rs.getString("name")%></td>
			</tr>
			<tr>
				<th width="25%">이메일</th>
				<td><%=rs.getString("EMAIL_ID||email_domain")%></td>
			</tr>
			<tr>
				<th width="25%">전화번호</th>
				<td><%=rs.getString("tel1||tel2||tel3")%></td>
			</tr>
			<tr>
				<th width="25%">우편번호</th>
				<td><%=rs.getString("post")%></td>
			</tr>
			<tr>
				<th width="25%">주소</th>
				<td><%=rs.getString("basic_addr")%></td>
			</tr>
			<tr>
				<th width="25%">세부 주소</th>
				<td><%=rs.getString("detail_addr")%></td>
			</tr>
			<tr>
				<th width="25%">타입</th>
				<td><%=rs.getString("type")%></td>
			</tr>
			<tr>
				<th width="25%">가입일자</th>
				<td><%=rs.getString("reg_date")%></td>
			</tr>

		</table> 
		<br>


	</div>
</body>
</html>