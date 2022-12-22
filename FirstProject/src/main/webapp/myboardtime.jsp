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
<div id="wrap">
    <div id="topmain">
        <div class="time">
            <h2>전일대비 공부량</h2>
            <span> +500min </span>
        </div>
        <div class="time">
            <h2>평균 공부시간</h2>
            <span> 8hours </span>
        </div>
        <div class="time">
            <h2>총 공부시간</h2>
            <span> 9000hours </span>
        </div>
    </div>
    <div id="bottommain">
        <h2>공부 시간 그래프</h2>
        <canvas id="myChart"></canvas>
    </div>
</div>








    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
      const ctx = document.getElementById('myChart');

new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange', '최근7일'],
    datasets: [{
      label: '내 공부시간',
      data: [12, 8, 6, 7,12, 5,10],
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