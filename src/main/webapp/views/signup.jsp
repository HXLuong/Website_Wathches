<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Insert title here</title>
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
					<div class="col-sm-10 co-lg-10 p-0 d-flex justify-content-end">
						<h1 class="fw-bold text-white">Đăng Ký</h1>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div
		style="background-image: url(/views/images/slider1.jpg); height: 710px;">
		<div class="d-flex p-5 w-50 justify-content-end">
			<div class="border rounded shadow" style="width: 400px">
				<div
					class="d-flex align-items-center justify-content-center text-secondary"
					style="height: 80px;">
					<h5>Đăng Ký</h5>
				</div>
				<c:if test="${not empty error}">
					<h5 class="text-danger d-flex justify-content-center">${error}</h5>
				</c:if>
				<div class="pt-0 pb-3 px-3">
					<form:form action="/signup" modelAttribute="account" method="post">
						<div class="input-group">
							<span class="input-group-text"><i
								class="bi bi-person-fill"></i></span>
							<form:input path="fullname" type="text" class="form-control"
								placeholder="Họ và tên" />
						</div>
						<form:errors path="fullname" class="form-text text-danger" />
						<div class="input-group mt-3 position-relative">
							<span class="input-group-text"><i
								class="bi bi-envelope-fill"></i></span>
							<form:input path="email" type="email" class="form-control"
								placeholder="Email" />
						</div>
						<form:errors path="email" class="form-text text-danger" />
						<div class="input-group mt-3 position-relative">
							<span class="input-group-text"><i
								class="bi bi-person-fill"></i></span>
							<form:input path="username" type="text" class="form-control"
								placeholder="Tên đăng nhập" />
						</div>
						<form:errors path="username" class="form-text text-danger" />
						<div class="input-group mt-3 position-relative">
							<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
							<form:input path="password" type="password" class="form-control"
								placeholder="Mật khẩu" />
						</div>
						<form:errors path="password" class="form-text text-danger" />
						<div class="input-group mt-3 position-relative">
							<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
							<input name="Valpassword" type="password"
								class="form-control" placeholder="Xác nhận mật khẩu" />
						</div>
						<c:if test="${not empty error_password}">
							<h5 class="text-danger fs-6">${error_password}</h5>
						</c:if>
						<div class="form-group my-3">
							<button type="submit"
								class="form-control btn checkout text-white">Đăng Ký</button>
						</div>
					</form:form>
					<p class="w-100 text-center text-secondary mb-3">-- Hoặc Đăng
						Ký Với --</p>
					<div class="w-100 d-flex text-center">
						<a
							class="w-50 d-flex text-decoration-none py-2 btn btn-outline-primary justify-content-center me-2 "
							href=""> <i class="bi bi-facebook me-1"></i>
							<p class="text-white m-0">Facebook</p>
						</a> <a
							class="w-50 d-flex text-decoration-none py-2 btn btn-outline-warning justify-content-center"
							href=""> <i class="bi bi-google text-warning me-1"></i>
							<p class="text-white m-0">Google</p>
						</a>
					</div>
				</div>
				<div class="d-flex align-items-center justify-content-center"
					style="height: 80px;">
					<div class="d-flex text-center">
						<p class="text-secondary me-2">Bạn đã có tài khoản?</p>
						<a class="text-decoration-none text_price" href="/login">Đăng
							Nhập</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/views/include/footer.jsp"%>
</body>
</html>