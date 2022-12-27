<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("WbaAQBDo9LlefnPLWxvr", "http://localhost:8084/FirstProject/navercallback.do");
  // 접근 토큰 값 출력
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    
	var pwValue = naver_id_login.getProfileData('id');
	var email = naver_id_login.getProfileData('email');
	var nickname = naver_id_login.getProfileData('nickname');
	var birthdayValue = naver_id_login.getProfileData('birthday');
	var birthyearValue = naver_id_login.getProfileData('birthyear');
  
	console.log(email)
  $.ajax({
	  url: 'naverLogin.do',
	  data: {
		  id: email,
		  pw: pwValue,
		  birthday: birthdayValue,
		  birthyear: birthyearValue,
		  nick: nickname
	  },
	  type: 'post',
	  success: function(res){
		  window.opener.location.href = res;
		  window.close();
	  },
	  error: function(e){
		  
	  }
	  
	  
	  
  });
    
    
    
    
  }

</script>
</body>
</html>