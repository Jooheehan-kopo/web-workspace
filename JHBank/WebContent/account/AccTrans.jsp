<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<jsp:include page="/include/head.jsp" />

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<style>
html, body {
	min-height: 100%;
}

body, div, form {
	padding: 0;
	margin: 0;
	outline: none;
	font-family: Roboto, Arial, sans-serif;
	font-size: 14px;
	color: white;
	line-height: 22px;
}

h1 {
	margin: 15px 0;
	font-weight: 400;
}

.testbox {
	display: flex;
	justify-content: center;
	align-items: center;
	height: inherit;
	padding: 3px;
}

form {
	width: 70%;
	padding: 20px;
	background: #fff;
	box-shadow: 0 2px 5px #ccc;
}

input, select, textarea {
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input {
	width: calc(100% - 10px);
	padding: 5px;
}

select {
	width: 100%;
	padding: 7px 0;
	background: transparent;
}

textarea {
	width: calc(100% - 6px);
}

.item {
	position: relative;
	margin: 10px 0;
}

.item:hover p, .item:hover i {
	color: #095484;
}

input:hover, select:hover, textarea:hover {
	box-shadow: 0 0 5px 0 #095484;
}

.btn-block {
	margin-top: 20px;
	text-align: center;
}

button,#ka {
	width: 150px;
	padding: 10px;
	border: none;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: #095484;
	font-size: 16px;
	color: #fff;
	cursor: pointer;
}

button:hover {
	background-color: #0666a3;
}

@media ( min-width : 568px) {
	.name-item, .city-item, .bank {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	.name-item input, .city-item input {
		width: calc(50% - 20px);
	}
	.city-item select {
		width: calc(50% - 8px);
	}
	h2, p, input, select {
		color: black;
	}
	input::placeholder {
		color: green;
	}
	input::-webkit-input-placeholder {
		color: green;
	}
	input:-ms-input-placeholder {
		color: green;
	}
	textarea::placeholder {
		color: green;
	}
	textarea::-webkit-input-placeholder {
		color: green;
	}
	textarea:-ms-input-placeholder {
		color: green;
	}
}
</style>
<script>
	function send(){
		
		location.href="<%=request.getContextPath()%>/main.jsp"
	}

</script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
    function sendLinkCustom() {
        Kakao.init("3be42087f9ef6ce4e9bf0ead0f4319f3");
        Kakao.Link.sendCustom({
            templateId: 58320
        });
    }
</script>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">


		<jsp:include page="/include/header.jsp" />


		<!-- Menu -->
		<jsp:include page="/include/menu.jsp" />
		<!-- Main -->
		<section id="one">
			<div class="inner">
				<header class="major">
					<h1>????????????</h1>
				</header>
			</div>
		</section>

		<div class="testbox">
			<form action="<%=request.getContextPath()%>/acctransPro.do">
				<h2>JH ????????????</h2>
				<!-- ~??? -->
				<div class="item">
					<div class="bank">
						<p>?????? ????????????</p>
						<select name="m_bank_code">
							<option value="" >?????????</option>
							<option value="111">??????</option>
							<option value="222">??????</option>
							<option value="333" >??????</option>
						</select> <input type="text" name="acc_no" placeholder="??????????????? ???????????????" />
						<p>??????????????? ??????</p>
						<h4><c:out value=""></c:out></h4>
					</div>



					<div class="item">
						<p>?????? ??????</p>
						<select name="t_bank_code">
							<option value="" >?????????</option>
							<option value="111" >??????</option>
							<option value="222" >??????</option>
							<option value="333" >??????</option>
						</select>
						<p>????????????</p>
						<input type="text" name="send_acc_no" placeholder="?????? ????????? ???????????????" />
					
						<p>?????? ??????</p>
						<input type="number" name="trans_money" placeholder="????????? ????????? ???????????????" />

					</div>
				</div>
				<div class="btn-block">
  					<!-- <input type="button" onClick="sendLinkCustom(); send();" value="??????" id="ka"/> -->
					<button type="submit" onclick="sendLinkCustom(); send();">??????</button>
					<button type="reset">??????</button>
				</div>
			</form>
		</div>
	</div>
</body>

<!--script  -->
<jsp:include page="/include/script.jsp" />
</body>
</html>
