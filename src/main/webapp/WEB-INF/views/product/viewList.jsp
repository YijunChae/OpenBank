<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<title>상품 목록</title>
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
    <div style="text-align:center; align-content:center;">
	<h2>상품 목록</h2>
	<%--
	<table border="1">
	    <tr>
	        <th>상품 번호</th>
	        <th>상품명</th>
	        <th>가입 대상</th>
	        <th>금리</th>
	        <th>초기 가입금액</th>
	        <th>가입 기간</th>
	        <th>신규 가입 가능 여부</th>
	        <th>상세보기</th>
	    </tr>
	    <c:forEach var="product" items="${products}">
	        <tr>
	            <td>${product.productNum}</td>
	            <td>${product.productName}</td>
	            <td>${product.productTarget == 0 ? '개인' : '법인'}</td>
	            <td>${product.interestRate}</td>
	            <td>${product.initialDeposit}</td>
	            <td>${product.dateOfDeposit}</td>
	            <td>${product.available == 1 ? '가능' : '불가능'}</td>
	            <td><a href="${pageContext.request.contextPath}/product/view/${product.productNum}">상세보기</a></td>
	        </tr>
	    </c:forEach>
	</table>
	 --%>
	 
	<table border="1">
	    <tr>
	        <th>상품 번호</th>
	        <th width="35%">상품명</th>
	        <th>가입 대상</th>
	        <th>금리(%)</th>
	        <th>초기 가입금액</th>
	        <th>가입 기간(개월)</th>
	        <%--
	         <th>신규 가입 가능 여부</th>
	         --%>
	    </tr>
	    <c:forEach var="product" items="${products}">
		    <c:if test="${product.available==1 }">
		        <tr>
		            <td>
			            <a class="text-decoration-none" href="${pageContext.request.contextPath}/product/view/${product.productNum}">
				            ${product.productNum}
	        		    </a>
		            </td>
		            <td>
			            <a class="text-decoration-none" href="${pageContext.request.contextPath}/product/view/${product.productNum}">
		            		${product.productName}
	        		    </a>
		            </td>
		            <td>${product.productTarget == 0 ? '개인' : '법인'}</td>
		            <td>${product.interestRate}</td>
		            <td>${product.initialDeposit}</td>
		            <td>${product.dateOfDeposit}</td>
		            <%--
		            <td>${product.available == 1 ? '가능' : '불가능'}</td>
		             --%>
		        </tr>
		    </c:if>
	    </c:forEach>
	</table>
	</div>
	<br/>
    <div style="height:50px; text-align:center; justify-content: center;">
	<button type="button" onclick="location.href='${path}/'" class="btn btn-3 rounded-pill px-md-5 px-4 py-2 radius-0 light-300">돌아가기</button>
    </div><br/>               

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