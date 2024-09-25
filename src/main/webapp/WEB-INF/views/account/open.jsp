<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<%-- 
    <title>Purple Buzz HTML Template with Bootstrap 5 Beta 1</title>
 --%>
    <title>Open An Account</title>
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
        상품 가입 페이지
        <a class="navbar-brand" href="${path}/bank/">
        </a>
        </h1>
        <h2 class="col-12 col-xl-8 h4 regular-400 margin-auto">금리: ${product.interestRate}%</h2>
        <p class="col-12 col-xl-8 text-muted pb-5 light-300 margin-auto">
            초기 가입금액: ${product.initialDeposit }
        </p>

        <div class="row pb-4 sign-up">
            <%-- Start Contact Form --%>
            <div class="col-lg-8 sign-in-div">
                <form:form class="contact-form row sign-in-form" method="post" id="form" name="form" role="form" modelAttribute="openAcc">
                    <form:input path="customerId" type="hidden"/>
                    <form:input path="customerName" type="hidden"/>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <div class="form-control form-control-lg light-300">${product.productName}</div>
                            <label for="floatingPassword light-300">상품명</label>
                        </div>
                    </div><%-- 표시용 --%>

                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <div class="form-control form-control-lg light-300">${openAcc.customerName}</div>
                            <label for="floatingPassword light-300">가입자명</label>
                        </div>
                    </div><%-- 표시용 --%>

                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <form:input path="accName" type="text" class="form-control form-control-lg light-300" id="accName" name="accName" placeholder="Account Name" value="통장 별명을 설정해주세요"/>
                            <label for="floatingname light-300">통장명</label>
                            <form:errors path="accName" class="error"/>
                        </div>
                    </div>

                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <input type="password" class="form-control form-control-lg light-300" id="password" name="creditPassword" placeholder="Account Password" required="true"/>
                            <label for="floatingname light-300">결제 비밀번호</label>
                        </div>
                    </div>
                    
                    <%-- 약관 동의 버튼 --%>
                    <div class="col-lg-12 text-center mb-4">
                        <button type="button" class="btn btn-primary sign-in-btn rounded-pill px-md-5 px-4 py-2 radius-0 light-300" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                            약관 동의
                        </button>
                    </div>

                    <button type="submit" id="submitButton" class="btn sign-in-btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">상품 가입</button>
                </form:form>
            </div>
            <%-- End Contact Form --%>
        </div>

        <%-- Vertically centered scrollable modal --%>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">약관 동의</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <%-- 모달 내용 --%>
                <p><strong>상품명:</strong> ${product.productName }</p>
    			<p><strong>가입대상:</strong> 만 19세 이상 개인</p>
			    <p><strong>가입기간:</strong> ${product.dateOfDeposit}개월</p>
			    <p><strong>초기 가입금액:</strong> ${product.initialDeposit }원</p>
			    <p><strong>이자율:</strong> 연 ${product.interestRate }%</p>
			    <p><strong>중도해지 시 이자율:</strong> 연 1.0%</p>
			    <p><strong>만기 시:</strong> 이자 및 원금은 가입 계좌로 자동 입금됩니다.</p>
			    <p><strong>보호:</strong> 본 상품은 예금자보호법에 따라 보호됩니다.</p>
			    <p><strong>기타 사항:</strong> 다음 약관에 따릅니다.</p>
			    <p>${product.description}</p>
              </div>
              <div class="modal-footer justify-content-center">
                <button type="button" id="agreeButton" class="btn btn-primary">약관 동의</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">동의 안 함</button>
              </div>
            </div>
          </div>
        </div>
    </section>
    <%-- End Contact --%>

    <%-- Start Footer --%>
    <jsp:include page="../footer.jsp"></jsp:include>
    <%-- End Footer --%>
    
    <%-- Custom --%>
    <c:if test="${openAnAcc}">
    <script>
        var accmsg = ${openAnAcc}
    </script>
    </c:if>
    <script src="${path}/assets/js/custom.js"></script>
    <%-- Bootstrap --%>
    <script src="${path}/assets/js/bootstrap.bundle.min.js"></script>
    <%-- Templatemo --%>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${path}/assets/js/templatemo.js"></script>
    <script>
        let agreed = false;
		let pChk = false;
        document.getElementById('agreeButton').addEventListener('click', function() {
            agreed = true;
            var modal = bootstrap.Modal.getInstance(document.getElementById('exampleModalCenter'));
            modal.hide();
        });

        document.getElementById('submitButton').addEventListener('click', function(event) {
            if (!agreed) {
                event.preventDefault();
                alert('약관에 동의해 주세요.');
            }
            var p = $('#password').val();
            if(agreed && p!=''){
                event.preventDefault();
      
                $.ajax({
	                type: 'POST',
	                url: '/ob/member/credit-password',
	                data: { creditPassword: p },
	                success: function(result) {
	                	if(result){
	                		pChk = true;
	                		console.log(p)
	                		$('#form').submit();
	                		return true;
	                	}
	                	else alert('결제 비밀번호가 맞지 않습니다.')
	                }, error: function(error) {
	                    alert('잘못된 요청입니다');
	                    console.error(error);
	                }
	            });        	
            }
        
        });
    </script>
</body>
</html>