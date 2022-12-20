<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="./assets/js/jquery-3.6.1.min.js"></script>
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
     #center{height: 80%; width: 100%; background-color: #6bd098; position: relative; display: flex; }
     #joinform{ margin: auto; width: 600px; height: 600px;
    border-radius: 10px; background-color: white; text-align: center; padding: 10px;}

     #header{height: 10%; width: 100%;}
     #footer{height: 10%; width: 100%;}
     input::placeholder{font-family: 'LINESeedKR-Bd';}
     form{margin: 0; padding: 0; display: inline-block;}
    input{width: 100%; padding: 12px 20px; margin: 5px 0px 30px 0px; display: inline-block; border: 1px solid rgb(176, 173, 173); border-radius: 4px; box-sizing: border-box;}
    input[type=submit]{background-color: #6bd098; font-weight: bold; border: 1px solid #6bd098;}
    input[type=submit]:hover{background-color: #00b894; font-weight: bold;}
    label{ width: 100%; text-align: start; display: inline-block; padding: 0 5px; margin-top: 10px;}
    .fa-solid{position: absolute; top: -10px; bottom: 0; right: 10px; margin: auto 2px; height: 0px; font-size: 15px; cursor: pointer;}
    .eyecontain{position: relative;}


    </style>
</head>
<body>
    <div id="wrap">
        <div id="header"></div>
        <div id="center">
            <div id="joinform">
            <form action="#" method="post">
          
                    <label for="">ID</label>
                    <input required type="text" placeholder="ID를 입력하세요.">

                    <div class="eyecontain">
                    <label for="">PW</label>
                    <input required type="password" placeholder="비밀번호를 입력해주세요." id="pw">
                    <div class="eyes">
                    <i class="fa-solid fa-eye" id="eye"></i>
                </div>
                    </div>

                    <div class="eyecontain">
                    <label required for="">PW 확인</label>
                    <input type="password" placeholder="비밀번호 확인" id="pw2">
                    <div class="eyes">
                    <i class="fa-solid fa-eye" id="eye2"
                    ></i>
                </div>
                </div>

                    <label for="">BIRTH</label>
                    <input required type="date">
             
                    <label for="">NICKNAME</label>
                    <input required type="text" placeholder="사용하실 닉네임을 입력해주세요.">
              
                <div>
                    <input style="font-family:'LINESeedKR-Bd';" type="submit" value="가입하기">
                </div>
            </form>
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
    </script>
</body>
</html>