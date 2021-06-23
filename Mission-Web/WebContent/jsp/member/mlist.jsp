<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Connection conn = new ConnectionFactory().getConnection();
StringBuilder sql = new StringBuilder();
sql.append(" select ID, NAME, EMAIL_ID||EMAIL_DOMAIN, to_char(REG_DATE, 'yyyy-mm-dd') as REG_DATE ");
sql.append("  from members ");

PreparedStatement pstmt = conn.prepareStatement(sql.toString());
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#addmem').click(function() {
			location.href = "signin.jsp"
		})
	})
</script>

</head>
<body>
	<div align="center">
		<hr width ="80%">
		<h2> * 회원목록 * </h2>
		<hr width ="80%">
		<br>
		<table border="1" style= "width=80%">
			<tr>
				<th width="11%">아이디</th>
				<th width="11%">이름</th>
				<th >이메일</th>
				<th width="11%">가입일자</th>
			
			</tr>
	
			<% while (rs.next()){
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String email= rs.getString("EMAIL_ID||EMAIL_DOMAIN");
				String regdate = rs.getString("REG_DATE");
			%>
			<tr>
				<td><%=id%></td>
				<td><a href= "minfo.jsp?ID=<%=id%>"><%=name%></a></td>
				<td><%=email%></td>
				<td><%=regdate%></td>
				
			</tr>
			<%
			} 
			%>
						
		</table>
		<br>
		<button id="addmem">회원등록</button>
	
	</div>
</body>
</html>
<%
JDBCClose.close(conn,pstmt);
%>