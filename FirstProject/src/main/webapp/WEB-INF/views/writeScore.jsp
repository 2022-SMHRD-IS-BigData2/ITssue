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
    Itssue 성적입력관리
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
    .input-group.no-border {
      position: absolute;
      bottom: 40px;
      padding-right: 10px;
      padding-left: 10px;
    }

    body {
      font-family: 'LINESeedKR-Bd';
    }

    .alert-icon {
      position: absolute;
      right: 100px;
      top: 20px;
    }

    #span_add1 {
      display: inline-block;
      margin-right: 30%;
      margin-top: 1%;
    }

    #span_add2 {
      display: inline-block;
      margin-left: -28%;
      margin-right: 23%;
    }

    #add_btn {
      text-align: right;
    }

    #span_commit {
      text-align: center;
    }

    #insertScore {
      margin-top: 2%;
      text-align: center;
      width: 900px;
      height: 500px;
      color:black
    }

    #addSubject {
      background-color: #6bd098;
    }

    #addScore {
      background-color: #6bd098;
    }

    #commit_btn {
      background-color: #6bd098;
      margin-top: 1%;
    }

    #title_insertScore {
      height: 100px;
    }

    #test_name {
      width: 500px;
      height: 30px;
    }

    #test_date {
      width: 500px;
      height: 30px;
    }

    .test_subjectName {
      width: 500px;
      height: 30px;
    }

    .test_score {
      width: 500px;
      height: 30px;
    }
    #searchbtn{border: 0;  outline:none;}
    input::placeholder{font-family: 'LINESeedKR-Bd';}
    .mybtn{border: 1px solid #6bd098; border-radius: 5px; background-color: #6bd098; width: 120px; height: 40px; font-family: 'LINESeedKR-Bd'; letter-spacing: 1px;}
    .mybtn:focus{outline: none; border: 0;}
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
            <div id="add_btn">
              <span id="span_add2">
                <form action="">
                  <button id="addScore" type="button" class="mybtn">과목추가하기</button>
                  <button id="delScore" class="mybtn" type="button">삭제하기</button>
                </form>
              </span>
            </div>
          </div>
        </div>
        <table id="insertScore" border="4" bordercolor="#66615B" align="center" style="background-color:mediumaquamarine">
          <thead>
            <tr>
              <td id="title_insertScore" scope="col" colspan="2" style="font-size: xx-large; font-weight: bolder;">
                성적을 입력해주세요</td>
            </tr>
          </thead>
            <tbody>
            <tr>
              <td style="font-size:large; font-weight: bold;background-color: #9ED6C0;">📌 시험명</td>
              <td style="background-color: #9ED6C0;"><input id="test_name" type="text" placeholder="시험명을 입력해주세요">
              </td>
            </tr>
            <tr>
              <td style="font-size:large; font-weight: bold;">📌 시험날짜</td>
              <td><input id="test_date" type="text" placeholder="시험날짜를 입력해주세요"></td>
            </tr>
            <tr class="scoresub">
              <td style="font-size:large; font-weight: bold; background-color: #9ED6C0;">📌 과목명</td>
              <td style="background-color: #9ED6C0;"><input class="test_subjectName" type="text" placeholder="과목명을 입력해주세요">
              </td>
            </tr>
            <tr class="scoretrue">
              <td style="font-size:large; font-weight: bold;">📌 점수</td>
              <td><input class="test_score" type="text" placeholder="점수를 입력해주세요"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div>
        <span id="span_commit">
          <form action="">
            <button id="commit_btn" class="mybtn" type="button" onclick="javascript:alert()">저장하기</button>
          </form>
        </span>
      </div>
    </div>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
    function alert(){
    Swal.fire({
     title: '성적정보가 저장되었습니다',
     confirmButtonColor: '#6bd098'
    });
  }

  $(function(){
    var newRow = $('.scoresub').eq(0);
    var newRow2 = $('.scoretrue').eq(0);
    $("#addScore").click(function(){
      $('#insertScore tbody').append(newRow.clone(true));
      $('#insertScore tbody').append(newRow2.clone(true));
    })
  })
  $("#delScore").click(function(){
    var trCnt = $('#insertScore tr').length;
    if(trCnt >5){
      $('#insertScore > tbody:last > tr:last').remove()
      $('#insertScore > tbody:last > tr:last').remove()
    }
    })
  
  
    $('#search').keypress(function(event){
     if ( event.which == 13 ) {
         $('#searchbtn').click();
         return false;
     }
});
  </script>
</body>

</html>