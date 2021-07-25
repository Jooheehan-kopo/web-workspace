<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#golist').click(function(){
			location.href="<%= request.getContextPath() %>/list2(el).jsp"
		})
	})
	
	$(document).ready(function(){
		$('#update').click(function(){
			location.href="updateForm.jsp?no=${param.no}"  //+${board.no}
		})
	})
	
	$(document).ready(function(){
		$('#delete').click(function(){
			if(confirm('${param.no} 번 게시글을 삭제할까요?'))
				location.href="delete.jsp?no=${param.no}"  //+${board.no}
		})
	})
	
	
</script>

<link rel ="stylesheet" href="<%= request.getContextPath() %>/resources/css/layout.css" />
<link rel ="stylesheet" href="<%= request.getContextPath() %>/resources/css/board.css" />
</head>
<body>
	<header>
		<%-- <jsp:include page ="/jsp/include/topMenu.jsp" /> --%>
	</header>
	<section>
		<div align="center">
		<hr width="80%">
		<h2>게시판 상세</h2>
		<hr width="80%">
		
		<br>
		<table border ="1">
			<tr> <th width ="25%"> 번호</th>
			<td>${ board.no }</td>
			</tr>
			<tr> <th width ="25%"> 제목</th>
			<td> <c:out value = "${board.title }"/> </td>
			</tr>
			<tr> <th width ="25%"> 작성자</th>
			<td>${board.writer }</td>
			</tr>
			<tr> <th width ="25%"> 내용</th>
			<td><c:out value ="${board.content }"/></td>
			</tr>
			<tr> <th width ="25%"> 조회수</th>
			<td>${board.viewCnt }</td>
			</tr>
			<tr> <th width ="25%"> 등록일</th>
			<td>${board.regDate }</td>
			</tr>
			
			<tr> 
			<th> 첨부파일</th>
			<td>
				<c:forEach items ="${fileList }" var= "file">
				<a href="/Mission-Web/upload/${file.fileSaveName }" download ="${file.fileOriName }"> <!-- 서버저장위치.링크누르면 사진 나옴 -->
					<c:out value ="${file.fileOriName }" />
					(${file.fileSize }bytes)
					</a>
					<br>
					
				</c:forEach>
			</td>
			</tr>
			
			
		
		</table>
		<br>
		
		<button id="golist">목록</button>
		<button id="update">수정</button>
		<button id="delete">삭제</button>
	</div>
	</section>
	<footer>
	<%-- 	<%@ include file="/jsp/include/bottom.jsp" %> --%>
	</footer>
</body>
</html>