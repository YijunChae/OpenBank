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
                <form:form class="contact-form row sign-in-form" method="POST" action="/ob/transaction/transfer" id="form" name="form" role="form" modelAttribute="t">
                    <!-- 응답테스트 -->
                    <form:input path="withdrawName" id="wName" type="hidden"/>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <form:select path="withdrawAcc" type="text" class="form-control form-control-lg light-300 formSelect" id="wAcc" name="withdrawAcc" placeholder="withdraw Account" required="true">
                            	<c:forEach items="${accList}" var="a">
	                            	<c:if test="${a.avaliable>0}">
	                            		<form:option value="${a.accNum}">${a.accName}(${a.accNum})</form:option>
									</c:if>
                            	</c:forEach>
                            </form:select>
                            <label for="floatingID light-300">출금할 계좌</label>
                            <form:errors path="withdrawName" class="error"/>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <form:input path="depositAcc" type="text" class="formSelect form-control form-control-lg light-300 " id="dAcc" name="depositAcc" placeholder="deposit Account" required="true"/>
                            <label for="floatingPassword light-300">입금될 계좌</label>
                            <form:errors path="depositAcc" class="error"/>
                            <span id="accErr" class="error"></span>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <form:input path="amount" type="text" class="form-control form-control-lg light-300 " id="amt" name="amount" placeholder="Amount" required="true" maxlength="9"/>
                            <label for="floatingPassword light-300">금액</label>
                            <span id="amtErr" class="error"></span>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <form:input path="depositName" type="text" class="form-control form-control-lg light-300 " id="dName" name="depositName" placeholder="Name" value="${userVO.name }"/>
                            <label for="floatingPassword light-300">보내는 사람 이름</label>
                            <form:errors path="depositName" class="error"/>
                        </div>
                    </div>
                    <div class="col-md-12 col-12 m-auto text-center">
					<input type="submit" id="btn1" class="btn sign-in-btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300" value="다음">
                    </div>
                </form:form>
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
					        송금 확인
					        </h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
			<div class="col-lg-8">
					      <div class="modal-body">
                <form class="contact-form row modal-form" id="modal-form" method="POST" action="/ob/transaction/transfer" name="modal-form">
					        <%------------------------ --%>
            
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating  border-clean">
                            <div class="form-control form-control-lg light-300 formSelect border-clean" id="wAcc-modal"></div>
                            <label for="floatingID light-300">아래 계좌에서</label>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating border-clean">
                            <div class="formSelect form-control form-control-lg light-300 border-clean text-center" id="wName-modal"></div>
                            <label for="floatingPassword light-300">받는사람</label>
                            <label class="label2" for="floatingPassword light-300">님께</label>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2 ">
                        <div class="form-floating border-clean">
                            <div class="formSelect form-control form-control-lg light-300 border-clean text-center" id="amount-modal"></div>
                        </div>
                        송금합니다.
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <input type="password" class="form-control form-control-lg light-300 " id="credit-password" placeholder="Name" required/>
                            <label for="floatingPassword light-300">결제 비밀번호를 입력해주세요</label>
                        </div>
                    </div>
                    <div class="col-md-12 col-12 m-auto text-center">
                    </div>
<%----------------- --%>
                </form>
					      </div>
					      <div class="modal-footer">
					      <%-- 버튼 색상 css 지정할것 --%>
					        <button type="button" class="btn btn-secondary transfer-dismiss white-box" data-bs-dismiss="modal">취소</button>
	                        <button type="submit" form="form" class="btn btn-primary">&nbsp;&nbsp;송금하기&nbsp;&nbsp;</button>
					      </div>
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
		var ready = false;
		var cpChk = false;
	$(document).ready(function() {
		$('#dAcc').on('change', function(){ 
			ready=false
		})
		$('#amt').on('change', function(){ 
			ready=false
		})

    	$('#form').on('submit', function(e){
    		var cp = $('#credit-password').val();
    		if(ready && cpChk){
    			return true;
    		}else if(ready && cp!=''){
	    		e.preventDefault();
				
	    		$.ajax({
	                type: 'POST',
	                url: '/ob/member/credit-password',
	                data: { creditPassword: cp },
	                success: function(result) {
	                	if(result){
	                		cpChk = true;
	                		$('#form').submit();
	                		return true;
	                	}
	                	else alert('비밀번호가 맞지 않습니다.')
	                }, error: function(error) {
	                    alert('잘못된 요청입니다');
	                    console.error(error);
	                }
	            });
    		}else{
	    		e.preventDefault();
		
				var dAcc = $('#dAcc').val();
		        var wAcc = $('#wAcc').val();
		        
		        $('#accErr').text((wAcc==dAcc) ? '동일한 계좌끼리는 이체할 수 없습니다.':'');
	        	$('#amtErr').text((Number($('#amt').val())<500) ? '송금은 500원부터 가능합니다.':'');
				
				$.ajax({
	                type: 'GET',
	                url: '/ob/api/account/accCheck',
	                data: { accNum: dAcc },
	                success: function(result) {
	                	if(result==""){
	               			$('#accErr').text("존재하지 않는 계좌입니다.");
	                	}else{
	                		var amt = $('#amt').val()
		                    $('#wName').val(result);
		                    $('#wAcc-modal').text($('#wAcc').val());
		                    $('#amount-modal').text(amt.toString().replace(/(\d+)(\d{4})$/, '$1만 $2').concat('원'));
		                    $('#wName-modal').text(result);
		                    ready=true;
		                    if($('#accErr').text()==$('#amtErr').text())
	                    		$('#staticBackdrop').modal('show');
	            			}
	                }, error: function(error) {
	                    $('#accErr').text('존재하지 않는 계좌입니다.');
	                    console.error(error);
	                }
	            });
    		}
		});
		
	});
	</script>
    <%-- Load jQuery require for isotope --%>
    <script src="${path}/assets/js/jquery.min.js"></script>
    <%-- Isotope --%>
    <script src="${path}/assets/js/isotope.pkgd.js"></script>
	<script>
		document.getElementById("dAcc").value = "";
		document.getElementById("amt").value = "";
	</script>
</body>

</html>