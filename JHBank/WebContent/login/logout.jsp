<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	<alert><alert>
	location.href = '<%=request.getContextPath() %>'
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
window.Kakao.init("3be42087f9ef6ce4e9bf0ead0f4319f3");
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>