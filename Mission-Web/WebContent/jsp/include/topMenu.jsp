<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" style="width: 100%; height:100%">
	<tr>
		<td rowspan="2" style="width:12%" >
			<img src="/Mission-Web/resources/img/logo.png" style="height:85px">
		</td>
		
		<td align="right">
		
		즐겨찾기 
		<c:if test="${not empty userVO }">
		
			[${userVO.name}] 님으로 로그인중..
		</c:if>
		
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				<c:if test="${userVO.type eq 'S' }">
				<a href="/Mission-Web/jsp/member/mlist.jsp">회원관리</a> || 
				</c:if>
				<a href="/Mission-Web/jsp/board/list2(el).jsp">게시판</a> ||
				<c:choose>
					<c:when test="${empty userVO }">
						 <a href="/Mission-Web/jsp/member/joinNew.jsp">회원가입</a> || 
						<a href="/Mission-Web/jsp/login/login.jsp">로그인</a> || 
					</c:when>
					<c:otherwise>
						 마이페이지 || 
						 <a href ="/Mission-Web/jsp/login/logout.jsp">로그아웃</a>
						  
				 	</c:otherwise>
				 </c:choose>
			</nav>
		</td>
	</tr>
</table>