<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<%-- 
    <title>Purple Buzz HTML Template with Bootstrap 5 Beta 1</title>
 --%>
<title>Quit</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="${path}/assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${path}/assets/img/favicon.ico">
<%-- Load Require CSS --%>
<link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet">
<%-- Font CSS --%>
<link href="${path}/assets/css/boxicon.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap"
	rel="stylesheet">
<%-- Load Tempalte CSS --%>
<link rel="stylesheet" href="${path}/assets/css/templatemo.css">
<%-- Custom CSS --%>
<link rel="stylesheet" href="${path}/assets/css/custom.css">
<!--
	원본 템플릿:
	TemplateMo 561 Purple Buzz
	https://templatemo.com/tm-561-purple-buzz
-->
<%--
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="${path}/assets/js/jquery-member.js"></script>
 --%>
	
</head>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	let requestMsg = function(event){
		event.preventDefault();
		let password = document.getElementById('password').value;
		let id = '${userVO.customerId}';
		
		$.ajax({
			url : '/ob/member/quit'
			, type : 'delete'
			, async : false
			, contentType: 'application/json'
			, data : JSON.stringify({
				customerId : id,
				password : password
			})
			, dataType : 'text'
			, success : function(result){
				alert(result)
				location.href="/ob/";
			}
			, error : function(){
				alert("서버가 응답하지 않습니다. 다시 시도해주세요.")
			}
		})
		
	}
</script>
<body>
	<jsp:include page="../header.jsp" />
	<%-- Start Contact --%>
	
	<section class="container py-5 text-center">
		<div class="row pb-4 sign-up py-5">
			<div class="container-fluid">
	            <div class="row">
	                <h2 class="h2 text-center col-12 py-3 semi-bold-600">회원 탈퇴</h2>
	            </div>
	        </div>
		<%-- Start Contact Form --%>
            <div class="col-lg-8 sign-in-div">
	            <p class="text-center col-12">
	                탈퇴하셔도 소유하신 계좌와 가입하신 상품에 변동은 없으며, 언제든지 재가입하실 수 있습니다.
	                <br>단, 상품을 새로 가입하거나 해지하실 경우 재가입이 반드시 필요합니다.
	            </p>
                <form class="contact-form row sign-in-form" method="post" name="form" role="form">

                    <div class="col-lg-4 mb-4 sign-in-div2 py-3">
                        <div class="form-floating">
                            <input type="hidden" class="form-control form-control-lg light-300 " id="customerId" name="customerId" value="${userVO.customerId }"/>
                            <input type="password" class="form-control form-control-lg light-300 " id="password" name="password" placeholder="Password" required/>
                            <label for="floatingPassword light-300">주민번호(7자리: 생년월일6자+뒷자리1자)</label>
                        </div>
                    </div><%-- End Input Password --%>

                    <div class="col-md-12 col-12 m-auto text-center">
                    	<button onclick="requestMsg(event)" class="btn btn-3 rounded-pill px-md-5 px-4 py-2 radius-0 light-300">탈퇴</button>
                    	
                    </div>
                </form>
            </div>
            <%-- End Contact Form --%>
		</div>
	
	
	
	</section>
	<section class="container py-3 text-center"></section>
	<%-- Start Footer --%>
	<jsp:include page="../footer.jsp"></jsp:include>
	<%-- End Footer --%>

	<%-- Bootstrap --%>
	<script src="${path}/assets/js/bootstrap.bundle.min.js"></script>
	<%-- Templatemo --%>
	<script src="${path}/assets/js/templatemo.js"></script>
	<%-- Custom --%>
	<script src="${path}/assets/js/custom.js"></script>
</body>
</html>