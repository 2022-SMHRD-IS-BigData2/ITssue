<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Itssue</title>
    <script src="./assets/js/jquery-3.6.1.min.js"></script>
    <style>
         @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }

        body{background-color: #f4f3ef;
            margin: 0; overflow-y: hidden;}
        #wrap{width: 100%; height: 100vh; flex-wrap: wrap; margin: auto; display: flex;}
        #header{height: 10%; width: 100%;}
        #footer{height: 10%; width: 100%;}
        #container{height: 80%; width: 100%; position: relative;}
        #main{position: absolute; width: 1500px; height: 700px; top: 50%; left: 50%; margin-top: -400px; margin-left: -750px;} 
        #section-left{width: 50%; height: 100%; float: left; background-size: cover;
        background-image: url(./assets/img/WalkingSelfie_AdobeExpress.gif);}
        #section-right{width: 50%; height: 100%; float: right; background-color: #6bd098;}
        .comment{font-family: 'LINESeedKR-Bd'; margin-left: 30px; opacity: 0;}
        .study{color: white;}
        .mate{margin-top: 200px;}
        .btn{margin: 20px auto 0 30px; border: 3px solid white; font-size: 0.875rem; letter-spacing: 2px; padding: 10px 34px; color: white; text-decoration: none; font-weight: bold;}
        img{object-fit: scale-down;}
        .kakao{margin: 20px auto 0 30px; border: 3px solid #fed330; background-color:#fed330; font-size: 0.875rem; padding: 10px 34px; color: black; text-decoration : none; font-weight:bold; font-family: 'LINESeedKR-Bd';}

        
    </style>
</head>
<body>
    <div id="wrap">
<div id="header"></div>
<div id="container">
    <div id="main">
        
        <div id="section-left" >
            
        </div>
        <div id="section-right">
            <div>
                <h4 class="comment mate">당신의 공부 메이트, ITssue</h4>
                <h1 class="comment study">Study With Us</h1>
                <p class="comment join">지금 가입하시고 저희와 함께 공부해요.</p>
                <br>
                <a href="goJoin.do" class="comment btn">REGISTER</a><br>
                <br>
                <br>
                <a href="goLogin.do" class="comment btn">LOGIN</a><br>
                <br>
                <br>
               
      			<a href="javascript:void(0)" onclick="kakaoLogin();" class="kakao comment btn">
          	     카카오 로그인
      		    </a>
      		    <ul>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃(테스트)</span>
      </a>
	</li>
</ul>
						
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer"></div>
    </div>

    <script>
        $( document ).ready( function() {
            var time = 1000;
        $( 'h4.mate' ).animate({
            opacity: '1'
        }, time, function(){
            $( 'h1.study' ).animate({
                opacity: '1'
            }, time, function(){
                $( 'p.join' ).animate({
                    opacity:'1'
                }, time, function(){
                    $( 'a.btn' ).animate({
                        opacity: '1'
                }, time);
            });
        });
    });
});
    


    </script>
    
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
</body>
</html>