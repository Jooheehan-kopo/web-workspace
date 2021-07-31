<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JH BANK 로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Muli:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">
</head>

<body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		window.Kakao.init("3be42087f9ef6ce4e9bf0ead0f4319f3");
		
		function kakaoLogin(){
			
			window.Kakao.Auth.login({
				scope:'profile_nickname, account_email, gender',
				success: function (authObj) {
					console.log(authObj.email);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
						}
					});
					
				}
			});
		}
	</script>



    <div class="main-container">
        <div class="form-container">

            <div class="form-body">

                <h2 class="title">Log in with</h2>


				<form action="<%=request.getContextPath() %>/socialLogin.do" method="post" class="the-form">
	                <div class="social-login">
	                    <ul>
	                        <li class="fb"><a href ="javascript:kakaoLogin();">kakaoTalk</a></li>
	                        <li class="google"><a href="#">Google</a></li>
	                    </ul>
	                </div><!-- SOCIAL LOGIN -->
                </form>

                <div class="_or">or</div>

                <form action="<%=request.getContextPath() %>/loginProcess.do" method="post" class="the-form">

                    <label for="id">아이디</label>
                    <input type="text" name="user_id" id="user_id" placeholder="아이디를 입력하세요">

                    <label for="password">비밀번호</label>
                    <input type="password" name="user_pw" id="user_pw" placeholder="비밀번호를 입력하세요.">

                    <input type="submit" value="Log In">

                </form>

            </div><!-- FORM BODY-->

            <div class="form-footer">
                <div>
                    <span>Don't have an account?</span> <a href="">Sign Up</a>
                </div>
            </div><!-- FORM FOOTER -->

        </div><!-- FORM CONTAINER -->
    </div>

</body>
</html>