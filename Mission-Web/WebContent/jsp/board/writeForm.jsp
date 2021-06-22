<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>
<script type="text/javascript"
	src="/Mission-Web/resources/js/jquery-3.6.0.min.js">
	
</script>
<script>
	$(document).ready(function() {
		$('#goListbtn').click(function() {
			location.href = "list.jsp"
		})

	})
// 위에 안에 넣어주면 안됨. 밖으로 빼줘야함.
	function whenSubmit() {
		let t = document.inputForm
		if (t.title.value == "") {
			alert("제목을 입력하세요!")
			return false
		}
		if (t.writer.value == "") {
			alert("작성자를 입력하세요!")
			return false
		}
		if (t.content.value == "") {
			alert("내용을 입력하세요!")
			return false
		}
		return true
	}
</script>


</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>게시글 등록폼</h2>
		<hr width="80%">
		<br>
		<form name="inputForm" action="write.jsp" method="post"
			onsubmit="return whenSubmit()">
			<table border="1" width="80%">
				<tr>
					<th width="25%">제목</th>
					<td><input type="text" size="60" name="title"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td><input type="text" size="60" name="writer"></td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td><textarea row="8" cols="60" name="content"></textarea></td>
				</tr>

			</table>
			<input type="submit" value=" 등록"> <input type="button"
				value="목록" id="goListbtn">

		</form>
	</div>
</body>
</html>