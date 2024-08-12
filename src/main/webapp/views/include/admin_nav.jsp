<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
</head>
<body>
	<header class="py-0 py-lg-3">
		<div class="container">
			<div class="row">
				<div class="d-flex align-items-center justify-content-between py-2">
					<div class="col-sm-2 col-lg-2 p-0">
						<a href="/index" class="d-flex align-items-center overflow-hidden">
							<img src="/views/images/logo.png" width="180px" height="65px"
							alt="" />
						</a>
					</div>
					<div class="col-sm-9 co-lg-9 p-0 text-center">

						<c:choose>
							<c:when test="${empty field}">
								<h2 class="fs-1 fw-bold text-white">ADMINISTRATOR</h2>
							</c:when>
							<c:otherwise>
								<h2 class="fs-1 fw-bold text-white">${field}</h2>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-sm-1 co-lg-1 p-0 d-flex gap-4 justify-content-end">
						<div class="dropdown d-sm-block d-none">
							<c:choose>
								<c:when test="${empty user}">
									<a href="#"
										class="d-flex align-items-center text-decoration-none dropdown-center"
										data-bs-toggle="dropdown"> <i
										class="bi bi-person-circle text-white fs-2 header_icon"></i>
									</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="/login">Đăng Nhập</a></li>
										<li><a class="dropdown-item" href="/signup">Đăng Ký</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<a href="#"
										class="d-flex align-items-center text-decoration-none dropdown-center"
										data-bs-toggle="dropdown"> <i
										class="bi bi-person-circle text-white fs-2 header_icon"></i>
									</a>
									<ul class="dropdown-menu">
										<li><span class="dropdown-item">Xin chào!
												${user.fullname}</span></li>
										<li><a class="dropdown-item" href="/logout">Đăng Xuất</a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="row">
		<div class="col-lg-2 col-2 bg_blk border-top" style="height: 160vh">
			<div class="text-center">
				<h5 class="fs-6 text-white pt-3">Quản lý</h5>
			</div>
			<ul class="list-group list-group-flush px-2">
				<li class="list-group-item bg_blk border-bottom ps-1 mb-3"><a
					href="/admin/account?field=quản lý tài khoản"
					class="text-decoration-none text-white header_icon">Tài khoản</a></li>
				<li class="list-group-item bg_blk border-bottom ps-1 mb-3"><a
					href="/admin/category?field=quản lý danh mục sản phẩm"
					class="text-decoration-none text-white header_icon">Danh mục
						sản phẩm</a></li>
				<li class="list-group-item bg_blk border-bottom ps-1 mb-3"><a
					href="/admin/product?field=quản lý sản phẩm"
					class="text-decoration-none text-white header_icon">Sản phẩm</a></li>
				<li class="list-group-item bg_blk border-bottom ps-1 mb-3"><a
					href="/admin/order?field=hóa đơn"
					class="text-decoration-none text-white header_icon">Hóa đơn</a></li>
			</ul>
			<div class="text-center">
				<h5 class="fs-6 text-white pt-3">Thống kê</h5>
			</div>
			<ul class="list-group list-group-flush px-2">
				<li class="list-group-item bg_blk border-bottom ps-1 mb-3"><a
					href="/admin/inventory-by-category?field=thống kê danh mục sản phẩm"
					class="text-decoration-none text-white header_icon">Danh mục
						sản phẩm</a></li>
			</ul>
		</div>
</body>
</html>