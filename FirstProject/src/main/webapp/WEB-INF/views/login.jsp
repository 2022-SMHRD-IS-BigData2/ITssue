<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title> Itssue Login</title>
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
    input[type=button]{background-color: #6bd098; font-weight: bold; border: 1px solid #6bd098;}
    input[type=button]:hover{background-color: #00b894; font-weight: bold;}
    

    </style>
</head>
<body>
    <div id="wrap">
<div id="header"></div>
<div id="main-container">
    <div id="main">
        <img src="./assets/img/Itssuelogo.png" alt="">
        <div id="form-container">
            <form onsubmit="false">
                <div>
                    <label for="">ID</label>
                    <input type="text" placeholder="ID를 입력하세요" name="id" id="id">
                </div>
                <div>
                    <label for="">PW</label>
                    <input type="password" placeholder="PW를 입력하세요" name="pw" id="pw">
                </div>
                <div>
                    <input style="font-family:'LINESeedKR-Bd';" type="button" value="LOGIN" id="submit">
                </div>
               
            </form>
        </div>
    </div>
</div>


<div id="footer"></div>
    </div>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
	$('#submit').on('click',function(){
		
		$.ajax({
			url: 'login.do',
			data: {
				id: $('#id').val(),
				pw: $('#pw').val()
			},
			type: 'post',
			success: function(res){
				console.log(res == 'true')
				if(res == 'true'){
					location.href = "goMain.do"
				}else{
					Swal.fire({
		  				  title: '로그인에 실패하였습니다.',
		  				  showClass: {
		  				    popup: 'animate__animated animate__fadeInDown'
		  				  },
		  				  hideClass: {
		  				    popup: 'animate__animated animate__fadeOutUp'
		  				  },
		  				  icon : 'warning',
		  				  confirmButtonColor: '#6bd098',
		  				  confirmButtonText:'확인'
		  			})
				}
			},
			error: function(e){
				
			}
		})
		
	})
</script>
</body>
</html>