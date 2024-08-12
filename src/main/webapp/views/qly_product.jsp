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
	<%@include file="/views/include/admin_nav.jsp"%>

	<div class="col-lg-10 col-10">
		<div>
			<c:if test="${not empty success_product}">
				<h5
					class="text-success d-flex justify-content-center w-50 offset-sm-3 mt-4">${success_product}</h5>
			</c:if>

		</div>
		<form:form action="/admin/product/create" modelAttribute="product"
			method="post" class="w-50 offset-sm-3">

			<form:input path="id" type="hidden" class="form-control" />

			<div class="form-outline my-4">
				<label class="form-label" for="form2Example1">Name:</label>
				<form:input path="name" type="text" class="form-control" />
				<form:errors path="name" class="form-text text-danger" />
				<c:if test="${not empty error_product}">
					<div class="form-text text-danger">${error_product}</div>
				</c:if>
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example1">Image:</label>
				<form:input path="image" type="file" class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example1">Price:</label>
				<form:input path="price" type="number" class="form-control" />
				<form:errors path="price" class="form-text text-danger" />
			</div>

			<div class="form-outline mb-4 d-flex align-items-center gap-2">
				<label class="form-label" for="form2Example1">Available:</label>
				<form:radiobuttons path="available" items="${availabled}"
					class="form-check-input me-2" />
				<form:errors path="available" class="form-text text-danger" />
			</div>

			<div class="form-outline mb-4 d-flex align-items-center gap-2">
				<label class="form-label" for="form2Example1">Category:</label>
				<form:select path="cte" class="form-control">
					<c:forEach var="c" items="${categories}">
						<option value="${c.id}">${c.name}</option>
					</c:forEach>
				</form:select>
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center mb-4">
				<button formaction="/admin/product/create"
					class="btn btn-outline-success me-2">Create</button>
				<button formaction="/admin/product/update"
					class="btn btn-outline-warning me-2">Update</button>
				<button formaction="/admin/product/delete"
					class="btn btn-outline-danger me-2">Delete</button>
				<button formaction="/admin/product" class="btn btn-outline-info">Reset</button>
			</div>
		</form:form>

		<form action="/admin/product/search"
			class="w-50 offset-sm-3">
			<div class="form-outline mb-3 mt-5 d-flex">
				<input name="keywords" value="${keywords}" class="form-control"
					placeholder="Tìm kiếm theo Mã hoặc Tên sản phẩm" />
				<button type="submit" class="btn btn-outline-danger ms-2">Tìm</button>
			</div>
		</form>

		<div class="table-responsive"
			style="max-height: 625px; overflow: auto">
			<table class="table table-bordered text-center">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Image</th>
						<th>Price</th>
						<th>Create Date</th>
						<th>Available</th>
						<th>Category</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${products}">
						<tr>
							<td>${p.id}</td>
							<td>${p.name}</td>
							<td><img src="/views/images/${p.image}" width="100px"></td>
							<td><fmt:formatNumber value="${p.price}" />đ</td>
							<td><fmt:formatDate pattern="dd/MM/yyyy"
									value="${p.createDate}" /></td>
							<td>${p.available ? 'Available' : 'No Available'}</td>
							<td>${p.category.name}</td>
							<td><a href="/admin/product/edit?id=${p.id}"
								class="text-warning me-2">edit</a> <a
								href="/admin/product/delete?id=${p.id}" class="text-danger">delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>