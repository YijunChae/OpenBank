<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
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
<body>
<%-- Header --%>
    <jsp:include page="../header.jsp"></jsp:include>
    <%-- Close Header --%>
	
	
    <section class="container py-5 text-center" style="margin-bottom:20px;">
        <h2 class="col-12 col-xl-8 h2 text-primary pt-3 margin-auto">
        상품 상세정보
        </h2>
        <h2 class="col-12 col-xl-8 h4 regular-400 margin-auto"></h2>
        <p class="col-12 col-xl-8 text-muted pb-5 light-300 margin-auto">
        </p>

<table style="width:400px; margin:auto">
    <tr>
        <th width="40%">상품 번호</th>
        <td>${product.productNum}</td>
    </tr>
    <tr>
        <th>상품명</th>
        <td>${product.productName}</td>
    </tr>
    <tr>
        <th>가입 대상</th>
        <td>${product.productTarget == 0 ? '개인' : '법인'}</td>
    </tr>
    <tr>
        <th>금리</th>
        <td>${product.interestRate}</td>
    </tr>
    <tr>
        <th>초기 가입금액</th>
        <td>${product.initialDeposit}</td>
    </tr>
    <tr>
        <th>가입 기간</th>
        <td>${product.dateOfDeposit}</td>
    </tr>
    <tr>
        <th>신규 가입 가능 여부</th>
        <td>${product.available == 1 ? '가능' : '불가능'}</td>
    </tr>
</table>
<br/>
<br/>
    <div style="height:55px; text-align:center; justify-content: center;">
	<button type="button" onclick="location.href='${path}/account/openAcc/${product.productNum}'" class="btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">가입하기</button>
    </div>
    <div style="height:55px; text-align:center; justify-content: center;">
	<button type="button" onclick="location.href='${path}/product/view'" class="btn btn-3 rounded-pill px-md-5 px-4 py-2 radius-0 light-300">목록으로</button>
    </div>
	
	</section>
    <div style="height:10px;"></div>
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