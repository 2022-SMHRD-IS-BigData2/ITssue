<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>회원정보수정</title>

    <script src="https://kit.fontawesome.com/5ecdf6234c.js" crossorigin="anonymous"></script>
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
     #main-container{height: 80%; width: 100%; text-align: center; }
     h3{text-align: center;}
     #btn-container{width: 200px; display: inline-block; justify-content: center;}
     #form-container{ width: 60%; height: 100%; margin: auto; text-align: center;}
     form{background-color: white; border-radius: 10px; margin: 50px auto 60px;}
     input::placeholder{font-family: 'LINESeedKR-Bd';}
    form{margin: 0 0 20px 0; padding: 0; display: inline-block; padding: 0px 10px 0px 10px;}
    input{width: 100%; padding: 12px 20px; margin: 5px 0px 20px 0px; display: inline-block; border: 1px solid rgb(176, 173, 173); border-radius: 4px; box-sizing: border-box;}
    label{ width: 100%; text-align: start; display: inline-block; padding: 0 5px; margin-top: 10px;}
    input[type=submit]{background-color: #6bd098; font-weight: bold; border : 1px solid #6bd098;}
    input[type=submit]:hover{background-color: #00b894; font-weight: bold;}
    #btn-out{border: 2px solid #ee5253; border-radius: 5px; color: white; background-color: #ee5253; padding: 5px; width: 200px; height: 50px; font-weight: bold; display: block; margin: auto;}
    #btn-out:hover{background-color: #ff6b6b; font-weight: bold; border: 2px solid #ff6b6b;}
    .fa-solid{position: absolute; top: 2px; bottom: 0; right: 10px; margin: auto 2px; height: 0px; font-size: 15px; cursor: pointer;}
    .eyecontain{position: relative;}
    </style>
</head>
<body>
    
<div id="wrap">
    <div id="header"></div>

    <div id="main-container">
        <div id="main">
            <h3>회원 정보 수정</h3>
            <div id="form-container">
                <form action="">
                    <div>
                        <label for="">ID</label>
                        <input readonly type="text" value="기존 아이디">
                    </div>
                    <div class="eyecontain">
                        <label for="">현재 비밀번호</label>
                        <input type="password" placeholder="현재 비밀번호를 입력해주세요" id="pw">
                        <i class="fa-solid fa-eye" id="eye"></i>
                    </div>
                    <div class="eyecontain">
                        <label for="">변경할 비밀번호</label>
                        <input type="password" placeholder="변경할 비밀번호를 입력해주세요" id="pw2">
                        <i class="fa-solid fa-eye" id="eye2"></i>
                    </div>
                    <div class="eyecontain">
                        <label for="">비밀번호 확인</label>
                        <input type="password" placeholder="변경한 비밀번호 확인" id="pw3">
                        <i class="fa-solid fa-eye" id="eye3"></i>
                    </div>
                    <div>
                        <label for="">BIRTH</label>
                        <input type="date">
                    </div>
                    <div>
                        <label for="">NICKNAME</label>
                        <input type="text" value="기존닉네임">
                    </div>
                    <div>
                        <input style="font-family:'LINESeedKR-Bd';" type="submit" value="정보 변경하기">
                    </div>
                    
                </form>
            </div>
            <div id="btn-container">
            <button id="btn-out">회원 탈퇴</button>
        </div>
        </div>
    </div>

    <div id="footer"></div>
</div>


<script>
    const passwordInput = document.querySelector('#pw')
    const eye = document.querySelector('#eye')

    eye.addEventListener('click', function(){
        this.classList.toggle('fa-eye')
        this.classList.toggle('fa-eye-slash')
        const type = passwordInput.getAttribute("type") === "password" ? " text" : "password"
        passwordInput.setAttribute("type", type)
    })

    const passwordInput2 = document.querySelector('#pw2')
    const eye2 = document.querySelector('#eye2')

    eye2.addEventListener('click', function(){
        this.classList.toggle('fa-eye')
        this.classList.toggle('fa-eye-slash')
        const type = passwordInput2.getAttribute("type") === "password" ? " text" : "password"
        passwordInput2.setAttribute("type", type)
    })

    const passwordInput3 = document.querySelector('#pw3')
    const eye3 = document.querySelector('#eye3')

    eye3.addEventListener('click', function(){
        this.classList.toggle('fa-eye')
        this.classList.toggle('fa-eye-slash')
        const type = passwordInput3.getAttribute("type") === "password" ? " text" : "password"
        passwordInput3.setAttribute("type", type)
    })
</script>
</body>
</html>