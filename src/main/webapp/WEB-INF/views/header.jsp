<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<header>
	<nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-white shadow">
	        <div class="container d-flex justify-content-between align-items-center">
	            <a class="navbar-brand h1" href="/ob/">
	                <i class='bx bx-money bx-sm text-dark'></i>
	                <span class="text-dark h4">Open</span> <span class="text-primary h4">bank</span>
	            </a>
	            <button class="navbar-toggler border-0 " type="button" data-bs-toggle="collapse" data-bs-target="#navbar-toggler-success" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	
	            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="navbar-toggler-success">
	                <div class="flex-fill mx-xl-5 mb-2">
	                    <ul class="nav navbar-nav d-flex justify-content-between mx-xl-5 text-center text-dark">
		                    <c:choose>
		                    <%--
		                    product/admin/list
							--> product/list
							
							2. 상품 상세정보조회
							product/admin/detail/{productNum}
							--> product/list
							
							3. 상품 등록
							product/register
							--> product/register
							
							4. 상품 수정
							product/edit/{productNum}
							--> product/edit
							
							5. 상품 삭제
							product/delete/{productNum}
							
							6. 대쉬보드
							product/admin/dashboard
							—> product/dashboard
		                     --%>
		                    	<c:when test="${userVO.customerType==1}">
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/product/admin/dashboard">대시보드</a>
			                        </li>
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/product/admin/list">상품목록</a>
			                        </li>
			                        <%-- 
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/product/register">이체</a>
			                        </li>
			                         --%>
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/product/register">상품등록</a>
			                        </li>
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/contact">고객센터(Contact)</a>
			                        </li>
								</c:when>
			                    <c:otherwise>
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/">Home</a>
			                        </li>
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/account/">계좌목록</a>
			                        </li>
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/transaction/transfer">이체</a>
			                        </li>
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/product/view">상품가입</a>
			                        </li>
			                        <li class="nav-item">
			                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="${path}/ob/contact">고객센터(Contact)</a>
			                        </li>
			                    </c:otherwise>
		                    </c:choose>
	                    </ul>
	                </div>
	                <div class="navbar align-self-center d-flex">
	                <c:choose>
						<c:when test="${ not empty userVO }">
		                    <a class="nav-link" href="#"><i class='bx bx-bell bx-sm bx-tada-hover text-primary'></i></a>
		                    <!-- <a class="nav-link" href="#"><i class='bx bx-cog bx-sm text-primary'></i></a> -->
		                    <a class="nav-link" href="${path}/ob/member/profile"><i class='bx bx-user-check bx-sm text-primary'></i></a>
		                    <a class="nav-link" href="${path}/ob/member/logout"><i class='bx bx-door-open bx-sm text-primary'></i></a>
	               		</c:when>
	               		<c:otherwise>
		                    <a class="nav-link" href="${path}/ob/member/signIn">
		                    <i class='bx bx-key bx-sm text-primary'></i></a>
		                    <a class="nav-link" href="${path}/ob/member/signUp">
		                    <i class='bx bx-user-plus bx-sm text-primary'></i></a>
	               		</c:otherwise>
               		</c:choose> 
	                </div>
	            </div>
	        </div>
	 </nav>
</header>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>