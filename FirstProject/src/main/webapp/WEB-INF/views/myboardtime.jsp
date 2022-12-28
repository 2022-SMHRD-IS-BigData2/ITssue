<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ITssue.entity.Study_time"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공부시간관리</title>
    <style>
        @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }
        body {
            background-color: #f4f3ef;
            margin: 0;
            overflow-y: hidden;
            font-family: 'LINESeedKR-Bd';
        }

        #wrap{width: 100%; height: 100vh; flex-wrap: wrap; margin: auto; display: flex;}

        #topmain{width: 100%; height: 40%; margin: 0 auto; text-align: center;}
        #bottommain{width: 100%; height: 50%; text-align: center; margin: 10px 10px 0px 10px; position: relative; height:40vh; width: 100vw;}
        .time{width: 30%; height: 90%; float: left; margin: 0px 20px 0px 20px; border-radius: 10px; border: 2px solid #6bd098;}
        span{font-size: 70px;}

        
    </style>
</head>

<body>
<%

List<Study_time> list = (List<Study_time>) request.getAttribute("list");

//날짜 입력 로직
//오늘
Date today = new Date();
SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
String toDay = date.format(today);

//D-1
Calendar day1ago = Calendar.getInstance();
day1ago.add(Calendar.DATE , -1);
String beforeDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day1ago.getTime());

//D-2
Calendar day2ago = Calendar.getInstance();
day2ago.add(Calendar.DATE , -2);
String beforeDate2 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day2ago.getTime());

//D-3
Calendar day3ago = Calendar.getInstance();
day3ago.add(Calendar.DATE , -3);
String beforeDate3 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day3ago.getTime());

//D-4
Calendar day4ago = Calendar.getInstance();
day4ago.add(Calendar.DATE , -4);
String beforeDate4 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day4ago.getTime());

//D-5
Calendar day5ago = Calendar.getInstance();
day5ago.add(Calendar.DATE , -5);
String beforeDate5 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day5ago.getTime());

//D-6
Calendar day6ago = Calendar.getInstance();
day6ago.add(Calendar.DATE , -6);
String beforeDate6 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day6ago.getTime());

//D-7
Calendar week = Calendar.getInstance();
week.add(Calendar.DATE , -7);
String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());



%>
  <script src="./assets/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

	var toDay = '<%=toDay%>';
	var beforeDate = '<%=beforeDate%>';
	var beforeDate2 = '<%=beforeDate2%>';
	var beforeDate3 = '<%=beforeDate3%>';
	var beforeDate4 = '<%=beforeDate4%>';
	var beforeDate5 = '<%=beforeDate5%>';
	var beforeDate6 = '<%=beforeDate6%>';
	var labels = [toDay, beforeDate, beforeDate2, beforeDate3, beforeDate4, beforeDate5, beforeDate6]
	labels.sort()
	
	var datas =[];
	
	for(var i = 0; i < labels.length; i ++){
		datas.push(0);
	}
	
	var myLabels = [];
	<%int total = 0;%>
	<%if(list != null){%>
		
		<%for(Study_time study : list){%>
			var amounts = parseInt(<%=study.getAmounts()%>);
			var start = '<%= study.getStudy_s_time()%>';
			<%total += Integer.parseInt(study.getAmounts());%>
			myLabels.push(start)
			for(var i = 0; i < labels.length; i ++){
				if(labels[i] == start){
					datas[i] += amounts
				}
			}
		
		<%}%>
	<%}
	
	
	
	String totalData = "";
	if(total > 3600){
		totalData = (total/3600) + "hour";
	}else if(total > 60){
		totalData = (total/60) + "min";
	}else{
		totalData = total + "sec";
	}
	%>
	
	var temp = myLabels;
	myLabels = [...new Set(temp)];
	
	var totalScore = parseInt(<%= total%>/myLabels.length)
	
	
	if(totalScore > 3600){
		var totalScore = parseInt(totalScore/3600) + 'hour';
	}else if(totalScore > 60){
		var totalScore = parseInt(totalScore/60) + 'min';
		
	}else{
		var totalScore = totalScore + 'sec';
		
	}
	
	
	
	
	
</script>

<div id="wrap">
    <div id="topmain">
        <div class="time">
            <h2>전일대비 공부량</h2>
            <span>12</span>
        </div>
        <div class="time">
            <h2>평균 공부시간</h2>
            <span id="avgTime"> 8hours </span>
        </div>
        <div class="time">
            <h2>총 공부시간</h2>
            <span><%=totalData %></span>
        </div>
    </div>
    <div id="bottommain">
        <h2>공부 시간 그래프</h2>
        <canvas id="myChart"></canvas>
    </div>
</div>








    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>

    
    
    $('#avgTime').html(totalScore);	
    
    
    
    
    
    
    
    
    
    
    
      const ctx = document.getElementById('myChart');

new Chart(ctx, {
  type: 'bar',
  data: {
    labels: labels,
    datasets: [{
      label: '내 공부시간',
      data: datas,
      borderWidth: 1,
      borderColor : '#6bd098',
      backgroundColor: '#6bd098'
    }]
  },
  options: {
    maintainAspectRatio: false,
    responsive: true,
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
    </script>
</body>

</html>