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
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
<!-- Nhúng boostrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<!-- Nhúng angularjs min và route -->
<link href="https://fonts.googleapis.com/css?family=Satisfy"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<!-- Nhung owlcarousel -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
	integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>${items.name}</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<link rel="stylesheet" href="/views/css/style.css">
<style>
@media only screen and (max-width: 768px) {
	.owl-carousel {
		margin-left: 4px !important;
	}
	.anhcarousel {
		width: 100% !important;
	}
}

.owl-carousel {
	margin-left: 10px !important;
}

.anhcarousel {
	width: 75% !important;
}

.owl-prev {
	width: 40px;
	height: 40px;
	position: absolute;
	top: 50%;
	margin-left: -40px;
	display: block !important;
	border: 0px solid black;
}

.owl-next {
	width: 40px;
	height: 40px;
	position: absolute;
	top: 50%;
	right: -1px;
	display: block !important;
	border: 0px solid black;
}

.owl-theme .owl-nav:hover [class*=owl-] {
	border-radius: 50px;
	background-color: #C89979;
	color: white;
}

@media only screen and (max-width: 768px) {
	.owl-prev {
		width: 40px;
		height: 40px;
		position: absolute;
		top: 40%;
		margin-left: -40px;
		display: block !important;
		border: 0px solid black;
	}
	.owl-next {
		width: 40px;
		height: 40px;
		position: absolute;
		top: 40%;
		right: 5px;
		display: block !important;
		border: 0px solid black;
	}
}
</style>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<%@include file="/views/include/nav.jsp"%>

	<div class="container">
		<div class="row my-4">
			<div class="col-sm-6 mt-3">
				<a href="/views/images/${items.image}"><img
					src="/views/images/${items.image}" alt="" width="95%"
					class="img-thumbnail"></a>
			</div>
			<div class="col-sm-6 mt-3 ps-0">
				<h3 class="fs-3 fw-bold">${items.name}</h3>
				<div>
					<h4 class="btn_drop mt-3 fw-bold">
						<span class="fw-bold text_price"><fmt:formatNumber
								value="${items.price}" />đ</span>
					</h4>
				</div>
				<ul class="ps-3 py-3">
					<li>Sản phẩm nhập khẩu chính hãng.</li>
					<li>Vận chuyển miễn phí toàn quốc.</li>
					<li>Giao hàng trong ngày.</li>
					<li>Thanh toán sau khi nhận hàng.</li>
					<li>Bảo hành 5 năm tại Công ty.</li>
					<li>Bảo hành chính hãng toàn cầu.</li>
				</ul>
				<input type="hidden" value="${items.id}" /> <input type="hidden"
					id="qty" value="${items.qty}" />
				<div class="d-flex align-items-center mt-3">
					<a class="border text-dark text-decoration-none px-2"
						href="/cart/update/${items.id}/dis">-</a> <input name="qty"
						value="${items.qty}" class="border text-center" type="number">
					<a class="border text-dark text-decoration-none px-2"
						href="/cart/update/${items.id}/plus">+</a>
				</div>
				<div class="mt-4">
					<a href="/cart/add/${items.id}"
						class="add_cart text-white btn py-1 me-1" style="width: 250px;">
						<i class="bi bi-cart-plus"></i> <br>
						<p class="fs-6 fw-bold m-0">Thêm vào giỏ</p>
					</a>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="position-relative mb-2">
				<h2 class="pb-2 border-bottom">
					<a href="#"
						class="text-white cart_info rounded-top p-2 d-inline fw-bold fs-4 text-decoration-none">Sản
						Phẩm Liên Quan</a>
				</h2>
			</div>
			<div class="owl-carousel owl-theme">
				<c:forEach var="p" items="${cte}">
					<div class="item">
						<div class="border">
							<div class="border">
								<div class="p-2">
									<a href="/detail/${p.id}/${p.category.id}"><img
										src="/views/images/${p.image}" width="100%" height="100%"
										alt=""></a>
								</div>
								<div
									class="text-truncate border-top flex-column text-center pt-3 pb-5 ">
									<a class="text-black text-decoration-none fw-bold px-2"
										href="/detail/${p.id}/${p.category.id}"> ${p.name} </a>
									<div class="lh-lg pb-3">
										<span class="fw-bold text_price"><fmt:formatNumber
												value="${p.price}" />đ</span>
									</div>
									<a class="text-white text-decoration-none p-2 add_cart"
										href="/cart/add/${p.id}">Thêm vào giỏ</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<%@include file="/views/include/footer.jsp"%>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
	integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script>
	var owl = $(".owl-carousel");
	owl.owlCarousel({
		items : 4,
		loop : true,
		margin : 10,
		autoplay : true,
		dots : false,
		nav : true,
		navText : [ '<i class="fa fa-angle-left" aria-hidden="true"></i>',
				'<i class="fa fa-angle-right" aria-hidden="true"></i>', ],
		autoplayTimeout : 3000,
		autoplayHoverPause : false,
		responsiveClass : true,
		responsive : {
			0 : {
				items : 2,
				nav : true,
			},
			400 : {
				items : 1,
				nav : false,
			},
			700 : {
				items : 2,
				nav : false,
			},
			1000 : {
				items : 4,
				nav : true,
				loop : true,
			},
		},
	});
</script>
</html>