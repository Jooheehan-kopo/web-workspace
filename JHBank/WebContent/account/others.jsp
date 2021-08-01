<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>



<jsp:include page="/include/head.jsp"/>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

	
 <jsp:include page="/include/top-title.jsp"/>
 
 
		<!-- Menu -->
	<jsp:include page= "/include/menu.jsp"/>

		<!-- Banner -->
		<section id="banner" class="major">
			<div class="inner">
				<header class="major">
					<h2>다른은행 바로가기</h2>
				</header>
				<div class="content">
				
					<ul class="actions">
						<li><a href="#one" class="button next scrolly">click</a></li>
					</ul>
				</div>
			</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			
			<!-- Two -->
			<section id="two">
				<div class="inner">
					<header class="major">
						<h2>은행목록</h2>
					</header>
					<p><img src="<%=request.getContextPath() %>/images/joy.png"/></p>
					<ul class="actions">
						<li><a href="http://192.168.217.46:8080/Account-Info/" class="button next">조이은행 이동</a></li>
					</ul>
					<p><img src="<%=request.getContextPath() %>/images/haon.png"/></p>
					<ul class="actions">
						<li><a href="http://192.168.217.48:9999/Banking-Web/index.jsp" class="button next">하온은행 이동</a></li>
					</ul>
				</div>
			</section>

		</div>

		<!-- Contact -->
		

		<!-- Footer -->
		

	</div>

	<!-- Scripts -->
	<jsp:include page ="/include/script.jsp"/>
</body>
