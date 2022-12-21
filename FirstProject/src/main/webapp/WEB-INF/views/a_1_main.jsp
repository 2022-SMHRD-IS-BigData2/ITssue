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
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Itssue
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
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
  .input-group.no-border{position: absolute; bottom: 40px; padding-right: 10px; padding-left: 10px;}
  .alert-icon{position: absolute; right: 100px; top: 20px;}
  @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }
    body{font-family: 'LINESeedKR-Bd'; overflow: hidden;}
    input::placeholder{font-family: 'LINESeedKR-Bd';}
  #left-main{width: 60%;height: 100%; float: left; min-width: 1070px; min-height: 390px;}
  #top-main{width: 100%; height: 40%;}
  #timer{width: 50%; height: 90%; float: left; margin: 10px; text-align: center; color: #66615B; min-width: 460px; min-height: 320px;}
  #dday{width: 40%; height: 90%; float: right; background-color: #6bd098; margin: 10px; border-radius: 10px; display: flex; align-items: center; text-align: center; margin: 0 auto; flex-direction: column; min-width: 380px; min-height: 320px;}         
  #schedule{width: 100%; height: 50%; margin: 10px; background-color: white; border-radius: 10px;}
  #postIt{ width: 30%; height: 90%; float: right; margin: 10px;}
  textarea{width: 100%; height: 100%; box-sizing: border-box;
			border: solid 3px #6bd098;;
			border-radius: 5px;
			font-size: 16px;
    text-align: center;
  resize: none;
padding: 40px;
margin: 0 10px 30px 10px;
outline-color: #6bd098;
font-family: 'LINESeedKR-Bd';}

  #MyClockDisplay{padding: 80px 100px 30px 100px; font-size: 50px;}
  .btn{background-color: #6bd098; margin: 10px 10px 10px 20px;}
  .btnfour{padding: 11px 26px 11px 26px;}

  .ddayline{position: relative; color: #66615B;}
  .ddayline.title{padding-top: 70px;}
  .ddayline.date{padding-top: 50px;}
  .ddaybox{width: 100%; height: 50%; position: relative;} 

 

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
          <li class="active ">
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
          <li>
            <a href="goComm.do">
              <i class="fa-solid fa-message"></i>
              <p>Community Board</p>
              <!-- 질문게시판 -->
            </a>
          </li>
        </ul>
        <div class="input-group no-border"> 
        <input id ="search" type="text" value="" class="form-control" placeholder="회원 검색">
        <div class="input-group-append">
          <div class="input-group-text">
            <i class="nc-icon nc-zoom-split"></i>
          </div>
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
            <a class="navbar-brand" href="javascript:;">사용자 닉네임 표시</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
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
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fa-solid fa-gear"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Settings</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">회원정보 수정</a>
                  <a class="dropdown-item" href="#">로그아웃</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content" style="height: 100vh;">
        
         
            <div id="left-main">
              <div id="top-main">
                <div id="timer">
                  <div id="MyClockDisplay" class="clock">00:00:00.00</div>
    <div id="MyClockbtn">
        <button class="btn">Start</button>
        <button class="btn btnfour">Stop</button><br>
        <button class="btn save_btn btnfour">Save</button>
        <button class="btn">Reset</button>
      </div>
      <div>
      </div>
  
                </div>
                <div id="dday">
                  <div class="ddaybox">
                  <h2 class="ddayline title"><a href="#" style="text-decoration: none; color :#66615B">D-DAY 설정하러가기</a></h2>
                </div>
                <div class="ddaybox">
                  <h1 class="ddayline date">D-40</h1>
                </div>
                </div>
              </div>
              <div id="schedule">
                <iframe src="dayplanner.jsp" frameborder="0" width="100%" height="100%"></iframe>
              </div>
            </div>
            
            <div id="postIt">
              <textarea name="" id="" placeholder="간단한 메모장으로 이용하세요!"></textarea>
           
      </div>
      <footer class="footer" style="position: absolute; bottom: 0; width: -webkit-fill-available;">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              
            </nav>
            <div class="credits ml-auto">
              
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
  <script src="./assets/js/stopWatch.js"></script>
</body>

</html>
