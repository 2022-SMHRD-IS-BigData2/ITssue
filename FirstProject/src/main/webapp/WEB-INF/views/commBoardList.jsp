<%@page import="java.util.List"%>
<%@page import="com.ITssue.entity.Board"%>
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
    Itssue 커뮤니티 보드
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
  .write_list{background-color: #f5f5f5;
  box-shadow: 5px 5px 5px gray;}
  #board{display: inline-block; text-align: center;} 
  body{font-family: 'LINESeedKR-Bd';}
  .btn{background-color: #6bd098; border: 2px solid #6bd098; font-family: 'LINESeedKR-Bd';}
input::placeholder{font-family: 'LINESeedKR-Bd';}
 #searchbtn{border: 0;  outline:none;}
  </style>
</head>

<body class="">
<%
	Members info = (Members)session.getAttribute("info");
	List<Board> list = (List<Board>)session.getAttribute("boardList");
	List<Board> rank = (List<Board>)session.getAttribute("boardRank");
	int rankNum = 1;
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
          <li  class="active ">
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
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            
              <div class="alert-icon">
                
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
            <div id="board" style="width: 1000px;" align="center">
              <form onsubmit="false">
                  <div>
                      <input type="text" name="tag" size="120" maxlength="20" placeholder="🔍# 해시태그를 입력해주세요" id="hashTag">
                      <input class="btn search" type="button" name="search" value="검색" id="tagSearch">
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
                  <tbody>
                  	
                  	<%for(Board board : rank){ %>
                  			<tr>
		                        <td scope="col" class="td_title" width="250">&#12935<%=rankNum %> BEST<%=rankNum++ %> </td>
		                        <td scope="col" class="td_title" width="365"><a href="goBoardView.do?num=<%=board.getBoard_no()%>"><%=board.getBoard_title() %></a></td>
		                        <td scope="col" class="td_wirter" width="280"><%=board.getId() %></td>
		                        <td scope="col" class="td_date" width="300"><%=board.getBoard_date().split(" ")[0] %></td>
		                        <td scope="col" class="td_reco" width="90"><%=board.getLikes() %></td>
	                      	</tr>
                  	<%} %>
                  	
                  	<%for(Board board : list){ %>
                    		<tr>
		                        <td scope="col" class="td_title" width="250"><%=board.getBoard_no() %> </td>
		                        <td scope="col" class="td_title" width="365"><a href="goBoardView.do?num=<%=board.getBoard_no()%>"> <%=board.getBoard_title() %></a></td>
		                        <td scope="col" class="td_wirter" width="280"><%=board.getId() %></td>
		                        <td scope="col" class="td_date" width="300"><%=board.getBoard_date().split(" ")[0] %></td>
		                        <td scope="col" class="td_reco" width="90"><%=board.getLikes() %></td>
	                      	</tr>
                  	<%} %>
                  	
                  </tbody>
              </table>
              <br>
              <input class="btn mine" type="button" value="내글보기" id="myList" style="float: left;">
                <a href="./a_4_comm copy.html" id="write"></a>
              <input class="btn write" type="button" value="글쓰기" style="float:right" id="newWrite">
      
          </div>
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
  <script type="text/javascript">
  	$('#newWrite').on('click',function(){
  		location.href="goCommWrite.do";
  	}) 
  	
  	$('#tagSearch').on('click',function(){
		$('tbody').html('');
  		$.ajax({
  	  		
  			url: 'boardList.do',
  			data:{
  			},
  			type: 'post',
  			dataType:'json',
  			success: function(res){
  				var tag = res[0].hash_tag;
  				var ser = $('#hashTag').val();
				for(let i = 0; i < res.length; i++){
  					if(res[i].hash_tag.includes(ser)){
						var board = res[i];
						
						tr = `
							<tr>
								<td scope='col' class='td_title' width='250'>` + board.board_no + `</td>
								<td scope='col' class='td_title' width='365'><a href='goBoardView.do?num=`+board.board_no+`'>` + board.board_title + `</a></td>
								<td scope='col' class='td_title' width='280'>` + board.id + `</td>
								<td scope='col' class='td_title' width='300'>` + board.board_date.split(' ')[0] + `</td>
								<td scope='col' class='td_title' width='90'>` + board.likes + `</td>
							</tr>
							`
						// 준비한 tr을 tbody에 집어넣기
						// $('선택자').html() : 안에 있는 html코드 리턴
						// $('선택자').html('코드') : 안에 있는 html코드 덮어쓰기
						// $('선택자').append('코드') : 안에 html코드 추가
						$('tbody').append( tr );
						
					}
  				}
  				
  				
  				
  			},
  			error : function(e){
  				
  			}
  			
  		})
  		
  	});
  
  	$('#myList').on('click',function(){
  		$('tbody').html('');
  		var tr = '';
  		<%for(Board board : list){%>
			
			<%if(board.getId().equals(info.getId())){%>
				tr = `
					<tr>
				<td scope='col' class='td_title' width='250'>`+'<%=board.getBoard_no()%>'+`</td>
				<td scope='col' class='td_title' width='365'><a href="goBoardView.do?num=<%=board.getBoard_no()%>">`+'<%=board.getBoard_title()%>'+`</a></td>
				<td scope='col' class='td_title' width='280'>`+'<%=board.getId()%>'+`</td>
				<td scope='col' class='td_title' width='300'>`+'<%=board.getBoard_date().split(" ")[0] %>'+`</td>
				<td scope='col' class='td_title' width='90'>`+'<%=board.getLikes() %>' +`</td>
				</tr>
				`
			<%}%>
  			
			$('tbody').append( tr );
  		<%}%>
  		
  	})
  	$('#hashTag').keypress(function(event){
     if ( event.which == 13 ) {
         $('#tagSearch').click();
         return false;
     }
});
  	
  	$('#search').keypress(function(event){
  	     if ( event.which == 13 ) {
  	         $('#searchbtn').click();
  	         return false;
  	     }
  	});
  </script>
</body>

</html>
