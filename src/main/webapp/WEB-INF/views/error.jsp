<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="display-4">오류 발생</h1>
        <p class="lead">요청하신 페이지를 찾을 수 없습니다!</p>
        <hr class="my-4">
        <p>이전 페이지로 돌아가거나 관리자에게 문의하세요!</p>
        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/" role="button">홈으로</a>
    </div>
</body>
</html>