<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<title>Giỏ hàng</title>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>

	<h3 class="fs-3 text-center text_color fw-bold my-4">Giỏ hàng</h3>
	<c:if test="${not empty message}">
		<h5
			class="text-success d-flex justify-content-center w-50 offset-sm-3 mt-4">${message}</h5>
	</c:if>
	<div class="row">
		<div class="form-group col-lg-9 col-9">
			<table class="table">
				<tbody class="text-center align-middle fw-bold">
					<tr class="m-0">
						<td class="p-0"></td>
						<td class="p-0"></td>
						<td class="p-0"></td>
						<td class="p-0"></td>
					</tr>
					<tr>
						<th class="w-50">Tên Sản Phẩm</th>
						<th>Số Lượng</th>
						<th>Giá</th>
						<th></th>
					</tr>
					<c:forEach var="item" items="${cart.items}">
						<form action="/cart/update/${item.id}" method="post">
							<input type="hidden" name="id" value="${item.id}">
							<tr>
								<td>
									<div class="d-flex align-items-center justify-content-between">
										<p class="ms-5">${item.name}</p>
										<a href="/views/images/${item.image}" class="me-5"> <img
											src="/views/images/${item.image}" alt=""
											style="max-width: 250px; height: 250px; object-fit: cover;">
										</a>
									</div>
								</td>
								<td>
									<div class="d-flex justify-content-center">
										<a class="border text-dark text-decoration-none px-2"
											href="/cart/update/${item.id}/dis">-</a> <input name="qty"
											value="${item.qty}" class="border text-center" type="number">
										<a class="border text-dark text-decoration-none px-2"
											href="/cart/update/${item.id}/plus">+</a>
									</div>
								</td>
								<td><span><fmt:formatNumber
											value="${item.price * item.qty}" /></span>đ</td>
								<td>
									<div>
										<a
											class="text-decoration-none text-dark d-flex gap-1 justify-content-center remove"
											href="/cart/remove/${item.id}"> <i class="bi bi-trash3"></i>
											<span>Xóa</span>
										</a>
									</div>
								</td>
							</tr>
						</form>
					</c:forEach>
					<!-- <td class="text_color fs-3 p-5" colspan="4">Giỏ hàng trống <i class="bi bi-bag-x-fill"></i></td> -->

				</tbody>
			</table>
		</div>
		<div class="col-lg-3 col-3">
			<div class="border-top border-bottom p-4">
				<div class="flex-column">
					<div class="d-flex justify-content-between">
						<h5 class="fs-6 fw-bold text_color">Tổng giá:</h5>
						<h5 class="fs-6 fw-bold text_color">
							<fmt:formatNumber value="${Amount}" />
							</span>đ
						</h5>
					</div>
					<div class="d-flex justify-content-between">
						<h5 class="fs-6 fw-bold text_color">Tổng số lượng:</h5>
						<h5 class="fs-6 fw-bold text_color">${Count}</h5>
					</div>
				</div>
				<form action="/checkout" method="post"
					class="d-flex gap-2 align-items-center">
					<div>
						<input name="address" type="text" class="form-control"
							placeholder="Nhập địa chỉ" style="width: 195px" />
					</div>
					<div>
						<button type="submit"
							class="btn text-white text-decoration-none p-2 rounded checkout">Thanh
							Toán</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="/views/include/footer.jsp"%>
</body>
<script>
	document.getElementsByClassName('checkout')[0].addEventListener('click',
			buyButtonClicked);
	function buyButtonClicked() {
		alert("Đã mua hàng thành công! Vui lòng kiểm tra email để xác nhận đơn hàng!");
	}
</script>
</html>