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
   Itssue 일기작성
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
    background-color: #f4f3ef}
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

    #myDiary {
      margin-left: 65%;
    }

    #title {
      margin: 0 auto;
      text-align: center;
      margin-top: 1%;

    }

    #content2{
      margin: 0 auto;
      text-align: center;

    }

    #commit {
      margin-top: 1%;
      margin-left: 46%;
    }

    #write_commit{
      background-color: #6bd098;
    }

    #back{
      background-color: #6bd098;
    }
    
    textarea{resize: none; font-family: 'LINESeedKR-Bd'; padding: 30px;}
    textarea:focus{outline-color: #6bd098;}
    button{font-family: 'LINESeedKR-Bd'; background-color: #6bd098; border: 1px solid #6bd098; border-radius: 5px; width: 80px; height: 40px;}
    button:focus{border: 1px solid #6bd098; outline: none; }
    
  input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #6bd098;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.upload-name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

.content{width: 100%; height: 100%;}
#title{width: 100%; height: 20%;}
#filebox{width: 100%; height: 15%;}
#content2{width: 100%; height: 60%;}
#commit{width: 100%; height: 5%;}
  </style>
</head>

<body class="">
  <div class="wrapper" style="height: 100vh; width: 100%; overflow-x: hidden;">
    
      <div class="content">
        <div class="row"><br>
          <div id="title" style="display: block; margin:0 auto">
            <form action="diaryInsert.do"  enctype="multipart/form-data"  method="post">
              <textarea name="title" id="write_title" cols="150" rows="2" wrap="hard" placeholder="제목을 입력해주세요"></textarea>
           
          </div>
          <div id="filebox" style="margin: 0 auto; text-align: center;">
           <input class="upload-name" value="파일선택" disabled="disabled">
  <label for="ex_filename" >업로드</label> 
  <input type="file" id="ex_filename" class="upload-hidden" onchange="readURL(this);" name="file"><br>
   <img id="preview" style="display:block; margin:auto;">
          </div>
          <div id="content2">
            
              <textarea name="content" id="write_content" cols="150" rows="25"  wrap="hard" placeholder="내용을 입력해주세요"></textarea>
            
          </div>
        </div>
        
        <div id="commit">
 
            <button id="write_commit" type="submit">작성완료</button>
            <a href="goBoard.do"  style="text-decoration=none;" target="_top"><button id="back" type="button">뒤로가기</button></a>
          </form>
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
  
  <script type="text/javascript">
  
  function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
  
  
  
  
  
  
  
  
  </script>
</body>

</html>