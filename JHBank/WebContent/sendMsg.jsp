<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>카톡 공유</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
    <input type="button" onClick="sendLinkCustom();" value="확인"/>
    <input type="button" onClick="sendLinkDefault();" value="Default"/>

<script type="text/javascript">
    function sendLinkCustom() {
        Kakao.init("3be42087f9ef6ce4e9bf0ead0f4319f3");
        Kakao.Link.sendCustom({
            templateId: 58320
        });
    }
</script>

<script>
try {
  function sendLinkDefault() {
    Kakao.init('3be42087f9ef6ce4e9bf0ead0f4319f3')
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '성진이 사랑해',
        description: '#보고싶오',
        imageUrl:
          'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845,
      },
      buttons: [
        {
          title: '안아주기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
        {
          title: '뽀뽀',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
      ],
    })
  }
; window.kakaoDemoCallback && window.kakaoDemoCallback() }
catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
</script>
   
</body>
</html>
