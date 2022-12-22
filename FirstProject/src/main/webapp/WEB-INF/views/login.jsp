<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Login</title>
    <style>
        @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }
body{background-color: #f4f3ef;
     margin: 0; overflow-y: hidden; font-family: 'LINESeedKR-Bd';}
     #wrap{width: 100%; height: 100vh; flex-wrap: wrap; margin: auto; display: flex;}
     #header{height: 10%; width: 100%;}
     #footer{height: 10%; width: 100%;}
     #main-container{height: 80%; width: 100%; }
     img{width: 638px; height: 225px;}
     #main{width: 70%; height: 100%; margin: auto; text-align: center;}
     #form-container{    height: 350px;
    width: 537px;
    margin: 50px auto 60px}
    input::placeholder{font-family: 'LINESeedKR-Bd';}
    form{margin: 0; padding: 0; display: inline-block;}
    input{width: 100%; padding: 12px 20px; margin: 5px 0px 30px 0px; display: inline-block; border: 1px solid rgb(176, 173, 173); border-radius: 4px; box-sizing: border-box;}
    input[type=submit]{background-color: #6bd098; font-weight: bold; border: 1px solid #6bd098;}
    input[type=submit]:hover{background-color: #00b894; font-weight: bold;}
    

    </style>
</head>
<body>
    <div id="wrap">
<div id="header"></div>
<div id="main-container">
    <div id="main">
        <img src="./assets/img/Itssuelogo.png" alt="">
        <div id="form-container">
            <form action="login.do" method="post">
                <div>
                    <label for="">ID</label>
                    <input type="text" placeholder="ID를 입력하세요" name="id">
                </div>
                <div>
                    <label for="">PW</label>
                    <input type="password" placeholder="PW를 입력하세요" name="pw">
                </div>
                <div>
                    <input style="font-family:'LINESeedKR-Bd';" type="submit" value="LOGIN">
                </div>
            </form>
        </div>
    </div>
</div>
<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('cdcd53cff82aeec615bc251258c0690d'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
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
<div id="footer"></div>
    </div>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</body>
</html>