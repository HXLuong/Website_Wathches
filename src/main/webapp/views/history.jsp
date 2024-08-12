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
</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<%@include file="/views/include/nav.jsp"%>
	<h1 class="btn_drop d-flex justify-content-center my-4 fw-bold">Lịch sử mua hàng</h1>
	<div class="col-lg-12 col-12">
		<div class="table-responsive"
			style="max-height: 600px; overflow: auto">
			<table class="table table-bordered text-center mt-4">
				<thead>
					<tr>
						<th>ID</th>
						<th>Address</th>
						<th>Username</th>
						<th>Create Date</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${orders}">
						<tr>
							<td>${o.id}</td>
							<td>${o.address}</td>
							<td>${o.account.username}</td>
							<td><fmt:formatDate pattern="dd/MM/yyyy"
									value="${o.createDate}" /></td>
							<td><a href="/history_detail/${o.id}"
								class="text-info me-2">Xem chi tiết</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%@include file="/views/include/footer.jsp"%>
</body>
</html>