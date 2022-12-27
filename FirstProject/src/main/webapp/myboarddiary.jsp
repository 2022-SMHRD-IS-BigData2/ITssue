<%@page import="com.ITssue.entity.Diary"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
         @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }
        body{background-color: #f4f3ef;
            margin: 0;
            font-family: 'LINESeedKR-Bd';}
        #wrap{width: 100%; height: 100vh; flex-wrap: wrap; margin: auto; display: flex;}
        #head{width: 100%; height: 10%; margin: auto;}
        #btngo{width: 100%; height: 10%;}
        #diary{width: 100%; height: 80%;  text-align: center;}
        h1{margin: auto; width: fit-content; padding: 20px 0px 0px 0px;}
        button{padding: 5px; border-radius: 5px; border: 1px solid #6bd098; background-color: #6bd098; margin: auto; display: block; font-family: 'LINESeedKR-Bd'; width: 100px;}
        .diaryit{width: 200px; height: 200px; background-color: #6bd098; margin: 20px; padding: 20px;  border-radius: 10px; display: inline-block;  vertical-align: middle;} 
        .diarymemo{ width: 200px; display: -webkit-box;
  overflow: hidden;
  word-break: break-all;
  word-wrap: break-word;
  text-overflow: ellipsis;
  -webkit-line-clamp: 8;
  -webkit-box-orient: vertical;
line-height: 1.5;
height: 12rem;
text-align : left;}
#gowrite{text-decoration: none;}

    </style>
</head>
<body>
<%List<Diary> diary = (List<Diary>)session.getAttribute("diaryList"); %>
    <div id="wrap">
        <div id="head">
            <h1>나의 일기장</h1>
        </div>
        <div id="btngo">
        <a id="gowrite" href="goDiaryWrite.do">
            <button onclick="createDiv()" >일기 쓰기</button>
            </a>
        </div>
        <div id="diary">
			
				<% for(int i =0; i<diary.size(); i++){%>
				<div class="diaryit" onclick="location.href='goDiaryView.do?num=<%=diary.get(i).getDiary_no()%>'">
				<div class="diarymemo">
				<%=diary.get(i).getDiary_title()%><br>
				<%=diary.get(i).getDiary_content()%>
				</div>
                </div>
				<%} %>
			
        </div>

    </div>

    <script src="./assets/js/jquery-3.6.1.min.js"></script>
    <script>
    
    
    

//함수 사용해서 내용추가시 블럭추가만들기
function createDiv() {
  // 1. <div> element 만들기
const newDiv = document.createElement('div');
const newDiv2 = document.createElement('div');

// 2. <div>에 들어갈 text node 만들기
    const newText = document.createTextNode(<%=diary.get(diary.size()-1).getDiary_content()%>);
    
    // 3. <div>에 text node 붙이기
        newDiv2.appendChild(newText);
        newDiv.setAttribute('class','diaryit');
        newDiv2.setAttribute('class', 'diarymemo');
        newDiv.appendChild(newDiv2);


  
  // 4. <body>에 1에서 만든 <div> element 붙이기
  document.getElementById("diary").appendChild(newDiv);
 
	  
  }


    </script>
</body>
</html>