<%@page import="java.util.List"%>
<%@page import="com.ITssue.entity.Diary"%>
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
    background-color : #f4f3ef;
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
    button:focus{outline:none;}
    
   
    
  </style>
</head>

<body class="">
<% Diary diary = (Diary)session.getAttribute("diary"); %>
  <div class="wrapper ">
    
      <div class="content">
        <table id="list" border="1" bordercolor="#6bd098" word-break="break-all" height="auto" align="center">
          <tr>
            <td>제목</td>
            <td><%= diary.getDiary_title() %></td>
          </tr>
          <tr>
            <td>작성일</td>
            <td><%= diary.getDiary_date().split("\\.")[0] %></td>
          </tr>
          <tr>
            <td colspan="2">내용</td>
          </tr>
          <tr>
            <td colspan="2" rowspan="4">
              <div style="text-align: center;">
            <img id="userimg" alt="이미지 없음" src="images/<%= diary.getDiary_file()%>">
          </div>
            <%=diary.getDiary_content()%>
            </td>
          </tr>
          <tr></tr>
          <tr></tr>
          <tr></tr>
          <tr>
            <td colspan="2"><a href="goBoard.do" target="_top"><button id="btnback" class="btnon">목록보기</button></a>
            <button class="btnon" id="deldiary" >삭제하기</button></td>
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
      
<%--       function delbtn(){
    	  
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
    	    	$.ajax({
    	  			url: 'diaryDelete.do',
    	  			data: {
    	  				diary_no: '<%=diary.getDiary_no()%>'
    	  			},
    	  			type: 'get',
    	  			success : function(res){
    	  				if(res){
    	  					location.href = 'goBoard.do';
    	  				}else{
    	  				}
    	  			},
    	  			error : function(e){
    	  		
    	  			}
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
       --%>
      $("#deldiary").on('click',function(){
    	  $.ajax({
  			url: 'diaryDelete.do',
  			data: {
  				diary_no: '<%=diary.getDiary_no()%>'
  			},
  			type: 'get',
  			success : function(res){
  				if(res=='true'){
  					location.href = 'goBoardDiary.do';
  				}else{
  				}
  			},
  			error : function(e){
  		
  			}
      });
      });
    </script>
</body>

</html>