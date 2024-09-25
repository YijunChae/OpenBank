<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<title>Profile</title>
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
	<jsp:include page="../header.jsp"/>
	<%-- Start Contact --%>
    <section class="container py-5 text-center">
        <h1 class="col-12 col-xl-8 h2 text-primary pt-3 margin-auto">
		<a class="navbar-brand" href="${path}/">
        Open Bank
		</a>
        </h1>
        <h2 class="col-12 col-xl-8 h4 regular-400 margin-auto">회원 정보 수정</h2>
        <p class="col-12 col-xl-8 text-muted pb-5 light-300 margin-auto">
        	
        </p>

        <div class="row pb-4 sign-up">

            <%-- Start Contact Form --%>
            <div class="col-lg-8 ">
                <form:form class="contact-form row" method="post" name="form" role="form" modelAttribute="m">
					<form:input path="customerId" type="hidden" class="form-control form-control-lg light-300"/>
                            
                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <form:input path="userId" type="text" class="form-control form-control-lg light-300" id="floatingID" name="userId" readonly="true" placeholder="ID"/>
                            <label for="floatingID light-300">아이디</label>
                        </div>
                    </div><%-- End Input userId --%>
					
					<div class="col-lg-6"></div> <%-- 정렬을 위한 더미공간 --%>
					
                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <form:input path="password" type="password" class="form-control form-control-lg light-300" id="password" name="password" placeholder="Password"/>
                            <label for="floatingPassword light-300">비밀번호</label>
                            <form:errors path="password" class="error"/>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <input type="password" class="form-control form-control-lg light-300" id="password-check" name="pw" placeholder="Password check" />
                            <label for="floatingPassword light-300">비밀번호 확인</label>
							<span class="error" id="password-error"></span>
                        </div>
                    </div><%-- End Input Password --%>

					<div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <form:input path="creditPassword" type="password" class="form-control form-control-lg light-300" id="credit-password" name="credit-password" maxlength="6" placeholder="Password"/>
                            <label for="floatingPassword light-300">결제 비밀번호 (6자리 숫자)</label>
                            <form:errors path="creditPassword" class="error"/>
                            <span class="error" id="error-credit-password"></span>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <input type="password" class="form-control form-control-lg light-300" id="credit-password-check" name="credit-pw" placeholder="credit-Password check"  maxlength="6" />
                            <label for="floatingPassword light-300">결제 비밀번호 확인 (6자리 숫자)</label>
							<span class="error" id="credit-password-error"></span>
                        </div>
                    </div><%-- End Input Credit Password --%>


                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <form:input path="name" type="text" class="form-control form-control-lg light-300" id="floatingname" name="name" placeholder="Name"/>
                            <label for="floatingname light-300">이름</label>
                            <form:errors path="name" class="error"/>
                        </div>
                    </div><%-- End Input Name --%>

                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <form:input path="email" type="text" class="form-control form-control-lg light-300" id="floatingmail" name="email" placeholder="Phone"/>
                            <label for="floatingmail light-300">이메일</label>
                            <form:errors path="email" class="error"/>
                            <c:if test="${mailDuplicationCheck}">
                            	<span class='error'>이미 등록된 이메일입니다</span>
                            </c:if>
                        </div>
                    </div><%-- End Input Email --%>

                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <form:input path="phoneNum" type="text" class="form-control form-control-lg light-300" id="phoneNum" name="phoneNum" placeholder="phoneNum"/>
                            <label for="floatingPhone light-300">전화번호</label>
                            <form:errors path="phoneNum" class="error"/>
                            <c:if test="${phoneDuplicationCheck}">
                            	<span class='error'>이미 등록된 전화번호입니다</span>
                            </c:if>
                        </div>
                    </div><%-- End Input phoneNum --%>
<%--
                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                            <form:input path="rrn" type="text" class="form-control form-control-lg light-300" id="rrn" name="rrn" readonly="true" placeholder="rrn"/>
                            <label for="floatingRrn light-300">RRN</label>
                            <form:errors path="rrn" class="error"/>
                            <span id="IDCheck" class="error"></span>
                            <c:if test="${humanDuplicationCheck}">
                            	<span class='error'>이름 또는 주민번호를 확인해주세요</span>
                            </c:if>
                        </div>
                    </div>
 --%>
                    <%-- End Input RRN --%>

                    <div class="col-lg-6 mb-4">
                        <div class="form-floating">
                        	<input type="hidden" id="confmKey" name="confmKey" value="" >
                            <form:input  path="zipCode" type="text" class="form-control form-control-lg light-300" id="zipNo" name="zipNo" readonly="true" placeholder="zipCode"/>
                            <label for="floatingZip light-300">우편번호</label>
                            <form:errors path="address" class="error"/>
                        </div>
                    </div><%-- End Input zipCode --%>

                    <div class="col-12">
                        <div class="form-floating mb-4">
                            <form:input path="address" type="text" class="form-control form-control-lg light-300" id="roadAddrPart1" name="roadAddrPart1" readonly="true" placeholder="address"/>
                            <label for="floatingAddress light-300">주소</label>
                        </div>
                    </div><%-- End Input Address --%>
                    <div class="col-12">
                        <div class="form-floating mb-4">
                            <form:input path="addressDetail" type="text" class="form-control form-control-lg light-300" id="addrDetail" name="addrDetail" placeholder="address detail"/>
                            <label for="floatingAddress light-300">상세주소</label>
                            <form:errors path="addressDetail" class="error"/>
                        </div>
                    </div><%-- End Input Address Detail --%>

                    <div class="col-md-12 col-12 m-auto text-center">
                    	<button type="button" onclick="location.href='${path}/member/quit'" class="btn btn-3 rounded-pill px-md-5 px-4 py-2 radius-0 light-300">회원탈퇴</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">변경하기</button>
                    </div>

                </form:form>
            </div>
            <%-- End Contact Form --%>

        </div>
    </section>
    <%-- End Contact --%>

	
	<%-- Start Footer --%>
    <jsp:include page="../footer.jsp"></jsp:include>
    <%-- End Footer --%>
	
	<%-- Bootstrap --%>
    <script src="${path}/assets/js/bootstrap.bundle.min.js"></script>
    <%-- Templatemo --%>
    <script src="${path}/assets/js/templatemo.js"></script>
	<%-- Custom --%>
	<c:if test="${message}">
		<script>
			let profile=${message}
		</script>
	</c:if>	
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		    const password = document.getElementById('password');
		    const passwordCheck = document.getElementById('password-check');
		    const passwordError = document.getElementById('password-error');
		    
		    const cPassword = document.getElementById('credit-password');
		    const cPasswordCheck = document.getElementById('credit-password-check');
		    const cPasswordError = document.getElementById('credit-password-error');
		    
		    function checkPasswordMatch(password, passwordCheck, error) {
		        if (password.value === passwordCheck.value) {
		        	error.textContent='';
		        	return true;
		        } else {
		            error.textContent = '비밀번호가 일치하지 않습니다';
		            error.style.color = 'red';
		        	return false;
		        }
		    }
		    password.addEventListener('input', () => checkPasswordMatch(password, passwordCheck, passwordError));
		    passwordCheck.addEventListener('input', () => checkPasswordMatch(password, passwordCheck, passwordError));

		    cPassword.addEventListener('input', () => checkPasswordMatch(cPassword, cPasswordCheck, cPasswordError));
		    cPasswordCheck.addEventListener('input', () => checkPasswordMatch(cPassword, cPasswordCheck, cPasswordError));
			
		    const form = document.querySelector('form')
		    form.addEventListener('submit', function(event) {
		    	const isPasswordValid = checkPasswordMatch(password, passwordCheck, passwordError);
		        const isCPasswordValid = checkPasswordMatch(cPassword, cPasswordCheck, cPasswordError);
		        if (!isPasswordValid){
		            event.preventDefault();
		            password.focus();
		    	}else if(!isCPasswordValid) {
		            event.preventDefault();
		            if(cPassword.value.length!==6) alert("결제 비밀번호는 6자리여야 합니다.")
		            cPassword.focus();
		        }else{
		        	console.log("ok");
		        }
		    });
	    });
	</script>
	<script src="${path}/assets/js/custom.js"></script>
</body>
</html>