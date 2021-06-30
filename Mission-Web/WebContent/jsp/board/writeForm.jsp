<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>
<script type="text/javascript"
	src="/Mission-Web/resources/js/jquery-3.6.0.min.js">
	
</script>
<script>
	if ('${userVO}' == '') {
		location.href = "/Mission-Web/jsp/login/login.jsp" //userVO 값이 비어있을때, 로그인이 안되어있을때.
	}
	$(document).ready(function() {
		$('#goListbtn').click(function() {
			location.href = "list2(el).jsp"
		})

	})
	// 위에 안에 넣어주면 안됨. 밖으로 빼줘야함.
	function whenSubmit() {
		let t = document.inputForm
		if (t.title.value == "") {
			alert("제목을 입력하세요!")
			t.title.focus()
			return false
		}
		if (t.writer.value == "") {
			alert("작성자를 입력하세요!")
			t.writer.focus()
			return false
		}
		if (t.content.value == "") {
			alert("내용을 입력하세요!")
			t.content.focus()
			return false
		}

		//파일확장자 체크
		if(checkExt(t.attachfile1))
			return false
		if(checkExt(t.attachfile2))
			return false
			
		return true
	}

	function checkExt(obj) {
		let forbidName = [ 'exe', 'java', 'jsp', 'js', 'class' ]
		let fileName = obj.value
		let ext = fileName.substring(fileName.lastIndexOf('.')+1) //jpg 잘라오기.
		
		for(let i =0; i<forbidName.length; i++){
			if(forbidName[i] ==ext){
				alert(ext+ '확장자는 파일업로드에 정책에 위배됩니다')
				return true
			}
		}
		return false   //확장자명이 담긴 길이만큼, 이름이 위배가 된다면 true 허가받은거면 false.
	}
</script>



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
			<h2>게시글 등록폼</h2>
			<hr width="80%">
			<br>
			<form name="inputForm" action="write.jsp" method="post"
				onsubmit="return whenSubmit()" enctype="multipart/form-data">

				<input type="hidden" name="writer" value="${userVO.id }">
				<table border="1" width="80%">
					<tr>
						<th width="25%">제목</th>
						<td><input type="text" size="60" name="title"></td>
					</tr>
					<tr>
						<th width="25%">작성자</th>
						<td><c:out value="${userVO.id }" /> <%-- <input type="text" size="60" name="writer" value="${userVO.id }" readonly> --%></td>
					</tr>
					<tr>
						<th width="25%">내용</th>
						<td><textarea row="8" cols="60" name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="attachfile1"><br>
							<input type="file" name="attachfile2">
						</td>
					
					</tr>

				</table>
				<input type="submit" value=" 등록"> <input type="button"
					value="목록" id="goListbtn">

			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp"%>
	</footer>


</body>
</html>