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
<head>
<title>JH BANK</title>

<style>
img {
	position: relative;
	top: 14px;
}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<!-- <header id="header" class="alt">
			<a href="main.jsp" class="logo"><img src="./images/JHlogo2.png"
				width="120" height="30"> <span>JH 조흔은행</span></a>
			<nav>
				<a href="#menu">Menu</a>
			</nav>
		</header>
 -->
		<jsp:include page="/include/header.jsp" />


		<!-- Menu -->
		<jsp:include page="/include/menu.jsp" />

		<!-- Banner -->
		<section id="banner" class="major">
			<div class="inner">
				<header class="major">
					<h1>내 손안의 작은 은행, JH 은행입니다.</h1>
				</header>
				<div class="content">
					<p>오픈뱅킹 서비스로 보다 손쉬운 금융생활!</p>
					<ul class="actions">
						<li><a href="#one" class="button next scrolly">시작하기</a></li>
					</ul>
				</div>
			</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles">
				<article>
					<span class="image"> <img src="images/pic01.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="<%=request.getContextPath()%>/accnew.do" class="link">계좌만들기</a>
						</h3>
						<p>조흔은행 계좌가 아직 없으시다면?! 계좌생성하러가기</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic02.jpg" alt="" />
					</span>
					<header class="major">
					
						<h3>
							<a href="<%=request.getContextPath() %>/acctrans.do" class="link">계좌이체</a>
						</h3>
						<p>보다 간편하고 빠르게 계좌이체하세요!</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic03.jpg" alt="" />
					</span>
					<header class="major">
					<c:choose>
						<c:when test="${ empty sessionScope.userVO }">
						<h3>	
							<a href="<%=request.getContextPath() %>/login.do" class="link" onclick="dologin()">전체계좌조회</a>
						</h3>
						</c:when>
						<c:otherwise>						
						<h3>
							<a href="<%=request.getContextPath()%>/accsearch.do" class="link">전체계좌조회</a>
						</h3>
						<p>나의 전체 계좌조회를 통해 한눈에 목록 확인!</p>
						</c:otherwise>
					</c:choose>
					
					</header>
				</article>
			
				<article>
					<span class="image"> <img src="images/pic05.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="<%=request.getContextPath() %>/qnaList.do" class="link">Q&A 및 공유게시판</a>
						</h3>
						<p>질문/소통 자유게시판</p>
					</header>
				</article>
					<article>
					<span class="image"> <img src="images/pic04.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="<%=request.getContextPath() %>/account/others.jsp" class="link">다른은행 바로가기</a>
						</h3>
						<p>조이은행 / 하온은행</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic06.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">마이페이지</a>
						</h3>
						<p>나의 개인정보를 수정하고 싶다면?</p>
					</header>
				</article>
			</section>

			<!-- Two -->
			<section id="two">
				<div class="inner">
					<header class="major">
						<h2>Massa libero</h2>
					</header>
					<p>Nullam et orci eu lorem consequat tincidunt vivamus et
						sagittis libero. Mauris aliquet magna magna sed nunc rhoncus
						pharetra. Pellentesque condimentum sem. In efficitur ligula tate
						urna. Maecenas laoreet massa vel lacinia pellentesque lorem ipsum
						dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et
						sagittis libero. Mauris aliquet magna magna sed nunc rhoncus amet
						pharetra et feugiat tempus.</p>
					<ul class="actions">
						<li><a href="landing.html" class="button next">Get
								Started</a></li>
					</ul>
				</div>
			</section>

		</div>

		<!-- Contact -->
		<section id="contact">
			<div class="inner">
				<section>
					<form method="post" action="#">
						<div class="fields">
							<div class="field half">
								<label for="name">Name</label> <input type="text" name="name"
									id="name" />
							</div>
							<div class="field half">
								<label for="email">Email</label> <input type="text" name="email"
									id="email" />
							</div>
							<div class="field">
								<label for="message">Message</label>
								<textarea name="message" id="message" rows="6"></textarea>
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send Message"
								class="primary" /></li>
							<li><input type="reset" value="Clear" /></li>
						</ul>
					</form>
				</section>
				<section class="split">
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-envelope"></span>
							<h3>Email</h3>
							<a href="#">information@untitled.tld</a>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-phone"></span>
							<h3>Phone</h3>
							<span>(000) 000-0000 x12387</span>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-home"></span>
							<h3>Address</h3>
							<span>1234 Somewhere Road #5432<br /> Nashville, TN 00000<br />
								United States of America
							</span>
						</div>
					</section>
				</section>
			</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<ul class="icons">
					<li><a href="#" class="icon brands alt fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands alt fa-facebook-f"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands alt fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands alt fa-github"><span
							class="label">GitHub</span></a></li>
					<li><a href="#" class="icon brands alt fa-linkedin-in"><span
							class="label">LinkedIn</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Untitled</li>
					<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
		function dologin(){
			
			alert("로그인 후 이용하세요.")
		}
		
	</script>

</body>
</html>