<%@page import="com.ITssue.entity.Score"%>
<%@page import="java.util.List"%>
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
        #enterscore{margin: auto; display: block; border: 1px solid #6bd098; background-color:#6bd098; font-family: 'LINESeedKR-Bd';
         border-radius:5px;}
         #delscore{margin: auto; display: block; border: 1px solid #6bd098; background-color:#6bd098; font-family: 'LINESeedKR-Bd';
         border-radius:5px;}

    </style>
</head>

<body>
	<script type="text/javascript">
		<%List<Score> list = (List<Score>)request.getAttribute("scoreList");
			boolean listNull = list != null;
			int size = 0;
			if(listNull){
				size = list.size() -1;
			}
		%>
		let datas = []; //
		let labels = []; //
		<%if(listNull){%>
			<%for(Score score : list){%>
				datas.push(<%=score.getGrade()%>);
				labels.push('<%=score.getScore_date().split(" ")[0]%>');
			<%}%>
		<%}%>
		
	</script>
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
                <button type=button id="enterscore">시험 정보 입력하기</button><br>
                <button type="button" id="delscore">마지막 시험 삭제하기</button>
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
                        <th scope="col">과목명3</th>
                        <th scope="col">과목명4</th>
                        <th scope="col">과목명5</th>
                    </tr>
                </thead>
        		<tbody>
        		<%for(Score score : list){%>
        			<tr>
                        <td><%=score.getScore_title() %></td>
                        <td><%=score.getScore_date().split(" ")[0] %></td>
                        <td><%=score.getGrade() %></td>
                        <% for(int i = 0; i < score.getSubname().split(",").length; i++){
                        	String subname = score.getSubname().split(",")[i];%>
                        	<td><%=subname %></td>
                        <%} %>
                    </tr>
        		<%}%>
				</tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="./assets/js/jquery-3.6.1.min.js"></script>

    <script>
        const ctx = document.getElementById('myChart');

new Chart(ctx, {
  type: 'line',
  data: {
    labels: labels,
    datasets: [{
      label: '내 성적 변화',
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

$("#delscore").click(function(){
	// 마지막 시험 삭제하기 버튼 누르면 실행됨
		console.log('삭제됨')
	    var trCnt = $('#score_table>tbody tr').length;
		console.log(trCnt)
	    if(trCnt > 0){
	    	console.log($('tbody>tr:last').html())
	    	$.ajax({
	    		url:'scoreDelete.do',
	    		data:{
	    			scoreNo : <%=list.get(size).getScore_no()%>
	    		},
	    		type: 'post',
	    		success: function(res){
	    			if(res){
		    			$('tbody > tr:last').remove()
	    			}
	    			
	    		},
	    		error: function(e){
	    			
	    		}
	    	})
	    }
    })
    </script>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	
	$('#enterscore').on('click',function(){
		// 시험 정보 입력하기 버튼 누르면 실행됨
		console.log('입력하기 클릭됨')
		location.href = "goWriteScore.do";
		
	})
	
	
</script>
</body>

</html>