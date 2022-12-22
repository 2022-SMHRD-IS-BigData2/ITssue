<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시험성적관리</title>
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
            font-family: 'LINESeedKR-Bd';
            overflow-x: hidden;
        }

        #wrap {
            margin-top: 10%;
            margin-left: 10%;
            margin-right: 5%;
            padding-bottom: 20%;
        }

        #graph {
            float: left;
            border: 3px solid #6bd098;
            text-align: center;
            width: 28%;
            margin-right: 30%;
            margin-left: 3%;
            margin-top: 2%;
            margin-bottom: 5%;
            padding-top: 4%;
            padding-bottom: 4%;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            font-size: large;
            font-weight: bold;
            position: relative; height:40vh; width: 90vw;
        }

        #graph_semi_title {
            font-size: x-large;
            font-weight: bold;
            text-align: center;
            margin-top: 2%;
        }

        #stopWatch_semi_title {
            font-size: x-large;
            font-weight: bold;
            text-align: center;
            margin-top: 5%;
        }

        #graph_comment {
            font-size: small;
            font-weight: bold;
            text-align: center;
        }

        #score_semi_title {
            font-size: x-large;
            font-weight: bold;
            text-align: center;
        }

        #score_comment {
            font-size: small;
            font-weight: bold;
            text-align: center;
        }

        #score_table {
            margin-top: 5%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            height: 150px;
        }

    </style>
</head>

<body>
    <div class="wrap"><br>
        <div class="col-md-12">
            <div id="graph_title">
                <span>
                    <li id="graph_semi_title">시험 점수 변동 그래프</li>
                    <p id="graph_comment">&nbsp;&nbsp;&nbsp;&nbsp;당신의 성적 추이를 그래프로 보여줍니다.</p>
                </span>
            </div>
            <div id="graph">
                
                    <canvas id="myChart"></canvas>
               
            </div>
        </div>
        <div class="col-md-14">
            <div id="score_title">
                <span id="wrap_score">
                    <li id="score_semi_title">시험점수 상세정보</li>
                    <p id="score_comment">&nbsp;&nbsp;&nbsp;&nbsp;당신의 시험점수에 대한 상세정보를 보여줍니다.</p>
                </span>
            </div>

        </div>
        <div>
            <table id="score_table" border="1" width="620px">
                <thead>
                    <tr>
                        <th scope="col">시험명</th>
                        <th scope="col">시험날짜</th>
                        <th scope="col">총합점수</th>
                        <th scope="col">과목명1</th>
                        <th scope="col">과목명2</th>
                    </tr>
                </thead>
                <thead>
                    <tr>
                        <th>3월 모의고사</th>
                        <th>22.03.24</th>
                        <th>480</th>
                        <th>윤리와사상</th>
                        <th>생활과윤리</th>
                    </tr>
                </thead>
                <thead>
                    <tr>
                        <th>토익</th>
                        <th>22.05.16</th>
                        <th>820</th>
                        <th>RC</th>
                        <th>LC</th>
                    </tr>
                </thead>
                <thead>
                    <tr>
                        <th>중간고사</th>
                        <th>22.06.08</th>
                        <th>432</th>
                        <th>과목1</th>
                        <th>과목2</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('myChart');

new Chart(ctx, {
  type: 'line',
  data: {
    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange', '최근7일'],
    datasets: [{
      label: '내 성적 변화',
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