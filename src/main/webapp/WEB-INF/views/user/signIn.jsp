<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<%-- 
    <title>Purple Buzz HTML Template with Bootstrap 5 Beta 1</title>
 --%>
	<title>Sign In</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="${path}/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="${path}/assets/img/favicon.ico">
    <%-- Load Require CSS --%>
    <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet">
    <%-- Font CSS --%>
    <link href="${path}/assets/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <%-- Load Tempalte CSS --%>
    <link rel="stylesheet" href="${path}/assets/css/templatemo.css">
    <%-- Custom CSS --%>
    <link rel="stylesheet" href="${path}/assets/css/custom.css">
<!--
	원본 템플릿:
	TemplateMo 561 Purple Buzz
	https://templatemo.com/tm-561-purple-buzz
-->
</head>
<body>

	<%-- Start Contact --%>
    <section class="container py-5 text-center">
        <h1 class="col-12 col-xl-8 h2 text-primary pt-3 margin-auto">
		<a class="navbar-brand" href="${path}/">
        Open Bank
		</a>
        </h1>
        <h2 class="col-12 col-xl-8 h4 regular-400 margin-auto">Login page</h2>
        <p class="col-12 col-xl-8 text-muted pb-5 light-300 margin-auto">
            
        </p>

        <div class="row pb-4 sign-up">

            <%-- Start Contact Form --%>
            <div class="col-lg-8 sign-in-div">
                <form:form class="contact-form row sign-in-form" method="post" name="form" role="form" modelAttribute="m">

                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <form:input path="userId" type="text" class="form-control form-control-lg light-300 " id="floatingID" name="userId" placeholder="ID" required="true"/>
                            <label for="floatingID light-300">ID</label>
                            <form:errors path="userId" class="error"/>
                        </div>
                    </div><%-- End Input userId --%>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <form:input path="password" type="password" class="form-control form-control-lg light-300 " id="floatingPassword" name="password" placeholder="Password" required="true"/>
                            <label for="floatingPassword light-300">Password</label>
                            <form:errors path="password" class="error"/>
                        </div>
                    </div><%-- End Input Password --%>

                    <div class="col-md-12 col-12 m-auto text-center">
                    	<button type="button" onclick="location.href='/ob/'" class="btn btn-3 rounded-pill px-md-5 px-4 py-2 radius-0 light-300">돌아가기</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn sign-in-btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">로그인</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<button type="button" onclick="location.href='/ob/member/signUp'" class="btn btn-3 rounded-pill px-md-5 px-4 py-2 radius-0 light-300">회원가입</button>
                    	
                    </div>
                </form:form>
                    <div class="col-md-12 col-12 m-auto text-center" style="padding-top:20px; padding-right:28px;">
						<%--
						<script src = "https://developers.kakao.com/sdk/js/kakao.js"></script>
						<script>
						  Kakao.init('${api.kakaoJs}'); // 사용하려는 앱의 JavaScript 키 입력
						</script>
						<script>
						  let loginWithKakao = function() {
						    Kakao.Auth.authorize({
						      redirectUri: 'http://localhost:8008/ob/member/kakao-login',
						      serviceTerms: 'account_email name phone_number',
					    	  prompt: 'select_account'
					    	  , state:'userme'
						    });
						  }
						</script>
						
						<a id="kakao-login-btn" href="javascript:loginWithKakao()">
						  <img src="${path}/assets/img/kakao-login.png"
						    alt="카카오 로그인 버튼" />
						</a>
						 --%>
						<div class="col-lg-6 mb-4"></div>
						<div class="col-lg-6 mb-4"></div>
						<div class="col-lg-6 mb-4"></div>
                   		<a href="${location}">
						  <img src="${path}/assets/img/kakao-login.png"
						    alt="카카오 로그인 버튼" />
						</a>
						

                    </div>
            </div>
            <%-- End Contact Form --%>

        </div>
    </section>
    <%-- End Contact --%>

	
	<%-- Start Footer --%>
    <jsp:include page="../footer.jsp"></jsp:include>
    <%-- End Footer --%>
	
	<%-- Custom --%>
	<script>
	if('${loginChk}'!=''){
		let login = ${loginChk}
		if(!login) alert("아이디 또는 비밀번호가 다릅니다.")
	}
	</script>
	<script src="${path}/assets/js/custom.js"></script>
	<%-- Bootstrap --%>
    <script src="${path}/assets/js/bootstrap.bundle.min.js"></script>
    <%-- Templatemo --%>
    <script src="${path}/assets/js/templatemo.js"></script>
</body>
</html>