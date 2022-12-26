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
    일기 상세 조회
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
    @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }
    body{font-family: 'LINESeedKR-Bd';
  }
    .input-group.no-border {
      position: absolute;
      bottom: 40px;
      padding-right: 10px;
      padding-left: 10px;
    }

    #searchbtn{border: 0; outline: none;}
    #searchbtn:focus{outline: none;}
    input::placeholder{font-family: 'LINESeedKR-Bd';}

    #list{width: 1020px; text-align: center; border: 3px solid #6bd098;}

    .btnon{border: 1px solid #6bd098; font-family: 'LINESeedKR-Bd';  border-radius: 5px; background-color: #6bd098;}
    
   
    
  </style>
</head>

<body class="">
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
          <li class="active ">
            <a href="goBoard.do">
              <i class="fa-solid fa-clipboard-check"></i>
              <p>My Board</p>
              <!-- 일기 게시판 -->
            </a>
          </li>
          <li>
            <a href="goCommList.do">
              <i class="fa-solid fa-message"></i>
              <p>Community Board</p>


              <!-- 질문게시판 -->
            </a>
          </li>
        </ul>
        <form action="">
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
    <div class="main-panel" style="height: 100vh;">
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
            <a class="navbar-brand" href="javascript:;">사용자 닉네임 표시</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
            aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">

            <div class="alert-icon">
              <i class="fa-regular fa-bell"></i>
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
        <table id="list" border="1" bordercolor="#6bd098" word-break="break-all" height="auto" align="center">
          <tr>
            <td>제목</td>
            <td>가져온 제목</td>
          </tr>
          <tr>
            <td>작성일</td>
            <td>가져온 작성날짜</td>
          </tr>
          <tr>
            <td colspan="2">내용</td>
          </tr>
          <tr>
            <td colspan="2" rowspan="4">
              <div style="text-align: center;">
            <img id="userimg" alt="이미지 없음" src="">
          </div>
             가져온 내용 블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블<br>
             라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라<br>
             ㅍ블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라ㅍ블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라<br>
             블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라ㅍ
            </td>
          </tr>
          <tr></tr>
          <tr></tr>
          <tr></tr>
          <tr>
            <td colspan="2"><a href=""><button id="btnback" class="btnon">목록보기</button></a>
            <button class="btnon" onclick="javascript:delcom(this);">삭제하기</button></td>
          </tr>
        </table>
      </div>

        <footer class="footer" style="position: absolute; bottom: 0; width: -webkit-fill-available;">
          <div class="container-fluid">
            <div class="row">
              <nav class="footer-nav">

              </nav>
              <div class="credits ml-auto">

              </div>
            </div>
          </div>
        </footer>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <script>
      $('#search').keypress(function(event){
     if ( event.which == 13 ) {
         $('#searchbtn').click();
         return false;
     }
});
      
      function delbtn(){
    	  
    	  Swal.fire({
    	    title: '삭제하시겠습니까?',
    	    text: "삭제한 게시물은 복구되지 않습니다",
    	    icon: 'warning',
    	    showCancelButton: true,
    	    confirmButtonColor: '#6bd098',
    	    cancelButtonColor: '#d33',
    	    confirmButtonText: 'Yes'
    	  }).then((result) => {
    	    if (result.isConfirmed) {
    	      Swal.fire(
    	        '삭제완료',
    	        '성공적으로 삭제되었습니다',
    	        'success',
    	        false,
    	       '#6bd098'
    	      )
    	    }
    	  })

    	}
    </script>
</body>

</html>