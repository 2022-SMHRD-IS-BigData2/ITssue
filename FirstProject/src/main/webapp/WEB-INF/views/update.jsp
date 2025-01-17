<%@page import="com.ITssue.entity.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Itssue 회원정보수정</title>
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
    input[type=button]{background-color: #6bd098; font-weight: bold; border : 1px solid #6bd098;}
    input[type=button]:hover{background-color: #00b894; font-weight: bold;}
    #btn-out{border: 2px solid #ee5253; border-radius: 5px; color: white; background-color: #ee5253; padding: 5px; width: 200px; height: 50px; font-weight: bold; display: block; margin: auto;}
    #btn-out:hover{background-color: #ff6b6b; font-weight: bold; border: 2px solid #ff6b6b;}
     .fa-solid{position: absolute; top: 2px; bottom: 0; right: 10px; margin: auto 2px; height: 0px; font-size: 15px; cursor: pointer;}
    .eyecontain{position: relative;}
   
    </style>
</head>
<body>
    <%
    	Members info = (Members)session.getAttribute("info");
    %>
<div id="wrap">
    <div id="header"></div>

    <div id="main-container">
        <div id="main">
            <h3>회원 정보 수정</h3>
            <div id="form-container">
                <form onsubmit="false">
                    <div>
                        <label for="">ID</label>
                        <input readonly type="text" value="<%=info.getId() %>" id="id">
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
                        <input type="date" value="<%=info.getBirth().split(" ")[0] %>" id="birth">
                    </div>
                    <div>
                        <label for="">NICKNAME</label>
                        <input type="text" value="<%=info.getNick()%>" id="nick">
                    </div>
                    <div>
                        <input style="font-family:'LINESeedKR-Bd';" type="button" value="정보 변경하기" id="submit">
                    </div>
                    
                </form>
            </div>
            <div id="btn-container">
            <form action="memberDelete.do" style="margin:0; padding:0;">
            <button id="btn-out" type='submit'>회원 탈퇴</button>
            </form>
        </div>
        </div>
    </div>

    <div id="footer"></div>
</div>



<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
$('#submit').on('click',function(){
	if($('#pw').val() != <%=info.getPw()%>){
		Swal.fire({
			  title: '비밀번호가 일치하지 않습니다.',
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
	
	}else{
		
		if($('#pw2').val() != $('#pw3').val() ){
			Swal.fire({
				  title: '새로 입력하신 비밀번호와 비밀번호 확인이 틀립니다.',
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
		}else if( $('#pw2').val() == <%=info.getPw()%> ){
			 Swal.fire({
				  title: '기존 비밀번호와 동일합니다.',
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
		}else{
			
			$.ajax({ 
    			
				url : "memberUpdate.do",
				data : {
					id:$('#id').val(),
					pw:$('#pw2').val(),
					birth:$('#birth').val(),
					nick:$('#nick').val()
				},
				type:"post",
				success:function(res){
					if(res=="true"){
						location.href = "goMain.do"
					}else{
						location.href = "goUpdate.do"
					}
				},
				error:function(e){
				}
				
			})
			
			
			
			
			
			
			
			
		}
		
		
	}
})

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