<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<footer class="bg-secondary pt-4">
	<div class="container">
		<div class="row py-4">

			<div class="col-lg-3 col-12 align-left">
				<a class="navbar-brand" href="${path}/ob/"> 
					<i class='bx bx-money bx-sm text-light'></i> 
					<span class="text-light h5">Open</span>
					<span class="text-light h5 semi-bold-600">bank</span>
				</a>
				<p class="text-light my-lg-4 my-2">
					Live as if you were to die tomorrow. Learn as if you were to live forever.
				</p>
				<ul class="list-inline footer-icons light-300">
					<li class="list-inline-item m-0">
						<a class="text-light" target="_blank" href="https://github.com/2303110264/OpenBank">
							<i class='bx bxl-github bx-md'></i>
						</a>
					</li>
				<!-- 
					<li class="list-inline-item m-0">
						<a class="text-light" target="_blank" href="http://facebook.com/">
							<i class='bx bxl-facebook-square bx-md'></i>
						</a>
					</li>
					<li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="https://www.linkedin.com/">
                            <i class='bx bxl-linkedin-square bx-md'></i>
                        </a>
                    </li>
                    <li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="https://www.whatsapp.com/">
                            <i class='bx bxl-whatsapp-square bx-md'></i>
                        </a>
                    </li>
                    <li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="https://www.flickr.com/">
                            <i class='bx bxl-flickr-square bx-md'></i>
                        </a>
                    </li>
                    <li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="https://www.medium.com/">
                            <i class='bx bxl-medium-square bx-md' ></i>
                        </a>
                    </li>
				 -->
				</ul>
			</div>

			<div class="col-lg-3 col-md-4 my-sm-0 mt-4">
				<h3 class="h4 pb-lg-3 text-light light-300">
				<c:choose>
					<c:when test="${userVO.customerType==1}">
						Test pages for Manager
					</c:when>
                    <c:otherwise>
                    	Menu
                    </c:otherwise>
                </c:choose>
					</h3>
					<ul class="list-unstyled text-light light-300">
                        <li class="pb-2">
                            <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light" href="${path}/ob/">Home</a>
                        </li>
                        <li class="pb-2">
                            <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="${path}/ob/account/">계좌목록</a>
                        </li>
                        <li class="pb-2">
                            <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="${path}/ob/transaction/transfer">이체</a>
                        </li>
                        <li class="pb-2">
                            <i class='bx-fw bx bxs-chevron-right bx-xs'></i></i><a class="text-decoration-none text-light py-1" href="${path}/ob/product/view">상품가입</a>
                        </li>
                        <li class="pb-2">
                            <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="${path}/ob/contact">고객센터(Contact)</a>
                        </li>
                    </ul>
			</div>
			
			<div class="col-lg-3 col-md-4 my-sm-0 mt-4">
			<!-- 
				<h2 class="h4 pb-lg-3 text-light light-300">Our Works</h2>
				<ul class="list-unstyled text-light light-300">
					<li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="#">Branding</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="#">Business</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="#">Marketing</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="#">Social Media</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="#">Digital Solution</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1" href="#">Graphic</a>
                    </li>
				</ul>
 			-->
			</div>

			<div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                <h2 class="h4 pb-lg-3 text-light light-300">For Client</h2>
                <ul class="list-unstyled text-light light-300">
	                <li class="pb-2">
                        <a class="text-decoration-none text-light py-1"><b>CEO </b>채이준</a>
                        <br/>
                        <i class='bx-fw bx bx-phone bx-xs'></i>
                        <a class="text-decoration-none text-light py-1" href="tel:010-020-0340">010-1111-1111</a>
                        <br/>
                        <i class='bx-fw bx bx-mail-send bx-xs'></i>
                        <a class="text-decoration-none text-light py-1" href="mailto:info@company.com">2303110262@office.kopo.ac.kr</a>
                    </li>
	                <li class="pb-2">
                        <a class="text-decoration-none text-light py-1"><b>COO </b>하다현</a>
                        <br/>
                        <i class='bx-fw bx bx-phone bx-xs'></i>
                        <a class="text-decoration-none text-light py-1" href="tel:010-020-0340">010-1111-1111</a>
						<br/>	
                        <i class='bx-fw bx bx-mail-send bx-xs'></i>
                        <a class="text-decoration-none text-light py-1" href="mailto:info@company.com">2303110264@office.kopo.ac.kr</a>
                    </li>
                </ul>
            </div>

		</div>
	</div>

	<div class="w-100 bg-primary py-3-2">
		<div class="container">
			<div class="row pt-2">
				<div class="col-lg-6 col-sm-12">
					<p class="text-lg-start text-center text-light light-300">
					Back: ©Copyright 2024 Open Banking Project Team. All Rights Reserved.
					<br><small>Front: ©Copyright 2021 Purple Buzz Company. All Rights Reserved.</small>
					</p>
				</div>
				<div class="col-lg-6 col-sm-12">
					<p class="text-lg-end text-center text-light light-300">
						Designed by <a rel="sponsored"
							class="text-decoration-none text-light"
							href="https://templatemo.com/" target="_blank"><strong>TemplateMo</strong></a>
					</p>
				</div>
			</div>
		</div>
	</div>

</footer>