<%@page import="com.ITssue.entity.Schedule"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='./assets/js/index.global.js'></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
			initialView: 'timeGridDay',
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
					if(arg.allDay){
						console.log('하루종일');
						console.log(arg)
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
								console.log("요청성공")
							},
							error:function(e){
								console.log("요청실패")
							}
							
						})
						
					}else{
						console.log('시간지정');
						console.log(arg);
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
								console.log("요청성공")
							},
							error:function(e){
								console.log("요청실패")
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
							confirmButtonColor : '#6bd098'
						});
						arg.event.remove()
						console.log(arg.event.title)
						
						if(arg.event.allDay){
							console.log(arg.event.startStr);
							console.log(arg.event.endStr);
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
									console.log("요청성공")
								},
								error:function(e){
									console.log("요청실패")
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
								console.log("요청성공")
							},
							error:function(e){
								console.log("요청실패")
							}
							
						})
						}
						
						
						
					}
				})
			},
			     
			editable: true,
			dayMaxEvents: true, // allow "more" link when too many events
			events: []
			
		});
		
		calendar.render();
	});
	
</script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: 'LINESeedKR-Bd';
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

  @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }
</style>
</head>
<body>

  <div id='calendar'></div>


</body>
</html>
