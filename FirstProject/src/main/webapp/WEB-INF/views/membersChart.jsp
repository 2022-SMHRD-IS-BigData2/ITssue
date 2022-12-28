<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ITssue.entity.Study_time"%>
<%@page import="java.util.List"%>
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
    Itssue 멤버 비교 페이지
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

    .alert-icon {
      position: absolute;
      right: 100px;
      top: 20px;
    }

    @font-face {
      font-family: 'LINESeedKR-Bd';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
    }

    body {
      font-family: 'LINESeedKR-Bd';
    }

    input::placeholder {
      font-family: 'LINESeedKR-Bd';
    }

    #search_nick {
      font-size: xx-large;
      font-style: italic;
      text-align: center;
    }

    #week_chart {
      text-align: center;
      margin-left: 650px;
      margin-top: 4%;
      font-size: x-large;
      font-style: italic;
      border: 3px solid #6bd098;
      width: 300px;
      background-color: #6bd098;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
      border-bottom-left-radius: 10px;
      border-bottom-right-radius: 10px;
    }

    #graph {
      float: left;
      border: 3px solid #6bd098;
      text-align: center;
      width: 1200px;
      height: 400px;
     
      font-size: large;
      font-weight: bold;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
      border-bottom-left-radius: 10px;
      border-bottom-right-radius: 10px;
    }

    #title {
      text-align: center;
      font-size: xx-large;
      margin-bottom: 2%;

    }

    #searchbtn{border: 0; outline: none;}
    #searchbtn:focus{outline: none;}
    input::placeholder{font-family: 'LINESeedKR-Bd';}

    #graphbox{display: flex;
  justify-content : center;}

  #btngo{background-color: #6bd098; border-radius: 5px; border: 1px solid #6bd098; font-family: 'LINESeedKR-Bd';}
    
  </style>
</head>

<body class="">
<%
	Members info = (Members)session.getAttribute("info");
	Members outher = (Members)request.getAttribute("outher");
	String outherNick = "닉네임";
	if(outher != null){
		outherNick = outher.getNick();
	}
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
          <li>
            <a href="goCommList.do">
              <i class="fa-solid fa-message"></i>
              <p>Community Board</p>
              <!-- 질문게시판 -->
            </a>
          </li>
        </ul>
        <form action="goMembersChart.do">
          <div class="input-group no-border">
          <input id ="search" type="text" value="" class="form-control" placeholder="회원 검색" name="other">
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
        <div>
          <div id="title">
            <span>🚩 [<%=info.getNick()%>] 님과 [<%=outherNick %>] 님의 비교 결과입니다</span>
          </div>
          <hr>
          <div id="week_graph">
            <p id="week_chart">📈 주차별 공부시간 차트 📈</p>
            <div id="graphbox">
            <div id="graph"><canvas id="myChart"></canvas></div>
          </div>
          </div>
        </div>
      </div><br>
      <div id="btn">
        <form action="">
          <button id="btngo" type="button" style="background-color: #6bd098; margin:auto; display:block;">MYBOARD 바로가기</button>
        </form>
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
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
  	<%
		List<Study_time> myStudyList = (List<Study_time>)request.getAttribute("myStudy");
		List<Study_time> outherStudyList = (List<Study_time>)request.getAttribute("outherStudy");
	%>
  	
  	var labelsData = [];
	var myData = [];
	var outherData = [];
  	
  	
  	<%if(myStudyList != null){
  		Date today = new Date();
  		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
  	%>
	labelsData.push('<%=date.format(today)%>');
		<%for(int i = 1; i <= 7; i++){
			Calendar dayago = Calendar.getInstance();
			dayago.add(Calendar.DATE , - i);
			%>
			labelsData.push('<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(dayago.getTime()) %>');
		<%}%>
		
		
		var temp = labelsData
		labelsData = [...new Set(temp)]
		labelsData.sort()
		
		for(var i = 0; i < labelsData.length; i++){
			
			myData.push(0);
			outherData.push(0);
			
		}
		
		<%for(Study_time study : myStudyList){%>
			var amountData = parseInt(<%=study.getAmounts()%>)
			var days = '<%=study.getStudy_s_time()%>';
			for(var i = 0; i < labelsData.length; i++){
				if(labelsData[i] == days){
					myData[i] += amountData
				}
			}
		<%}%>
		<%for(Study_time study : outherStudyList){%>
			var amountData = parseInt(<%=study.getAmounts()%>)
			var days = '<%=study.getStudy_s_time()%>';
			for(var i = 0; i < labelsData.length; i++){
				if(labelsData[i] == days){
					outherData[i] += amountData
				}
			}
		<%}%>
		
		
		
		
		
	<%}%>
	
	  
	  
	  
	  
$('#search').keypress(function(event){
	if ( event.which == 13 ) {
		$('#searchbtn').click();
		return false;
	}
});

const ctx = document.getElementById('myChart');

new Chart(ctx, {
	type: 'line',
	data: {
		labels: labelsData,
		datasets: [
			{
				label: '내 공부시간',
				data: myData,
				borderWidth: 5,
				borderColor : '#6bd098',
				backgroundColor: '#6bd098',
				yAxisID:'y',
			},
			{
				label:'상대방 공부시간',
				data:outherData,
				borderWidth:5,
				borderColor:'#ff7979',
				backgroundColor:'#ff7979',
				yAxisID:'y1'
			}
		]
	},
	options: {
		maintainAspectRatio: false,
		responsive: true,
		interaction:{
			mode : 'index',
			intersect : false,
		},
		stacked:false,
		plugins:{
			title:{
				display: true,
				text: '회원 비교 차트'
			}
		},
		scales: {
			y: {
				type : 'linear',
				display : true,
				position:'left',
			},
			y1:{
				type: 'linear',
				display:true,
				position:'right',
				        
				grid:{
					drawOnChartArea:false,
				}
			}
		}
	}
});
  </script>
</body>

</html>