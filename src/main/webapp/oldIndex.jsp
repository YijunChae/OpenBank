<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
	Spring Test Index
	</h3>
	<br>
	<%-- 총자산 확인? -> 분산된 통장들 은행별 금액 합산/총 합산 등 --%>
	<%-- 통장이랑 카드는 조건별 검색/추천? 카드는 없는데 우리 --%>
	<%-- ㅋㅋㅋ생애주기별 적금ㅋㅋㅋㅋㅋ ++ 네이버 적금상품 검색하면 Npay 예적금 비교 있음(신기함) --%>
	
<%-- 
	<a href="<%=request.getContextPath()%>/ajax/resBody.json"> JSON 응답
	</a>
	<br>
	<a href="<%=request.getContextPath()%>/ajax/resVOBody.json"> JSON
		VO 응답 </a>
	<br>
	<a href="<%=request.getContextPath()%>/ajax/resStringListBody.json">
		JSON List(문자열) 응답 </a> 
	<br />
--%>
	<a href="<%=request.getContextPath()%>/ajax/resVOListBody.json"> JSON List(VO) 응답 </a>
	<br />
	<a href="<%=request.getContextPath()%>/test"> log4j2 Test?? </a>
	<br/>
	<a href="<%=request.getContextPath()%>/api"> log4j2(1) </a>
	<br/>
	<a href="<%=request.getContextPath()%>/apitest"> log4j2 (2) </a>
	<br />
	<a href="<%=request.getContextPath()%>/bank/"> Sample Main page </a>
	<br />
	
</body>
</html>