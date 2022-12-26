<%@page import="com.ITssue.entity.Schedule"%>
<%@page import="com.ITssue.entity.D_day"%>
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
    body{font-family: 'LINESeedKR-Bd'; overflow-y: hidden;}
    input::placeholder{font-family: 'LINESeedKR-Bd';}
    #ddayset{ width: 1600px; height: 200px; margin: 10px 10px 50px 10px;}
    #scheduleset{ width: 1600px; height: 600px; margin: 10px;}
    .ddayin{ width: 150px; height: 30px; font-family: 'LINESeedKR-Bd'; border: 0; border-radius: 5px; margin: 0px 0px 0px 5px;
    }
    #ddaybtn{ border: 1px solid #6bd098; background-color: #6bd098; font-family: 'LINESeedKR-Bd'; color: #66615B; width: 130px; height: 30px;  border-radius: 5px; margin: 0px 0px 0px 5px;}
    #removebtn{ border: 1px solid #6bd098; background-color: #6bd098; font-family: 'LINESeedKR-Bd'; color: #66615B; width: 130px; height: 30px;  border-radius: 5px; margin: 0px 0px 0px 5px;}

    #ddaycontain{width: 1570px; height: 130px;}
    .ddaytrue{width: 120px; height: 120px; background-color: #6bd098; border-radius: 10px; margin: 10px 10px 10px 30px; float: left;}
    #ddayname{height: 50%; width: 100%; text-align: center; padding: 10px;}
    #ddaydate{ height: 50%; width: 100%; text-align: center; padding: 10px;}
   #searchbtn{border: 0;  outline:none;}
   #calendar{max-width: 1570px; max-height: 580px; margin: 0 auto;}
.fc-day-today {
    background: #ecf0f1 !important;
    border: none !important;
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
          <li  class="active ">
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
       <div id="ddayset">
        <form action="">
          <label for="">내용</label>
          <input class="ddayin" type="text" name="" id="ddaycontent">
          <label for="">날짜</label>
          <input class="ddayin" type="date" id="ddaydatecon">
          <input id="ddaybtn" type="button" value="D-Day 생성하기" onclick="addList()">
          <input id="removebtn" type='button' value='삭제' onclick='removeItem()'>
        </form>
        <div id="ddaycontain">
          <div class="ddaytrue">
            <div id="ddayname">시험(예시)</div>
            <div id="ddaydate">D-40</div>
          </div>
        </div>
        
       </div>
       <div id="scheduleset">
       <div id='calendar'></div>
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
	<%
		List<D_day> list = (List<D_day>)request.getAttribute("D_dayList");
		List<Schedule> schedule = (List<Schedule>)request.getAttribute("schedule");
	%>
	let day_content = [];
	let day_dt = [];
	
	 
	let listNull = <%=list != null %>;
	if(listNull){
		 <%for(D_day d_day : list){%>
		 	var content = "<%=d_day.getD_day_content()%>";
		 	var dt = "<%=d_day.getD_day_dt()%>";
		 	
		  	day_content.push(content);
		  	day_dt.push(dt);
		  <%}%>	
	
		$('#ddaycontain').html('');
		
		for(var i = 0; i < day_dt.length; i++){
		$('#ddaycontain').append(
				'<div class="ddaytrue">'
        			+'<div id="ddayname">'+day_content[i]+'</div>'
        			+'<div id="ddaydate">'+day_dt[i]+'</div>'
      			+'</div>'
      			);
		}
	}
	
	let = eventsList = [];
	
	if(<%=schedule != null%>){
		
		<%for(Schedule sche : schedule){%>
			var id = "<%=sche.getSche_no()%>";
			var content = "<%=sche.getSche_content()%>";
			var alldays = "<%=sche.getScheduel_type()%>";
			
			if(alldays == "t"){
				var startDT = "<%=sche.getSche_s_dt().split(" ")[0]%>";
				var endDT = "<%=sche.getSche_e_dt().split(" ")[0]%>";
			}else{
				var startDT = "<%=sche.getSche_s_dt().split("\\.")[0]%>";
				var endDT = "<%=sche.getSche_e_dt().split("\\.")[0]%>";
			}
			
			
			if(alldays == "t"){
				eventsList.push({
					id: id,
					title: content,
					start: startDT
				})
			}else{
				eventsList.push({
					id: id,
					title: content,
					start: startDT,
					end: endDT
				})
			}
			
			
		<%}%>
		
	}
		
	console.log(eventsList)
	
		
		
		
	
	
	
	
	
	
</script>

  <script>
function addList()  {
  console.log('추가된다');
  
  const parent = document.getElementById('ddaycontain');
  const newDiv = document.createElement("div");
  newDiv.setAttribute('class', 'ddaytrue');
  parent.appendChild(newDiv);
  addDiv(newDiv)
  
}
function addDiv(newDiv){ // D-day 생성하기 때 실행되는 로직
     // 1. 추가할 값을 input창에서 읽어온다
  const addValue 
    = document.getElementById('ddaycontent').value;
  const addValue2
  =document.getElementById('ddaydatecon').value;
  
  console.log(addValue); // D-day의 이름부분
  console.log(addValue2); // 필요한 날짜 데이터
  
  // 2. 추가할 li element 생성
  // 2-1. 추가할 li element 생성
  const list = document.createElement("div");
  const list2 = document.createElement("div");

  
  // 2-2. li에 id 속성 추가 
  list.setAttribute('id','ddayname');
  list2.setAttribute('id','ddaydate');
 
  
  // 2-3. li에 text node 추가 
  const textNode = document.createTextNode(addValue);
  list.appendChild(textNode);
  const textNode2 = document.createTextNode(addValue2);
  list2.appendChild(textNode2);

  console.log(newDiv);
  // 3. 생성된 li를 ul에 추가
  
newDiv.appendChild(list);
newDiv.appendChild(list2);

$('#ddaycontent').val('');



  }


function removeItem()  { // 삭제되었을때의 로직이 실행되는 부분
  
	 console.log('삭제된당')
	
  // 1. <ul> element 선택
  const ul = document
    .getElementById('ddaycontain');
  
  // 2. <li> 목록 선택
  const items = ul.getElementsByClassName('ddaytrue');
  
  // 3. <li> 목록 중 첫번째 item 삭제
  if(items.length > 0)  {

	console.log(items[items.length-1].innerText.split('\n'));
    items[items.length-1].remove();
  }
  
 
  
  
}

$('#search').keypress(function(event){
    if ( event.which == 13 ) {
        $('#searchbtn').click();
        return false;
    }
});







  </script>
  <script src='./assets/js/index.global.js'></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'timeGridWeek,timeGridDay'
      },
      //initialDate: '2020-09-12',
      initialView: 'timeGridWeek',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {

        (async () => {
    const { value: getName } = await Swal.fire({
        title: '일정을 입력하세요.',
        input: 'text',
        confirmButtonColor : '#6bd098'
    })

    if (getName) {
          calendar.addEvent({
            title: getName,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
		if(arg.allDay){ // allday true
			$.ajax({
				
				url:"scheduleJoin.do",
				data:{
					all: arg.allDay,
					start: arg.startStr,
					end: arg.endStr,
					content: getName
				},
				type:"post",
				success:function(res){
				},
				error:function(e){
				}
				
			})
			
		}else{ // allday false
			$.ajax({
				
				url:"scheduleJoin.do",
				data:{
					all: arg.allDay,
					start: arg.startStr.split('+')[0].split('T')[0]+" "+arg.startStr.split('+')[0].split('T')[1],
					end: arg.endStr.split('+')[0].split('T')[0]+" "+arg.endStr.split('+')[0].split('T')[1],
					content: getName
				},
				type:"post",
				success:function(res){
				},
				error:function(e){
				}
				
			})
			
		}
})()

      },

      eventClick: function(arg) {
  Swal.fire({
   title: '일정을 삭제하시겠습니까?',
   text: '삭제된 일정은 복구되지 않습니다.',
   icon: 'warning',
   
   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
   confirmButtonColor: '#6bd098', // confrim 버튼 색깔 지정
   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
   
   reverseButtons: false, // 버튼 순서 거꾸로
   
}).then(result => {
   // 만약 Promise리턴을 받으면,
   
   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
   
	   Swal.fire({
	        title : '일정이 삭제되었습니다.',
	        confirmButtonColor : '#6bd098'});
      arg.event.remove()
		
		if(arg.event.allDay){
			$.ajax({
				
				url:"scheduleDelete.do",
				data:{
					all: arg.event.allDay,
					start: arg.event.startStr,
					end: arg.event.endStr,
					content: arg.event.title
				},
				type:"post",
				success:function(res){
				},
				error:function(e){
				}
				
			})
			
		}else{
			console.log(arg.event.startStr.split("+")[0].split("T")[0]+" "+arg.event.startStr.split("+")[0].split("T")[1])
			console.log(arg.event.endStr.split("+")[0].split("T")[0]+" "+arg.event.endStr.split("+")[0].split("T")[1])
			$.ajax({
			
			url:"scheduleDelete.do",
			data:{
				all: arg.event.allDay,
				start: arg.event.startStr.split('+')[0].split('T')[0]+" "+arg.event.startStr.split('+')[0].split('T')[1],
				end: arg.event.endStr.split('+')[0].split('T')[0]+" "+arg.event.endStr.split('+')[0].split('T')[1],
				content: arg.event.title
			},
			type:"post",
			success:function(res){
			},
			error:function(e){
			}
			
		})
		}
   }}
)},
     
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: eventsList,
      droppable: true,
      eventDrop: function(info){
		console.log(info)    	 // 드래그 했을 때 로직시 실행되는 부분
		
		let id = info.event.id;
		let endStr = info.event.endStr.split("+")[0].split('T');			
		let startStr = info.event.startStr.split("+")[0].split('T');
		
		if(info.event.allDay){
			
			console.log(id);
			console.log(startStr);
			console.log(endStr);
			
			
			
		}else{
			
			console.log(id);
			console.log(startStr);
			console.log(endStr);
			
		}
		
		
		
		
      }
      
      
      
      
      
      
      
    });

    calendar.render();
  });

</script>
  
</body>

</html>

