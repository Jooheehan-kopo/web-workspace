<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<style>
#reply{
	width:90%;
	top:30px;
	left:100px;
	position: relative;

}
</style>

<jsp:include page="/include/head.jsp" />
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<jsp:include page="/include/header.jsp" />
				
		<!-- Menu -->
		<jsp:include page="/include/menu.jsp" />
				
				<script>
	$(document).ready(function(){
		$('#golist').click(function(){
			location.href="<%= request.getContextPath() %>/qna/list.jsp"
		})
	})
	
	$(document).ready(function(){
		$('#update').click(function(){
			location.href="updateForm.jsp?q_no=${param.no}"  //+${board.no}
		})
	})
	
	$(document).ready(function(){
		$('#delete').click(function(){
			if(confirm('${param.no} 번 게시글을 삭제할까요?'))
				location.href="delete.jsp?q_no=${param.no}"  //+${board.no}
		})
	})
	
	
</script>

				<section>
					<!-- Table -->
					<header class="major">
						<h2>Q & A</h2>
					</header>

					<div style="text-align: right;">
						<ul class="icons">
							<c:if test="${not empty user_id }">
								<li><a href="<%=request.getContextPath()%>/qna/answerForm.do?no=${vo.q_no}"
									class="button small">답글</a></li>
							</c:if>

							<c:if test="${user.id eq vo.user_id}">
								<li><a href="<%=request.getContextPath()%>/qna/update.do"
									class="button small">수정</a></li>
							</c:if>
						</ul>
					</div>


					<div class="box">

						<h2>
							<c:out value="${vo.q_title }" />
						</h2>


						<ul class="icons" style="font-size: 11px;text-align: right">
							<li><h3>작성자 : <c:out value="${vo.user_id }" /></h3></li>
							<li><h3>작성일 : <c:out value="${vo.q_date }" /></h3></li>
							<li><h3>조회수 : <c:out value="${vo.q_viewCnt }" /></h3></li>
						</ul>




						<hr class="major" style="margin-top: 0px;" />
						<p>
							<c:out value="${vo.q_content }" />
						</p>
						
					</div>
		<button id="golist">목록</button>
		<button id="update">수정</button>
		<button id="delete">삭제</button>

				</section>
				
				<section>
				<div class="box" id="reply">
				<hr class="major" style="margin-top: 0px;" />
						<p>
							답글<c:out value="${vo.q_content }" />
						</p>
				</div>
				</section>

			</div>
		</div>

	

	</div>

	<!-- Scripts -->
	<jsp:include page="/include/script.jsp" />
	
	
</body>
</html>

	