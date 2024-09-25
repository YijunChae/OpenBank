<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer</title>
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
<%--
원본 파일명: index.html
--%>
</head>
<style>
	.error {
	    color: red;
	}
</style>
<body>
    <%-- Header --%>
    <jsp:include page="../header.jsp"></jsp:include>
    <%-- Close Header --%>
    
    <%-- Start Contact --%>
    <section class="container py-5 text-center">
        <h1 class="col-12 col-xl-8 h2 text-primary pt-3 margin-auto">
		<a class="navbar-brand" href="${path}/">
        Transfer
		</a>
        </h1>
        <h2 class="col-12 col-xl-8 h4 regular-400 margin-auto">계좌 이체</h2>
        <p class="col-12 col-xl-8 text-muted pb-5 light-300 margin-auto">
            
        </p>

        <div class="row pb-4 sign-up">

            <%-- Start Contact Form --%>
            <div class="col-lg-8 sign-in-div">
                <div class="contact-form row sign-in-form" id="form">
                    <!-- 응답테스트 -->
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <div class="form-control form-control-lg light-300 formSelect" id="wAcc"></div>
                            <label for="floatingID light-300">출금할 계좌</label>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <div class="formSelect form-control form-control-lg light-300 " id="dAcc"></div>
                            <label for="floatingPassword light-300">입금될 계좌</label>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <div class="form-control form-control-lg light-300 " id="amt" name="amount"></div>
                            <label for="floatingPassword light-300">금액</label>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <div class="form-control form-control-lg light-300 " id="dName"></div>
                            <label for="floatingPassword light-300">보내는 사람 이름</label>
                        </div>
                    </div>
                    <div class="col-md-12 col-12 m-auto text-center">
					<button type="button" id="btn1" class="btn sign-in-btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">다음</button>
                    </div>
                </div>
			</div>		
		</div>			

            <!-- Button trigger modal -->
            <%-- End Contact Form --%>
					
					<!-- Modal -->
        <div class="row pb-4 sign-up">
					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog  modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">
								결과 안내					        
					        </h1>
					        <button type="button" onclick="backlist()" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
			                <div class="contact-form row modal-form" id="modal-form" >
								        <%------------------------ --%>
			                    <div class="col-lg-4 mb-4 sign-in-div2">
			                        <div class="form-floating  border-clean">
			                            ${transactionError}
			                        </div>
			                    </div>
			
			<%----------------- --%>
			           		</div>
					      </div>
					      <div class="modal-footer">
					      <%-- 버튼 색상 css 지정할것 --%>
	                        <button type="button" onclick="backlist()" class="btn btn-primary" data-bs-dismiss="modal">&nbsp;&nbsp;확인&nbsp;&nbsp;</button>
					      </div>
					    </div>
					</div>
           		</div>	
			</div>
			
		
			
        </div>
		<%-- End Modal --%>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${path}/assets/js/custom.js"></script>
	<script>
	let backlist = function(){
		location.href="/ob/account/"
	};
	$(document).ready(function() {
		$('#staticBackdrop').modal('show');
	})
	            			
	</script>
    <%-- Load jQuery require for isotope --%>
    <script src="${path}/assets/js/jquery.min.js"></script>
    <%-- Isotope --%>
    <script src="${path}/assets/js/isotope.pkgd.js"></script>
</body>

</html>