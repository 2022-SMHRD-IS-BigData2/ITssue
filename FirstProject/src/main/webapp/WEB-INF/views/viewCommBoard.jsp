<%@page import="java.util.ArrayList"%>
<%@page import="com.ITssue.entity.Comments"%>
<%@page import="com.ITssue.entity.Board"%>
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
    Itssue 게시글 조회
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
    background-color: #f4f3ef;
  }
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

    #span_list {
      display: inline-block;
      margin-left: 26%;
      margin-top: 1%;
    }

    #span_lastPost {
      display: inline-block;
    }

    #span_nextPost {
      display: inline-block;
    }

    #content {
      border: 3px solid #6bd098;
      text-align: center;
      width: 800px;
      font-size: large;
      font-weight: bold;
      margin: 0 auto;
      margin-top : 1%;
    }

    #span_reco {
      display: inline-block;
      margin-left: 33%;
      margin-top: 1%;
    }

    #write_reco {
      margin-top: 2%;
      margin-left: 220px;
    }

    #reple_btn {
      margin-left: 65%;
      margin-top: -120px;
    }
    #searchbtn{border: 0;  outline:none;}
    input::placeholder{font-family: 'LINESeedKR-Bd';}
    .sidebar-wrapper{overflow-x: hidden;}

    .btnon{background-color: #6bd098; border: 1px solid #6bd098; font-family: 'LINESeedKR-Bd'; border-radius: 5px; color: #66615B;}
    .btngo{background-color: #6bd098; border: 1px solid #6bd098; font-family: 'LINESeedKR-Bd'; border-radius: 5px; color: #66615B;}
    textarea{resize: none; padding: 10px;}
    #commenttable{width: 760px;}
    #commenttable tr td {padding: 10px;}
    .replewriter{width: 100px; padding: 10px;}
    .repletime{width: 150px; padding: 10px;}
    .repledelbox{width: 70px;}
    .repledel{border: 1px solid #6bd098; font-family: 'LINESeedKR-Bd'; background-color: #6bd098;} 
    .repledel:focus{border: none; outline: 1px solid #6bd098;}
    button:focus{border: none; outline: 1px solid #6bd098;}
    .replebox{width: 440px;}
    #commentarea{font-family: 'LINESeedKR-Bd';}
  </style>
</head>

<body class="">
<%
	Members info = (Members)session.getAttribute("info");
	Board board = (Board)session.getAttribute("boardinfo");
	List<Comments> comm = (List<Comments>)session.getAttribute("comminfo");
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
        <div class="row">
          <div class="col-md-12">
            <div id="top_btn">
              <span id="span_list">
                
              </span>
              
              <span id="span_reco"> 
                  <button id="recommend" class="btngo" style="background-color: #6bd098; margin: 0px 10px 0px 30px;"> 추천하기</button>
              </span>
              <span>
              추천수 : 
              </span>
              <span style="margin: 10px;" id="recommendnum">
                <%=board.getLikes() %>
              </span>
            </div>
            <div id="content" style="text-align:center;">
                <table id="list" border="1" bordercolor="#6bd098" word-break="break-all" height="auto" width="795px" align="center" style="margin-left:auto;margin-right:auto;">
                  <tr>
                    <td>제목</td>
                    <td><%=board.getBoard_title() %></td>
                  </tr>
                  <tr>
                    <td>작성자</td>
                    <td><%=board.getId()%></td>
                  </tr>
                  <tr>
                    <td colspan="2">내용</td>
                  </tr>
                  <tr>
                    <td colspan="2" rowspan="4">
                      <div style="text-align: center;">
                    <img id="userimg" alt="이미지 없음" src="images/<%=board.getBoard_file()%>">
                  </div>
                     <%=board.getBoard_content()%>
                    </td>
                  </tr>
                  <tr></tr>
                  <tr></tr>
                  <tr></tr>
                  <tr>
                    <td colspan="2"><a href="goCommList.do"><button id="btnback" class="btnon">뒤로가기</button></a>
                    
                    
                    <button class="btnon" id="boarddel" type="submit">삭제하기</button>
                    
                  </tr>
                </table>
            </div>
            <div id="commentbox">
              <table align="center" border="2" bordercolor="#66615B" id="commenttable" style="margin-top:20px;">
                <tr class="repletrue">
                 
                  <td class="replewriter">작성자</td>
                  <td colspan="2" class="replebox">댓글을 남겨주세요!</td>
                  <td class="repletime">2022.12.23 10:42</td>
                  <td class="repledelbox"><button class="repledel" onclick="javascript:delcom(this);">삭제</button></td>
                </tr>
                <%for(int i =0; i<comm.size(); i++){ %>
                 <tr class="repletrue">
                 
                  <td class="replewriter"><%=comm.get(i).getId() %></td>
                  <td colspan="2" class="replebox"><%=comm.get(i).getCmt_content() %></td>
                  <td class="repletime"><%=comm.get(i).getCmt_dt() %></td>
                  <td class="repledelbox"><button class="repledel" onclick="javascript:delcom(this);" value=<%=comm.get(i).getCmt_no() %>>삭제</button></td>
                </tr>
               
               <%}%>
               
              </table>
            </div>
            <div id="inner_text_write">
              <div style="text-align: center;">
              <form action="">
                <textarea id="commentarea" cols="30" rows="3" placeholder="댓글을 작성해주세요" maxlength="600"
                  style="width: 750px; margin-top: 1%;"></textarea>
                  </form>
              </div>
              <div>
                <button id="reple_btn" type="button" style="margin-left: 48%; margin-top: 1%; background-color: #6bd098;" class="btngo" onclick='addComment()'>댓글등록</button>
              </div>
            </div>
          </div>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
      <script type="text/javascript">
      	$('#recommend').on('click',function(){
      		
      		
      		$.ajax({
      			url:'likeCheck.do',
      			data: {
      				id: '<%=info.getId()%>',
      				board: <%=board.getBoard_no()%>
      			},
      			type: 'post',
      			dataType: 'json',
      			success: function(res){
      				$('#recommendnum').html(res.likes);
      			},
      			error: function(e){
      				
      			}
      			
      			
      			
      			
      		})
      		
      		
      		
      		
      		
      		
      		
      		
      		
      	})
      
      </script>
    <script>
      $('#search').keypress(function(event){
     if ( event.which == 13 ) {
         $('#searchbtn').click();
         return false;
     }
});
      

      
      
function addComment(){
    		 $.ajax({
    			  url: 'writeComment.do',
    				data: {
    					comment : $('#commentarea').val(),
    					boardNo: <%=board.getBoard_no() %>,
    					id: '<%=info.getId()%>'
    				},
    				type: 'post',
    				success : function(res){
    					if(res=='true'){
    						$('#commentarea').val("");
    						
    					}else{
    					}
    				},
    				error : function(e){
    			
    				}
    			})
    	  const parent =document.getElementById('commenttable');
    		const newcomment=document.createElement('tr');
    		newcomment.setAttribute('class','repletrue');
    		parent.appendChild(newcomment);

    		addbox(newcomment)
    	 
    	}
      
      


 
	  

function addbox(newcomment){
  const repleValue 
    = document.getElementById('commentarea').value;
    const writer = document.createElement('td');
    const content = document.createElement('td');
    const date = document.createElement('td');
    const del = document.createElement('td');

  
  writer.setAttribute('class','replewriter');
  content.setAttribute('class','replebox');
  content.setAttribute('colspan','2');
  date.setAttribute('class', 'repletime');
  del.setAttribute('class','repledelbox');
  del.innerHTML = $('.repledelbox').eq(0).html();

  
  var today = new Date();

  var year = today.getFullYear();
  var month = ('0' + (today.getMonth() + 1)).slice(-2);
  var day = ('0' + today.getDate()).slice(-2);
  var hours = ('0' + today.getHours()).slice(-2); 
  var minutes = ('0' + today.getMinutes()).slice(-2);
  var seconds = ('0' + today.getSeconds()).slice(-2); 

  var dateString = year + '-' + month  + '-' + day +" "+hours + ':' + minutes  + ':' + seconds;


  
  const textNode = document.createTextNode(repleValue);
  content.appendChild(textNode);
  const textNode2 = document.createTextNode('<%=info.getId()%>');
  writer.appendChild(textNode2);
  const textNode3 = document.createTextNode(dateString);
  date.appendChild(textNode3);



  newcomment.appendChild(writer);
  newcomment.appendChild(content);
  newcomment.appendChild(date);
  newcomment.appendChild(del);
  

  $('textarea').val('');
}

function delcom(obj){
	
	
	var tr = obj.parentNode.parentNode;
	$.ajax({url: 'deleteComment.do',
		data: {
			cmt_no : obj.value,
			id : '<%=info.getId()%>'
		},
		type: 'post',
		success : function(res){
			if(res=='true'){
				tr.parentNode.removeChild(tr);
			}else{
				Swal.fire({
        			title: '자기 댓글만 삭제 가능합니다.',
        			confirmButtonColor: '#6bd098'
        		})
			}
		},
		error : function(e){
	
		}
		
	})
	
		}

  /* function delbtn(){
  
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

} */

$('#boarddel').on('click',function(){

	var board_id = '<%= board.getId() %>'
	var member_id = '<%= info.getId() %>'

	
	if(board_id == member_id){
		$.ajax({
			url: 'commDeleteOk.do',
			data: {
				board_no: '<%= board.getBoard_no()%>'
			},
			type: 'get',
			success : function(res){
				if(res){
					location.href = 'goCommList.do';
				}else{
				}
			},
			error : function(e){
		
			}
		})
	}else{
		Swal.fire('본인 게시글만 삭제 가능합니다')
	}
})

    </script>
</body>

</html>