<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<jsp:include page="/include/head.jsp" />

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">


		<jsp:include page="/include/header.jsp" />


		<!-- Menu -->
		<jsp:include page="/include/menu.jsp" />
		<!-- Main -->
		<div id="main" class="alt">

			<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h1>계좌개설</h1>
					</header>
					<span class="image main"><img src="images/pic11.jpg" alt="" /></span>
					<p>나만의 계좌 생성하기!</p>
				</div>
			</section>

		</div>



		
		
		
		<!-- Contact -->
		<section id="contact">
			<div class="inner">
				<section>
					<form method="post" action="<%=request.getContextPath()%>/accnew.do" >
						<div class="fields">
							<div class="field">
								<label for="user_id">회원 아이디</label> <input type="text" name="user_id" id="id" placeholder="id"  />
							</div>
							<div class="field">
								<label for="bank_name">개설 은행선택</label>
								<select name="bank_code">
									<option value="" selected disabled="disabled">은행선택</option>
									<option value="111">조흔</option>
									<option value="222">조이</option>
									<option value="333">하온</option>
								</select>
							</div>
							<div class="field">
								<label for="user_id">계좌 비밀번호</label> 
								<input type="text" name="acc_pw" id="acc_pw" placeholder="계좌 생성시 사용할 비밀번호를 입력하세요"  />
							</div>
							<div class="field">
								<label for="user_id"></label> 
								<input type="text" name="" id="acc_pw" placeholder="비밀번호를 다시 한번 입력하세요" />
							</div>
							
							<div class="field">
								<label for="acc_name">계좌명</label> 
								<input type="text" name="acc_name" id="acc_name" placeholder="생성할 계좌의 별칭을 입력하세요" />
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" value="계좌 생성" class="primary" /></li>
							<li><input type="reset" value="취소" /></li>
						</ul>
					</form>
				</section>
				
			</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				
				<ul class="copyright">
					<li>&copy; JH BANK</li>
					<li>바로가기: <a href="main.jsp">JH 조흔은행</a></li>
				</ul>
			</div>
		</footer>
	</div>

	<!-- Scripts -->
	<jsp:include page="/include/script.jsp" />
</body>
</html>