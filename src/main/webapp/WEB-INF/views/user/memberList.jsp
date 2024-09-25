<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
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
                <h1 class="display-4">회원 목록</h1>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/member/admin/search" method="get" class="form-inline row justify-content-center">
                    <div class="form-group col-md-3">
                        <input class="form-control w-100" type="search" name="keyword" placeholder="검색" aria-label="Search" value="${param.keyword}">
                    </div>
                    <div class="form-group col-md-3">
                        <select class="form-control w-100" name="type">
                            <option value="userId" ${param.type == 'userId' ? 'selected' : ''}>아이디</option>
                            <option value="name" ${param.type == 'name' ? 'selected' : ''}>이름</option>
                            <option value="phoneNum" ${param.type == 'phoneNum' ? 'selected' : ''}>전화번호</option>
                            <option value="email" ${param.type == 'email' ? 'selected' : ''}>이메일</option>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <button class="btn btn-primary w-100" type="submit">검색</button>
                    </div>
                </form>
                <c:choose>
                    <c:when test="${empty members}">
                        <div class="alert alert-warning mt-4" role="alert">
                            조회된 회원이 없습니다.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped mt-4">
                            <thead>
                                <tr>
                                    <th>회원번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>전화번호</th>
                                    <th>이메일</th>
                                    <th>주소</th>
                                    <th>고객유형</th>
                                    <th>가입일자</th>
                                    <th>상세보기</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="member" items="${members}">
                                    <tr>
                                        <td>${member.customerId}</td>
                                        <td>${member.userId}</td>
                                        <td>${member.name}</td>
                                        <td>${member.phoneNum}</td>
                                        <td>${member.email}</td>
                                        <td>${member.address}</td>
                                        <td><c:choose>
                                                <c:when test="${member.customerType == 0}">일반 사용자</c:when>
                                                <c:when test="${member.customerType == 1}">관리자</c:when>
                                                <c:otherwise>거래정지</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${member.regDate}</td>
                                        <td><a href="${pageContext.request.contextPath}/member/admin/detail/${member.customerId}">상세보기</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
                <c:if test="${not empty param.keyword}">
                    <a href="${pageContext.request.contextPath}/member/admin/list" class="btn btn-secondary mt-3">전체 목록 보기</a>
                </c:if>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/templatemo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
</body>
</html>