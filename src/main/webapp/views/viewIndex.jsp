<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- Nhung Jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Nhúng boostrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- Nhúng boostrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<!-- Nhúng script boostrap -->
<script
	src=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- Nhúng fontawesome -->
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<!-- Nhúng css  -->
<link rel="stylesheet" href="/views/css/style.css">
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Trang chủ</title>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<%@include file="/views/include/nav.jsp"%>

	<div class="banner_home">
		<div id="carouselExample" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="position-relative">
						<div class="text_box position-absolute">
							<h4 class="fs-4 fw-bold text-white m-0">HXLuong Watches</h4>
							<h1 class="text-white fw-bold lh-sm py-2"
								style="font-size: 3.5em;">
								<s:message code="home.title" />
							</h1>
							<p class="text-white lh-sm mb-4 pb-2">
								<s:message code="home.textbanner" />
							</p>
							<a
								class="text-white py-2 px-4 border rounded-1 text-decoration-none fw-bold"
								href=""><s:message code="home.txtSee" /></a>
						</div>
						<img src="/views/images/slide-bg-1.jpg" width="100%" height="100%"
							alt="">
					</div>
				</div>
				<div class="carousel-item">
					<div class="position-relative">
						<div class="text_box position-absolute">
							<h4 class="fs-4 fw-bold text-white m-0">HXLuong Watches</h4>
							<h1 class="text-white fw-bold lh-sm py-2"
								style="font-size: 3.5em;">
								<s:message code="home.title" />
							</h1>
							<p class="text-white lh-sm mb-4 pb-2">
								<s:message code="home.textbanner" />
							</p>
							<a
								class="text-white py-2 px-4 border rounded-1 text-decoration-none fw-bold"
								href=""><s:message code="home.txtSee" /></a>
						</div>
						<img src="/views/images/slide-bg-2.jpg" width="100%" height="100%"
							alt="">
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="container mt-4">
		<div class="d-lg-flex banner_row">
			<div class="banner_content overflow-hidden mx-lg-4">
				<a href="/category/CT01">
					<div class="position-relative">
						<div class="position-absolute text-white banner_text z-1 ">
							<h3 class="fs-4">
								<s:message code="home.trend" />
							</h3>
							<h2 class="fw-bold fs-1 lh-base">
								<s:message code="home.maleWatch" />
							</h2>
						</div>
					</div> <img src="/views/images/trend-1.jpg" class="object-fit-cover"
					width="600px" height="300px" alt="">
				</a>
			</div>
			<div class="banner_content overflow-hidden mx-lg-4">
				<a href="/category/CT02">
					<div class="position-relative">
						<div class="position-absolute text-white banner_text z-1 ">
							<h3 class="fs-4">
								<s:message code="home.trend" />
							</h3>
							<h2 class="fw-bold fs-1 lh-base">
								<s:message code="home.femaleWatch" />
							</h2>
						</div>
					</div> <img src="/views/images/trend-2.jpg" class="object-fit-cover"
					width="600px" height="300px" alt="">
				</a>
			</div>
		</div>
	</div>

	<div class="container mt-4">
		<div class="row">

			<c:forEach var="item" items="${items.content}">
				<div class="col-lg-3 col-md-4 col-6 mb-4">
					<div class="border">
						<div class="p-2">
							<a href="/detail/${item.id}/${item.category.id}"><img
								src="/views/images/${item.image}" width="100%" height="100%"
								alt=""></a>
						</div>
						<div
							class="text-truncate border-top flex-column text-center pt-3 pb-5 ">
							<a class="text-black text-decoration-none fw-bold px-2"
								href="/detail/${item.id}/${item.category.id}"> ${item.name}
							</a>
							<div class="lh-lg pb-3">
								<span class="fw-bold text_price"><fmt:formatNumber
										value="${item.price}" />đ</span>
							</div>
							<a class="text-white text-decoration-none p-2 add_cart"
								href="/cart/add/${item.id}"><s:message code="home.addCart" /></a>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>

	<div class="d-flex justify-content-center mb-4">
		<c:if test="${items.number == 0}">
			<a href="/index?item=0" class="btn btn-outline-dark me-2 disabled"><i
				class="bi bi-chevron-double-left"></i></a>
			<a href="/index?item=${items.number-1}"
				class="btn btn-outline-dark me-2 disabled"><i
				class="bi bi-chevron-left"></i></a>
		</c:if>

		<c:if test="${items.number != 0}">
			<a href="/index?item=0" class="btn btn-outline-dark me-2"><i
				class="bi bi-chevron-double-left"></i></a>
			<a href="/index?item=${items.number-1}"
				class="btn btn-outline-dark me-2"><i class="bi bi-chevron-left"></i></a>
		</c:if>

		<c:if test="${items.number == items.totalPages-1}">
			<a href="/index?item=${items.number+1}"
				class="btn btn-outline-dark me-2 disabled"><i
				class="bi bi-chevron-right"></i></a>
			<a href="/index?item=${items.totalPages-1}"
				class="btn btn-outline-dark disabled"><i
				class="bi bi-chevron-double-right"></i></a>
		</c:if>

		<c:if test="${items.number != items.totalPages-1}">
			<a href="/index?item=${items.number+1}"
				class="btn btn-outline-dark me-2"><i class="bi bi-chevron-right"></i></a>
			<a href="/index?item=${items.totalPages-1}"
				class="btn btn-outline-dark"><i
				class="bi bi-chevron-double-right"></i></a>
		</c:if>

	</div>

	<%@include file="/views/include/footer.jsp"%>

</body>
</html>