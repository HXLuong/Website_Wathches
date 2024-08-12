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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<%@include file="/views/include/nav.jsp"%>

	<div class="container mt-4">
		<div class="row">
			<div class="col-lg-3 col-md-4 col-6 mb-4">
				<div class="border-top border-bottom py-4">
					<h3 class="fs-4">DANH MỤC SẢN PHẨM</h3>
					<ul class="list-group list-group-flush border rounded mt-3">
						<c:forEach var="c" items="${categories}">
							<li class="list-group-item mx-3"><a href="/category/${c.id}"
								class="text-decoration-none text-dark header_icon">${c.name}</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="py-4 border-bottom">
					<h3 class="fs-4">LỌC THEO GIÁ</h3>
					<form action="/category" class="text-center">
						<div class="d-flex align-items-center gap-2 mb-2">
							<label>Từ:</label> <input name="min" type="number"
								value="${param.min}" class="form-control ms-2">
						</div>
						<div class="d-flex align-items-center gap-2">
							<label>Đến:</label> <input name="max" type="number"
								value="${param.max}" class="form-control">
						</div>
						<button class="btn mt-2 border btn-outline-dark">Lọc</button>
					</form>
				</div>

				<div class="py-4 border-bottom">
					<form action="/category" method="post" class="text-center">
						<div class="d-flex align-items-center gap-2 pb-2">
							<div>
								<h3 class="fs-4">SẮP XẾP:</h3>
							</div>
							<div>
								<div class="dropdown d-sm-block d-none">
									<a href="#"
										class="d-flex align-items-center text-decoration-none dropdown-center"
										data-bs-toggle="dropdown">
										<span class="form-control" style="width: 150px">Sắp xếp theo giá</span>
									</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="/category/sortDESC">Từ cao đến thấp</a></li>
										<li><a class="dropdown-item" href="/category/sortASC">Từ thấp đến cao</a></li>
									</ul>
								</div>
							</div>

						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-9 col-md-12 col-12 mb-4">
				<div class="row">
					<c:forEach var="item" items="${items}">
						<div class="col-lg-4 col-md-4 col-6 mb-4">
							<div class="border">
								<div class="p-2">
									<a href="/detail/${item.id}"><img
										src="/views/images/${item.image}" width="100%" height="100%"
										alt=""></a>
								</div>
								<div
									class="text-truncate border-top flex-column text-center pt-3 pb-5 ">
									<a class="text-black text-decoration-none fw-bold px-2"
										href="/detail/${item.id}"> ${item.name} </a>
									<div class="lh-lg pb-3">
										<span class="fw-bold text_price"><fmt:formatNumber
												value="${item.price}" />đ</span>
									</div>
									<a class="text-white text-decoration-none p-2 add_cart"
										href="/cart/add/${item.id}">Thêm vào giỏ</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>

	<%@include file="/views/include/footer.jsp"%>
</body>
</html>