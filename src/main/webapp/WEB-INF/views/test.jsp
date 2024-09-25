<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>무한스크롤 예제</title>
  <style>
    html, body{ margin: 0; }
    h1 {position: fixed; top: 0; width: 100%; height: 60px; text-align: center; background: white; margin: 0; line-height: 60px;}
    section .box {height: 500px; background: gray;}
    section .box p {margin: 0; color: white; padding: 80px 20px;}
    section .box:nth-child(2n) {background: lightblue;}
	th{	
		background-color:#9396e8;
		color:white;
		text-align:center;
		height:400px;
	}
	table{
		margin-top:300px;
		width:100%;
		min-height:100px;
	}
  </style>
</head>
<body>         
  <h1>무한스크롤</h1>
  <section>
    <%--
    <div class="box">
      <p>
        1번째 블록
      </p>
    </div>
    <div class="box">
      <p>
        2번째 블록
      </p>
    </div>
     --%>
	<table border="0" width="100%">
	    <tr>
	        <th >거래일자</th>
	        <%-- 
	        <th >거래유형</th>
	         --%>
	        <th >거래명</th>
	        <th >입금 금액</th>
	        <th >출금 금액</th>
	        <th >잔액</th>
	    </tr>
    </table>

  </section>
  <script>
/*     var count = 2;
    window.onscroll = function(e) {
      console.log(window.innerHeight , window.scrollY,document.body.offsetHeight)
      if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
        setTimeout(function(){
          var addContent = document.createElement("div");
          addContent.classList.add("box")
          addContent.innerHTML = "<p>"+(count+1)+"번째 블록</p>"
          document.querySelector('section').appendChild(addContent);
          count+=1;
        }, 750)  
      }
    } */
    var count = 2;
    window.onscroll = function(e) {
      console.log(window.innerHeight , window.scrollY,document.body.offsetHeight)
      if(count>30) return;
      if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
        setTimeout(function(){
          var addContent = document.createElement("tr");
          addContent.innerHTML = "<td>"+(count+1)+"</td>"
          addContent.innerHTML = "<td>"+(count+1)+"번째 블록</td>"
          addContent.innerHTML = "<td>"+(count+1)+"번째 블록</td>"
          addContent.innerHTML = "<td>"+(count+1)+"번째 블록</td>"
          document.querySelector('table').appendChild(addContent);
          count+=1;
        }, 750)  
      }
    }
  </script>
</body>
</html>