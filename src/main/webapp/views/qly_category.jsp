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
			<c:if test="${not empty success_category}">
				<h5
					class="text-success d-flex justify-content-center w-50 offset-sm-3 mt-4">${success_category}</h5>
			</c:if>

		</div>
		<form:form action="/admin/category/create"
			modelAttribute="categoryItem" method="post" class="w-50 offset-sm-3">

			<div class="form-outline my-4">
				<label class="form-label" for="form2Example1">Category ID:</label>
				<form:input path="id" type="text" class="form-control" />
				<form:errors path="id" class="form-text text-danger" />
				<c:if test="${not empty error_category}">
					<div class="form-text text-danger">${error_category}</div>
				</c:if>
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example1">Category Name:</label>
				<form:input path="name" type="text" class="form-control" />
				<form:errors path="name" class="form-text text-danger" />
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center mb-4">
				<button formaction="/admin/category/create"
					class="btn btn-outline-success me-2">Create</button>
				<button formaction="/admin/category/update"
					class="btn btn-outline-warning me-2">Update</button>
				<button formaction="/admin/category/delete"
					class="btn btn-outline-danger me-2">Delete</button>
				<button formaction="/admin/category" class="btn btn-outline-info">Reset</button>
			</div>
		</form:form>

		<div class="table-responsive"
			style="max-height: 600px; overflow: auto">
			<table class="table table-bordered text-center">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ca" items="${categoryItems}">
						<tr>
							<td>${ca.id}</td>
							<td>${ca.name}</td>
							<td><a href="/admin/category/edit?id=${ca.id}"
								class="text-warning me-2">edit</a> <a
								href="/admin/category/delete?id=${ca.id}" class="text-danger">delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>