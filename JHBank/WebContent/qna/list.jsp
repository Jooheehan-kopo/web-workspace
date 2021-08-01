<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<jsp:include page="/include/head.jsp" />
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<jsp:include page="/include/header.jsp" />

				<section>
					<!-- Table -->
					<header class="major">
						<h2>Q & A</h2>
					</header>



					<div style="text-align: right;">
						<ul class="icons">

							<c:if test="${not empty user_id }">
								<li><a
									href="<%=request.getContextPath()%>/qnaWriteForm.do"
									class="button disabled">새글등록</a></li>
							</c:if>
						</ul>
					</div>


					<div>
						<div class="table-wrapper" style="overflow-x: initial;">

							<table>
								<thead>
									<tr>
										<th style="width: 10%;">글번호</th>
										<th style="width: 50%;">글제목</th>
										<th>글쓴이</th>
										<th>등록일</th>
										<th style="width: 10%;">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="qna">

										<tr>
											<td><c:out value="${qna.q_no }" /></td>
											
											
									<%-- 		<td><c:if test="${qna.type eq 'A' }">
													<c:forEach begin="0" end="${qna.groupDepth - 1}" var="i">
													&nbsp;
												</c:forEach>
													<img
														src="<%=request.getContextPath()%>/images/reply_icon.png"
														width="13px">
												</c:if> <a
												href="<%=request.getContextPath()%>/qna/detail.do?no=${qna.no }">
													<c:out value="${qna.subject }" />
											</a></td --%>
											<td><a href="<%=request.getContextPath()%>/qnaDetail.do?q_no=${qna.q_no }">
											<c:out value="${qna.q_title }"/></a></td>
											<td><c:out value="${qna.user_id }" /></td>
											<td><c:out value="${qna.q_date }" /></td>
											<td><c:out value="${qna.q_viewCnt }" /></td>
										</tr>


									</c:forEach>

								</tbody>
							</table>
							

						</div>



						<ul class="pagination" style="float: none;">

							<c:choose>
								<c:when test="${ startPage le 5 }">
									<li><span class="button disabled">Prev</span></li>
								</c:when>
								<c:otherwise>
									<li><a href="<%=request.getContextPath() %>/qnaList.do?page=${ startPage - 5}" class="button">Prev</a></li>
								</c:otherwise>
							</c:choose>





							<c:forEach begin="${ startPage }" end="${ endPage }" var="i">
								<c:choose>
									<c:when test="${ curPage eq i }">
										<li><a
											href="<%=request.getContextPath() %>/qna/list.do?page=${i}"
											class="page active">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="<%=request.getContextPath() %>/qna/list.do?page=${i}"
											class="page">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>




							<c:choose>
								<c:when test="${ endPage ge totalPage }">
									<li><span class="button disabled">Next</span></li>
								</c:when>
								<c:otherwise>
									<li><a href="<%=request.getContextPath() %>/qna/list.do?page=${ startPage + 5}" class="button">Next</a></li>
								</c:otherwise>
							</c:choose>
						
						
						</ul>









					</div>











				</section>






			</div>
		</div>

	</div>

	<!-- Scripts -->
	<jsp:include page="/include/script.jsp" />
</body>
</html>