<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("phone","010-2222-2222"); //include test도 볼공시픙
	
	//파라미터 보는 방법 두가지 :
		//1. 
%>
<hr>
request 공유영역 id : ${id }<br>
<strong>날라온 파라미터 정보</strong><br>
name : ${param.name }<br>
age: ${param.age }<br>
<h3>인클르두된 내용</h3>
<h3>인클르두된 내용</h3>
<h3>인클르두된 내용</h3>
<h3>인클르두된 내용</h3>
<h3>인클르두된 내용</h3>
<h3>인클르두된 내용</h3>
<hr>
