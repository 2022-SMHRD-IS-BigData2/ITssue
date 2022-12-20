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
    Paper Dashboard 2 by Creative Tim
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
   @font-face {
      font-family: 'LINESeedKR-Bd';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
    }
  .input-group.no-border{position: absolute; bottom: 40px; padding-right: 10px; padding-left: 10px;}
  .alert-icon{position: absolute; right: 100px; top: 20px;}
  .col-md-12{text-align: center;}
  #board{display: inline-block; text-align: center;} 
  body{font-family: 'LINESeedKR-Bd';}

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
          <li>
            <a href="goBoard.do">
              <i class="fa-solid fa-clipboard-check"></i>
              <p>My Board</p>
              <!-- 일기 게시판 -->
            </a>
          </li>
          <li  class="active ">
            <a href="goCommList.do">
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
            <a class="navbar-brand" href="javascript:;">user nickname</a>
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
                    <span class="d-lg-none d-md-block">Some Actions</span>
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

      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div id="board" style="width: 1000px;" align="center">
              <form action="tag_search">
                  <div>
                      <input type="text" name="tag" size="120" maxlength="20" placeholder="🔍# 해시태그를 입력해주세요">
                      <input type="submit" name="search" value="검색">
                      <br><br>
                  </div>
              </form>
              <table class="write_list" border="1">
                  <thead>
                      <tr>
                          <th scope="col" class="td_title" width="200"></th>
                          <th scope="col" class="td_title" width="335" align="center">제목</th>
                          <th scope="col" class="td_wirter" width="280" align="center">작성자</th>
                          <th scope="col" class="td_date" width="290" align="center">작성일</th>
                          <th scope="col" class="td_reco" width="200" align="center">추천</th>
                      </tr>
                  </thead>
                  <thead>
                      <tr>
                          <th scope="col" class="td_title" width="250">🥇BEST1 </th>
                          <th scope="col" class="td_title" width="365">베스트게시물1</th>
                          <th scope="col" class="td_wirter" width="280">작성자1</th>
                          <th scope="col" class="td_date" width="300">작성일1</th>
                          <th scope="col" class="td_reco" width="90">570</th>
                        </tr>
                  </thead>
                  <thead>
                      <tr>
                          <th scope="col" class="td_title" width="250">🥈BEST2 </th>
                          <th scope="col" class="td_title" width="365">베스트게시물2</th>
                          <th scope="col" class="td_wirter" width="280">작성자2</th>
                          <th scope="col" class="td_date" width="300">작성일2</th>
                          <th scope="col" class="td_reco" width="90">486</th>
                        </tr>
                  </thead>
                  <thead>
                      <tr>
                          <th scope="col" class="td_title" width="250">🥉BEST3 </th>
                          <th scope="col" class="td_title" width="365">베스트게시물3</th>
                          <th scope="col" class="td_wirter" width="280">작성자3</th>
                          <th scope="col" class="td_date" width="300">작성일3</th>
                          <th scope="col" class="td_reco" width="90">381</th>
                        </tr>
                  </thead>
                  <thead>
                      <tr>
                        <td scope="col" class="td_title" width="250">65349 </td>
                        <td scope="col" class="td_title" width="365">게시물</td>
                        <td scope="col" class="td_wirter" width="280">작성자</td>
                        <td scope="col" class="td_date" width="300">작성일</td>
                        <td scope="col" class="td_reco" width="90">0</td>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <td scope="col" class="td_title" width="250">65348 </td>
                        <td scope="col" class="td_title" width="365">게시물</td>
                        <td scope="col" class="td_wirter" width="280">작성자</td>
                        <td scope="col" class="td_date" width="300">작성일</td>
                        <td scope="col" class="td_reco" width="90">5</td>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <td scope="col" class="td_title" width="250">65347 </td>
                        <td scope="col" class="td_title" width="365">게시물</td>
                        <td scope="col" class="td_wirter" width="280">작성자</td>
                        <td scope="col" class="td_date" width="300">작성일</td>
                        <td scope="col" class="td_reco" width="90">4</td>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <td scope="col" class="td_title" width="250" >65346 </td>
                        <td scope="col" class="td_title" width="365">게시물</td>
                        <td scope="col" class="td_wirter" width="280">작성자</td>
                        <td scope="col" class="td_date" width="300">작성일</td>
                        <td scope="col" class="td_reco" width="90">0</td>
                      </tr>
                    </thead>
              </table>
              <br>
              <input type="submit" value="글쓰기" onclick="location.href='#write'" style="float: left;">
                <a href="./a_4_comm copy.html" id="write"></a>
              <input type="submit" value="내글보기" style="float:right">
      
          </div>
          </div>
        </div>
      </div>

      <body>

        
    </body>

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
</body>

</html>
