<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
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
        <h2 class="col-12 col-xl-8 h4 regular-400 margin-auto">상품 등록</h2>
        <p class="col-12 col-xl-8 text-muted pb-5 light-300 margin-auto">
        	
        </p>

		<div class="row pb-4 sign-up">

			<%-- Start Contact Form --%>
			<div class="col-lg-8 " style="margin-left:auto">
				<form:form modelAttribute="p"
					action="${pageContext.request.contextPath}/product/register"
					method="post">
					<form:hidden path="productNum" />

					<div class="col-lg-6 mb-4">
                        <label for="light-300"><b>가입 대상</b></label><br>
							<form:radiobutton path="productTarget" value="0" label="개인" />
							<form:radiobutton path="productTarget" value="1" label="법인" />
                    </div>

					<div class="col-lg-6 mb-4">
                        <div class="form-floating">
							<form:input path="productName" type="text" class="form-control form-control-lg light-300"/>
							<form:label for="light-300" path="productName">상품명:</form:label>
						</div>
                    </div>

					<div class="col-lg-6 mb-4">
                        <div class="form-floating">
							<form:textarea class="form-control form-control-lg light-300" style="height:120px" path="description" />
							<form:label for="light-300" path="description">상품 설명:</form:label>
						</div>
                    </div>

					<div class="col-lg-6 mb-4">
                        <div class="form-floating">
							<form:input class="form-control form-control-lg light-300" path="interestRate" />
							<form:label for="light-300" path="interestRate">금리(%):</form:label>
						</div>
                    </div>

					<div class="col-lg-6 mb-4">
                        <div class="form-floating">
							<form:input class="form-control form-control-lg light-300" path="initialDeposit" />
							<form:label for="light-300"  path="initialDeposit">초기 가입금액(원):</form:label>
						</div>
                    </div>

					<div class="col-lg-6 mb-4">
                        <div class="form-floating">
							<form:input class="form-control form-control-lg light-300" path="dateOfDeposit" />
							<form:label for="light-300"  path="dateOfDeposit">가입 기간(개월):</form:label>
						</div>
                    </div>

					<div class="col-lg-6 mb-4">
						<form:label for="light-300"  path="available"><b>신규 가입 가능 여부: </b></form:label>
						<form:radiobutton path="available" value="1" label="가능" />
						<form:radiobutton path="available" value="0" label="불가능" />
                    </div>	
				<button type="submit" class="btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">등록하기</button>
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
	<script src="${path}/assets/js/custom.js"></script>
</body>
</html>