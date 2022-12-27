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

String text = (String) session.getAttribute("get");
List<Study_time> list = (List<Study_time>) session.getAttribute("list");
System.out.println(list.size());



int hour1 = Integer.parseInt(list.get(0).getAmounts().split(":")[0]);
int hour2 = Integer.parseInt(list.get(1).getAmounts().split(":")[0]);
int hour3 = Integer.parseInt(list.get(2).getAmounts().split(":")[0]);
int hour4 = Integer.parseInt(list.get(3).getAmounts().split(":")[0]);
int hour5 = Integer.parseInt(list.get(4).getAmounts().split(":")[0]);
int hour6 = Integer.parseInt(list.get(5).getAmounts().split(":")[0]);
int hour7 = Integer.parseInt(list.get(6).getAmounts().split(":")[0]);

int minute1 = Integer.parseInt(list.get(0).getAmounts().split(":")[1]);
System.out.println(minute1);



//String day = list.get(0).getStudy_s_time().split("-")[2];
String day = list.get(0).getStudy_s_time();
System.out.println(day);
String day1 = day.substring(0, 10);
System.out.println(day1);



// 날짜 입력 로직
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
System.out.println(beforeWeek);






// 시, 분, 초 별 합계구하기
int hours = 0;
int minutes = 0;
int seconds = 0;

for(int i=0; i<list.size(); i++){
	hours += Integer.parseInt(list.get(i).getAmounts().split(":")[0]);
}

for(int j=0; j<list.size(); j++){
	minutes += Integer.parseInt(list.get(j).getAmounts().split(":")[1]);
}

for(int k=0; k<list.size(); k++){
	seconds += Integer.parseInt(list.get(k).getAmounts().split(":")[2]);
}

// 05:45:22
double total = Math.round(minutes*0.01);

System.out.println(day);
System.out.println(hours);
System.out.println(minutes);
System.out.println(seconds);
System.out.println(total);


                                        %>


<div id="wrap">
    <div id="topmain">
        <div class="time">
            <h2>전일대비 공부량</h2>
            <span>12</span>
        </div>
        <div class="time">
            <h2>평균 공부시간</h2>
            <span> 8hours </span>
        </div>
        <div class="time">
            <h2>총 공부시간</h2>
            <span><%=total %>hours</span>
        </div>
    </div>
    <div id="bottommain">
        <h2>공부 시간 그래프</h2>
        <canvas id="myChart"></canvas>
    </div>
</div>


<input type="text" id="" name="" value"<%=toDay%>">
<input type="text" id="" name="" value"<%=beforeDate%>">
<input type="text" id="" name="" value"<%=beforeDate2%>">
<input type="text" id="" name="" value"<%=beforeDate3%>">
<input type="text" id="" name="" value"<%=beforeDate4%>">
<input type="text" id="" name="" value"<%=beforeDate5%>">
<input type="text" id="" name="" value"<%=beforeDate6%>">





    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
    var toDay = '<%=toDay%>';
    var beforeDate = '<%=beforeDate%>';
    var beforeDate2 = '<%=beforeDate2%>';
    var beforeDate3 = '<%=beforeDate3%>';
    var beforeDate4 = '<%=beforeDate4%>';
    var beforeDate5 = '<%=beforeDate5%>';
    var beforeDate6 = '<%=beforeDate6%>';
    
      const ctx = document.getElementById('myChart');

new Chart(ctx, {
  type: 'bar',
  data: {
    labels: [toDay, beforeDate, beforeDate2, beforeDate3, beforeDate4, beforeDate5, beforeDate6],
    datasets: [{
      label: '내 공부시간',
      data: [20, 8, 6, 7, 12, 5, 10],
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