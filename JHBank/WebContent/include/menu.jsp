<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Menu -->
<nav id="menu">
	<ul class="links">
		<li><a href="<%=request.getContextPath() %>/main.jsp">Home</a></li>
		<li><a href="<%=request.getContextPath()%>/accsearch.do">계좌조회</a></li>
		<li><a href="generic.html">계좌이체</a></li>
		<li><a href="elements.html">마이페이지</a></li>
	</ul>
	<c:choose>
		<c:when test="${ empty sessionScope.userVO }">
			<ul class="actions stacked">
				<li><a href="<%=request.getContextPath()%>/joinnew.do"	class="button primary fit">Get Started</a></li>
				<li><a href="<%=request.getContextPath()%>/login.do" class="button fit">Log In</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<li><c:out value="${userVO.user_id }"/>님</li>
				<li><a href="<%=request.getContextPath()%>/logout.do" class="button fit">Logout</a></li>
			</ul>
		</c:otherwise>
		
	</c:choose>

</nav>