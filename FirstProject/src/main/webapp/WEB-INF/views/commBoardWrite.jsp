<%@page import="com.ITssue.entity.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
=========================================================
* Paper Dashboard 2 - v2.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-dashboard-2
* Copyright 2020 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Itssue 게시글 작성 페이지
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
    name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./assets/css/sitecss.css" rel="stylesheet" />
  <!-- CSS 링크 위에!!!!!!바꾸면 됨 -->
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./assets/demo/demo.css" rel="stylesheet" />
  <script src="https://kit.fontawesome.com/5ecdf6234c.js" crossorigin="anonymous"></script>

  <style>
    .input-group.no-border {
      position: absolute;
      bottom: 40px;
      padding-right: 10px;
      padding-left: 10px;
    }

    @font-face {
      font-family: 'LINESeedKR-Bd';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
    }

    .alert-icon {
      position: absolute;
      right: 100px;
      top: 20px;

    }
    
    html, body{
	width: 100%; height: 100%;
}

    body {
      font-family: 'LINESeedKR-Bd';
      margin: 0 auto;
      height : 100vh;
      width : 100%;
    }

    textarea {
      resize: none;
      border-color: #dfe6e9;
      font-family: 'LINESeedKR-Bd';
      outline-color: #6bd098;
    }

    table{
      border-color: #dfe6e9;
    }
input::placeholder{font-family: 'LINESeedKR-Bd';}
     input[type=submit]{border: 2px solid #6bd098; border-radius: 5px; padding: 3px 10px 3px 10px; background-color: #10ac84; font-family: 
    'LINESeedKR-Bd';}
    input[type=button]{border: 1px solid #6bd098; border-radius: 5px; padding: 2px 10px 2px 10px; background-color: #10ac84; font-family: 'LINESeedKR-Bd';}
    
      .hashtag-container{list-style: none;}
    .hashtag{float: left; margin: 3px; display: block; width: 80px; height: 20px; text-align: center; border: 1px solid #6bd098; border-radius: 5px; background-color: #6bd098;}
    
    #filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

#filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #6bd098;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
#filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}
 #searchbtn{border: 0;  outline:none;}
  </style>
</head>

<body class="">
<%
	Members info = (Members)session.getAttribute("info");
%>
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="success">
      <div class="logo">
        <div id="container">
          <a href="goMain.do" class="simple-text logo-normal">
            <img id="logo" src="./assets/img/Itssuelogo.png">

          </a>
        </div>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="goMain.do">
              <i class="fa-solid fa-house-chimney"></i>
              <p>Main</p>
              <!-- 메인페이지 -->
            </a>
          </li>
          <li>
            <a href="goSche.do">
              <i class="fa-solid fa-calendar-days"></i>
              <p>My Schedule</p>
              <!-- 위클리 스케줄 설정, 디데이 설정 -->
            </a>
          </li>
          <li>
            <a href="goBoard.do">
              <i class="fa-solid fa-clipboard-check"></i>
              <p>My Board</p>
              <!-- 일기 게시판 -->
            </a>
          </li>
          <li class="active ">
            <a href="goCommList.do">
              <i class="fa-solid fa-message"></i>
              <p>Community Board</p>
              <!-- 질문게시판 -->
            </a>
          </li>
        </ul>
        <form action="goMembersChart.do">
        <div class="input-group no-border">
        <input id ="search" type="text" value="" class="form-control" placeholder="회원 검색">
        <div class="input-group-append">
          <div class="input-group-text">
            <button type="submit" id="searchbtn">
               <i class="nc-icon nc-zoom-split"></i>
            </button>
          </div>
        </form>
        </div>
      </div>
      </div>
    </div>
    <div class="main-panel" >
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;"><%=info.getNick() %>님</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
            aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">

            <div class="alert-icon">
              
            </div>

            <ul class="navbar-nav">
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fa-solid fa-gear"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Settings</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="goUpdate.do">회원정보 수정</a>
                  <a class="dropdown-item" href="logout.do">로그아웃</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">

          </div>
        </div>
      </div>


      
        <table border="4" style="margin-right: auto; margin-left: auto;">
          <div style="width:1000px;" align="center"></div>
          <thead>
            <tr>
              <th colspan="4">
                <form onsubmit="false">
                  <textarea name="title" id="title" cols="132" rows="1" style="text-align: center; font-size: medium"
                    placeholder="제목을 입력하세요."></textarea>
                </form>
              </th>
            </tr>
          </thead>
          <div>
            <thead>
              <tr>
                <td scope="col" id="filebox" class="td_title" width="500" style="text-align: center;" colspan="4">
                <input class="upload-name" value="파일선택" disabled="disabled">
  <label for="ex_filename">업로드</label> 
  <input type="file" id="ex_filename" class="upload-hidden" onchange="readURL(this);"><br>
   <img id="preview" style="display:block; margin:auto;">
  
  </td>
              </tr>
            </thead>
          </div>
          <div>
            <thead>
              <tr>
                <td scope="col" class="td_title" width="280" style="text-align: center;">서체</td>
                <td scope="col" class="td_title" width="280" style="text-align: center;">14pt</td>
                <td scope="col" class="td_title" width="280" style="text-align: center;">bold</td>
                <td scope="col" class="td_title" width="280" style="text-align: center;">정렬방식</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th colspan="4">
                    <textarea name="content" id="content" cols="132" rows="25" style="font-size: medium; text-align: center;"
                      placeholder="내용을 입력하세요."></textarea>
                    <input id="addValue" type="text" placeholder="여섯자까지 해시태그 입력">
                    <input id="push-hash" type='button' value='추가' onclick='addList()'>
                      <input type='button' value='삭제' onclick='removeItem()'>
                    <ul id="hashtag-container">
                      <li class="hashtag">예시:수학</li>
                      
                    </ul>
                  
                </th>
              </tr>
            </tbody>
        </table>
        <br>
        <div style="resize: none; text-align: center";>
          <input type="button" value="등록" style="resize: none;  " id="submit">
        </div>
      </form>
    </div>


    
  </div>
  </div>
  <!--   Core JS Files   -->
  <script src="./assets/js/core/jquery.min.js"></script>
  <script src="./assets/js/core/popper.min.js"></script>
  <script src="./assets/js/core/bootstrap.min.js"></script>
  <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="./assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="./assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>

  <script src="./assets/js/jquery-3.6.1.min.js"></script>
  <script>
function addList()  {
  
  // 1. 추가할 값을 input창에서 읽어온다
  const addValue 
    = document.getElementById('addValue').value;
  
  // 2. 추가할 li element 생성
  // 2-1. 추가할 li element 생성
  const list = document.createElement("li");
  
  // 2-2. li에 id 속성 추가 
  list.setAttribute('class','hashtag');
  
  // 2-3. li에 text node 추가 
  const textNode = document.createTextNode(addValue);
  list.appendChild(textNode);
  
  // 3. 생성된 li를 ul에 추가
  document
    .getElementById('hashtag-container')
    .appendChild(list);

    $('#addValue').val('');
}

function removeItem()  {
  
  // 1. <ul> element 선택
  const ul = document
    .getElementById('hashtag-container');
  
  // 2. <li> 목록 선택
  const items = ul.getElementsByTagName('li');
  
  // 3. <li> 목록 중 첫번째 item 삭제
  if(items.length > 0)  {
    items[items.length-1].remove();
  }
  
}

$('#push-hash').click(function(){
});


$('#addValue').keypress(function(event){
     if ( event.which == 13 ) {
         $('#push-hash').click();
         return false;
     }
});

  </script>
  <script type="text/javascript">
  $('#submit').on('click',function(){
	  var hashtags = "";
		for(var i = 0; i < $('.hashtag').length; i++){
			hashtags += $('.hashtag')[i].innerHTML
			if(i <= $('.hashtag').length-2 ){
				hashtags += ",";
			}
		}

		$.ajax({
			
			url : "commWrite.do",
			data : {
				title:$('#title').val(),
				content:$('#content').val(),
				hashtag: hashtags,
			},
			type:"post",
			success:function(res){
				if(res=="true"){
					location.href = "goCommList.do"
				}else{
					location.href = "goCommWrite.do"
				}
			},
			error:function(e){
			}
			
		})
		
		
	  		
  })
  
  function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}
  </script>
</body>

</html>