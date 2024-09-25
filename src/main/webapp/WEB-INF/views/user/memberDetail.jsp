<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세 정보</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/templatemo.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
</head>
<body>
    <!-- Include header -->
    <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

    <div class="container mt-5">
        <div class="card">
            <div class="card-header text-center">
                <h2>회원 상세 정보</h2>
            </div>
            <div class="card-body">
                <table class="table table-striped">
                    <tr>
                        <th>회원번호</th>
                        <td>${member.customerId}</td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>${member.userId}</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${member.name}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${member.phoneNum}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${member.email}</td>
                    </tr>
                    <tr>
                        <th>우편번호</th>
                        <td>${member.zipCode}</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${member.address}</td>
                    </tr>
                    <tr>
                        <th>상세주소</th>
                        <td>${member.addressDetail}</td>
                    </tr>
                    <tr>
                        <th>고객유형</th>
                        <td><c:choose>
                                <c:when test="${member.customerType == 0}">일반 사용자</c:when>
                                <c:when test="${member.customerType == 1}">관리자</c:when>
                                <c:otherwise>거래정지</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>가입일자</th>
                        <td>${member.regDate}</td>
                    </tr>
                </table>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/member/admin/list">회원 목록으로 돌아가기</a>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/templatemo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
</body>
</html>