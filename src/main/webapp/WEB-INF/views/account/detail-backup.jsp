<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Detail</title>
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
	th{
		background-color:#9396e8;
		color:white;
		text-align:center;
	}
	table{
		width:100%;
	}
	.date-input-container {
	    display: flex;
	    align-items: center;
	}
	.width-60{
		width:60% !important;
	}
	.no-border{
		border-width: 0px;
	}
</style>
<body>
    <%-- Header --%>
    <jsp:include page="../header.jsp"></jsp:include>
    <%-- Close Header --%>
    

    <!-- Start Work Sigle -->
    <section class="container py-5">
		<div class="row pt-5">
	            <div class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
	                <h2 class="worksingle-heading h3 pb-3 typo-space-line"><b>${account.accName }</b></h2>
	                <input type="button" id="btn1" class="btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-right light-300 white-box"
	                style="margin-left:80%; margin-top:-90px" value="해지">
	                <p class="worksingle-footer py-1 text-muted light-300">
	                </p>
               	<table border="0" style="width:100%;">
			    <tr>
			        <th width=20%>계좌번호</th>
			        <td>${account.accNum}</td>
			    </tr>
			    <tr>
			        <th>잔액</th>
			        <td>${String.format("%,d", account.balance)}원</td>
			    </tr>
			    <tr>
			        <th>가입일</th>
			        <td>${account.regDate}</td>
			    </tr>
			    <tr>
			        <th>만료일</th>
			        <td>${account.retDate}</td>
			    </tr>
			    <%-- 
			    <tr>
			        <th>최근 거래일</th>
			        <td>${account.lastTradeDate}</td>
			    </tr>
			     --%>
		        <tr>
		            <!-- 
		             <td>${product.productTarget == 0 ? '개인' : '법인'}</td>
		             -->
		        </tr>
			</table>	
	                	
	                		
	            </div>
	        </div>
	        
	   <!-- Start Contact -->
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto my-4 p-3 width-60">
                    <form action="#" method="get">
                    <div class="input-group py-3">
                        <div class="form-control form-control-lg rounded-pill rounded-end date-input-container">
                        <input class="no-border" type="date" id="startDate" name="startDate"/>&nbsp;~&nbsp; 
                        <input class="no-border" type="date" id="endDate" name="endDate"/>
                        </div>
                        <button class="btn btn-secondary text-white btn-lg rounded-pill rounded-start px-lg-4" type="submit">내역조회</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    <!-- End Contact -->
<%--
accNum,acc_name accName,
		product_num productNum, balance,
		to_char(reg_date, 'yyyy-mm-dd') regDate,
		to_char(ret_date, 'yyyy-mm-dd') retDate,
		to_char(last_trade_date, 'yyyy-mm-dd') lastTradeDate
 --%>
 		
       <div class="row pt-4">
           <div class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
			<table border="0">
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
			    <c:forEach var="t" items="${transaction}">
			        <tr>
			            <td>${t.transactionDate}</td>
			            <%--
			            <td>${t.transactionType}</td>
			             --%>

			            <td>${t.withdrawName}</td>
			        <c:if test="${ t.transactionType.equals('입금')}">
			            <td>${String.format("%,d", t.amount)}</td>
			            <td></td>
			        </c:if>
			        <c:if test="${ t.transactionType.equals('출금')}">
			            <td></td>
			            <td>${String.format("%,d", t.amount)}</td>
			        </c:if>
						<td>${String.format("%,d", t.WAfterBalance)}</td>
			        </tr>
			    </c:forEach>	
			</table>	
        </div><!-- End Blog Cover -->
	</div>
	<p class="worksingle-footer py-1 text-muted light-300">
	                
    </section>
    
    <!-- End Work Sigle -->

<%--
    <!-- Start Related Post -->
    <article class="container-fluid bg-light">
        <div class="container">
            <div class="worksingle-related-header row">
                <h1 class="h2 py-5">Related Post</h1>
                <div class="col-md-12 text-left justify-content-center">
                    <div class="row gx-5">


                        <div class="col-sm-6 col-lg-4 mb-5">
                            <a href="#" class="related-content card text-decoration-none overflow-hidden h-100">
                                <img class="related-img card-img-top" src="${path}/assets/img/related-post-01.jpg" alt="Card image cap">
                                <div class="related-body card-body p-4">
                                    <h5 class="card-title h6 m-0 semi-bold-600 text-dark">Digital Marketing</h5>
                                    <p class="card-text pt-2 mb-1 light-300 text-dark">
                                        Lorem ipsum dolor sit amet, consectetur.
                                    </p>
                                    <div class="d-flex justify-content-between">
                                        <span class="text-primary light-300">Read more</span>
                                        <div class="light-300">
                                            <i class='bx-fw bx bx-heart me-1'></i>5
                                            <i class='bx-fw bx bx-chat    ms-1 me-1'></i>3
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-sm-6 col-lg-4 mb-5">
                            <a href="#" class="related-content card text-decoration-none overflow-hidden h-100">
                                <img class="related-img card-img-top" src="${path}/assets/img/related-post-02.jpg" alt="Card image cap">
                                <div class="related-body card-body p-4">
                                    <h5 class="card-title h6 m-0 semi-bold-600 text-dark">App Development</h5>
                                    <p class="card-text pt-2 mb-1 light-300 text-dark">
                                        Tempor incididunt ut labore et dolore.
                                    </p>
                                    <div class="d-flex justify-content-between">
                                        <span class="text-primary light-300">Read more</span>
                                        <div class="light-300">
                                            <i class='bx-fw bx bx-heart me-1'></i>11
                                            <i class='bx-fw bx bx-chat    ms-1 me-1'></i>9
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-sm-6 col-lg-4 mb-5">
                            <a href="#" class="related-content card text-decoration-none overflow-hidden h-100">
                                <img class="related-img card-img-top" src="${path}/assets/img/related-post-03.jpg" alt="Card image cap">
                                <div class="related-body card-body p-4">
                                    <h5 class="card-title h6 m-0 semi-bold-600 text-dark">Digital Marketing</h5>
                                    <p class="card-text pt-2 mb-1 light-300 text-dark">
                                        Consectetur adipiscing elit.
                                    </p>
                                    <div class="d-flex justify-content-between">
                                        <span class="text-primary light-300">Read more</span>
                                        <div class="light-300">
                                            <i class='bx-fw bx bx-heart me-1'></i>31
                                            <i class='bx-fw bx bx-chat    ms-1 me-1'></i>2
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

    </article>
    <!-- End Related Post -->
 --%>
    <%-- MODAL --%>
        <div class="row pb-4 sign-up">
					<div class="modal fade" id="staticBackdrop"  <%-- data-bs-backdrop="static" data-bs-keyboard="false" --%> tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog  modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">
					        계좌 해지 확인
					        </h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
			<div class="col-lg-8">
					      <div class="modal-body">
                <form class="contact-form row modal-form" id="form" method="POST" action="/ob/account/close" name="modal-form">
					        <%------------------------ --%>
            
                    <div class="col-lg-4 mb-3 sign-in-div2">
                        <div class="form-floating  border-clean">
                            <div class="form-control form-control-lg light-300 formSelect border-clean" id="wAcc" style="padding-top:2rem;">${account.accName }(${account.accNum})</div>
                            <input type="hidden" name="withdrawAcc" value="${account.accNum}"/>
                            <label for="floatingID light-300">아래 계좌를 해지하고,</label>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating border-clean">
                            <select class="form-control form-control-lg light-300 formSelect" id="dAcc" name="depositAcc">
                            	<c:forEach items="${accList}" var="a">
	                            	<c:if test="${a.avaliable>0&&!a.accNum.equals(account.accNum)}">
	                            		<option value="${a.accNum}">${a.accName}(${a.accNum})</option>
	                            	</c:if>
                            	</c:forEach>
                            </select>
                            <div class="formSelect form-control form-control-lg light-300 border-clean text-center" id="wName-modal"></div>
                            <label for="floatingPassword light-300">모든 잔액을</label>
                            <label class="label2" style="top:63px!important" for="floatingPassword light-300">계좌로 입금합니다.</label>
                    	<b>※주의사항※</b>
                    	<br/>
                    	<small>- 입금될 계좌를 누르면 변경할 수 있습니다.<br/>
                    			- 잔액이 0원일 경우 입금될 계좌를 지정하지 않아도 해지가 가능합니다.</small>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-2 sign-in-div2 ">
                        <div class="error form-floating border-clean">
                        <%--
                            <div class="formSelect form-control form-control-lg light-300 border-clean text-center" id="amount-modal"></div>
                         --%>
                        '해지하기' 버튼을 누를 경우 바로 해지가 진행됩니다. 
                        <br>해지가 완료되면 취소가 불가능합니다.
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 sign-in-div2">
                        <div class="form-floating">
                            <input type="password" class="form-control form-control-lg light-300 " id="credit-password" placeholder="password"/>
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
	                        <button type="submit" form="form" class="btn btn-primary">&nbsp;&nbsp;해지하기&nbsp;&nbsp;</button>
					      </div>
					    </div>
					  </div>
					</div>
           		</div>	
			</div>
    
    
    
    
    <%-- Start Footer --%>
    <jsp:include page="../footer.jsp"></jsp:include>
    <%-- End Footer --%>
    
    
    <%-- Bootstrap --%>
    <script src="${path}/assets/js/bootstrap.bundle.min.js"></script>
    <%-- Templatemo --%>
    <script src="${path}/assets/js/templatemo.js"></script>
    <%-- Custom --%>
    <script src="${path}/assets/js/custom.js"></script>
    <%-- Load jQuery require for isotope --%>
    <script src="${path}/assets/js/jquery.min.js"></script>
    <%-- Page Script --%>
    <script src="${path}/assets/js/accountDetail.js"></script>
    <script>
    <%--
        $(document).ready(function(){
        	var endDate = document.getElementById("endDate");
        	var startDate = document.getElementById("startDate");
            var today = new Date();

            let fm = function(today){
	            var year = today.getFullYear();
	            var month = today.getMonth() + 1; // 월이 0부터 시작함
	            var day = today.getDate();
	 			
	            if (month < 10) {
	                month = "0" + month;
	            }
	            if (day < 10) {
	                day = "0" + day;
	            }
            	return year + "-" + month + "-" + day;
			}
            endDate.value = fm(today);
            today.setMonth(today.getMonth() - 1);
            startDate.value = fm(today);
        	
        	
        	document.getElementById('btn1').addEventListener('click', function() {
        		$('#staticBackdrop').modal('show');
            });
			var ing = true;
        	$('#form').on('submit', function(e){
   	    		if(!ing) return true;
   	    		e.preventDefault();
        		var cp = $('#credit-password').val();
        		if(cp!='' && ing){
    	    		$.ajax({
    	                type: 'POST',
    	                url: '/ob/member/credit-password',
    	                data: { creditPassword: cp },
    	                success: function(result) {
    	                	if(result){
    	                		console.log("success")
    	                		$('#form').submit();
    	                		ing=false;
    	                		return true;
    	                	}
    	                	else alert('비밀번호가 맞지 않습니다.')
    	                }, error: function(error) {
    	                    alert('잘못된 요청입니다');
    	                    console.error(error);
    	                }
    	            });
        		}else{
        			alert("결제 비밀번호를 입력해주세요")
        			$('#credit-password').focus()
        		}
    		});
        });
    --%>
    </script>

</body>

</html>