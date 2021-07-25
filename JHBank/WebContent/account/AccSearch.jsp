<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<jsp:include page="/include/head.jsp" />
<!--  <!-- Bootstrap CSS -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> --> 

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

 <style type="text/css">
        * {
            font-family: 'Stylish', sans-serif;
        }

        .wrap {
        	
            width: 900px;
            margin: 0px auto; 
          	display: block;
        }
        
    	.card{
    	position: relative;
    	}
      
    </style>
    
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
						<h1>전체계좌조회</h1>
					</header>
					<span class="image main"><img src="<%=request.getContextPath() %>/images/pic11.jpg" alt="" /></span>
					<!-- <p><input type="text" name= "user_id" placeholder="아이디 입력">님이 현재보유한 계좌 정보입니다.</p>
					<button type="submit">조회</button> // 아이디 값을 못받아와서 입력하게끔 하는중 -->
				</div>
			</section>


		<body>
<div class="wrap">
    
    <div class="card-columns">
        <div class="card">
				
				<div class="card-body">
					<a href="" class="card-title"></a>
					<c:out value="${bank.user_id }"/><p class="card-text comment">  전체 계좌정보입니다</p>
					<table>
						
						<tr>
							<td>개설일자</td>
							<td>은행명</td>
							<td>계좌번호</td>
							<td>계좌명</td>
							<td>잔액</td>
						</tr>
						<c:forEach items="${list}" var="account">
						<tr>
							<td><c:out value="${account.bank_name }" /></td>
							<td><c:out value="${account.acc_no }" /></td>
							<td><c:out value="${account.acc_name }" /></td>
							<td><c:out value="${account.acc_date }" /></td>
							<td><c:out value="${account.acc_money }"></c:out></td>
						</tr>
						</c:forEach>
					
					</table>

				</div>
			</div>
        



		</div>
	</div>

	<jsp:include page="/include/script.jsp" />
</body>
</html>
