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
        #main{position: absolute; width: 1500px; height: 700px; top: 50%; left: 50%; margin-top: -350px; margin-left: -750px;} 
        #section-left{width: 50%; height: 100%; float: left; background-size: cover;
        background-image: url(./assets/img/WalkingSelfie_AdobeExpress.gif);}
        #section-right{width: 50%; height: 100%; float: right; background-color: #6bd098;}
        .comment{font-family: 'LINESeedKR-Bd'; margin-left: 30px; opacity: 0;}
        .study{color: white;}
        .mate{margin-top: 200px;}
        .btn{margin: 20px auto 0 30px; border: 2px solid white; font-size: 0.875rem; letter-spacing: 2px; padding: 10px 34px; color: white; text-decoration: none; font-weight: bold;}
        img{object-fit: scale-down;}

        
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
                <a href="#" class="comment btn">REGISTER</a><br>
                <br>
                <br>
                <a href="#" class="comment btn">LOGIN</a>
            </div>
        </div>
    </div>
</div>
<div id="footer"></div>
    </div>

    <script>
        $( document ).ready( function() {
            var time = 2000;
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
</body>
</html>