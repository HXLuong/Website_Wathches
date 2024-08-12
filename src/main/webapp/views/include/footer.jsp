<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/views/css/style.css">
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
</head>
<body>
	<div class="container mt-4">
		<div
			class="row border-top py-5 d-flex align-items-center justify-content-between">
			<div class="col-lg-6 col-12">
				<h3 class="fw-bold ">
					<s:message code="footer.sigupInfo" />
				</h3>
			</div>
			<div class="d-flex justify-content-end col-lg-6 col-12">
				<div>
					<input class="p-2" type="email" placeholder="Email..."
						style="outline: none; width: 270px; height: 40px" />
				</div>
				<a href="#"
					class="btn_Search text-white text-decoration-none px-3  d-flex align-items-center rounded-end">
					<s:message code="footer.signup" />
				</a>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<div class="row d-flex justify-content-between pt-3 pb-5">
					<div class="col-lg-3 col-md-6">
						<h3 class="fs-5 fw-bolder text-white lh-base">HXLuong Watches</h3>
						<p class="lh-base text-white opacity-50 fs-6">
							<s:message code="footer.text" />
						</p>
						<div class="p-4 rounded" style="background-color: #ffffff0f;">
							<h5 class="text_price fw-bold">
								<s:message code="footer.interact" />
							</h5>
							<div class="d-flex align-items-center mt-2">
								<i class="bi bi-telephone-outbound-fill fs-4 text_price"></i>
								<h4 class="fs-4 text-white fw-bold ps-3">0123 456 789</h4>
							</div>
							<div class="d-flex align-items-center mt-2">
								<i class="bi bi-phone-vibrate-fill fs-4 text_price"></i>
								<h4 class="fs-4 text-white fw-bold ps-3">0123 456 789</h4>
							</div>
						</div>
					</div>

					<div class="col-lg-2 col-md-6">
						<h3 class="fs-5 fw-bolder text-white lh-base">
							<s:message code="footer.link" />
						</h3>
						<ul class="p-0 useful__hover">
							<li class="py-1 px-0" style="list-style: none;"><a
								class="fs-6 text-decoration-none text-white footer_nav" href="#"><s:message
										code="nav.home" /></a></li>
							<li class="py-1 px-0" style="list-style: none;"><a
								class="fs-6 text-decoration-none text-white footer_nav" href="#"><s:message
										code="nav.malewatch" /></a></li>
							<li class="py-1 px-0" style="list-style: none;"><a
								class="fs-6 text-decoration-none text-white footer_nav" href="#"><s:message
										code="nav.femalewatch" /></a></li>
							<li class="py-1 px-0" style="list-style: none;"><a
								class="fs-6 text-decoration-none text-white footer_nav" href="#">Blogs</a>
							</li>
							<li class="py-1 px-0" style="list-style: none;"><a
								class="fs-6 text-decoration-none text-white footer_nav" href="#"><s:message
										code="nav.contact" /></a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6">
						<h3 class="fs-5 fw-bolder text-white lh-base">
							<s:message code="footer.info" />
						</h3>
						<div class="mb-2">
							<i class="bi bi-geo-alt-fill text_price fs-6 me-1"></i>
							<h4 class="fs-6 fw-bold text-white d-inline">
								<s:message code="footer.location" />
							</h4>
							<p class="lh-base text-white opacity-50 fs-6">
								<s:message code="footer.college" />
							</p>
						</div>
						<div>
							<i class="bi bi-envelope-fill text_price fs-6 me-1"></i>
							<h4 class="fs-6 fw-bold text-white d-inline">E-mail</h4>
							<p class="lh-base text-white opacity-50 fs-6">
								HXLuongfpoly@fpt.edu.vn</p>
						</div>

						<ul class="icon__hover d-flex gap-2 p-0">
							<li class="bg-primary rounded text-center lh-base"
								style="width: 33px; height: 33px; list-style: none;"><a
								class="d-block text-white mt-1" href=""><i
									class="bi bi-facebook"></i></a></li>
							<li class="bg-info rounded text-center lh-base"
								style="width: 33px; height: 33px; list-style: none;"><a
								class="d-block text-white mt-1" href=""><i
									class="bi bi-twitter"></i></a></li>
							<li class="bg-danger rounded text-center lh-base"
								style="width: 33px; height: 33px; list-style: none;"><a
								class="d-block text-white mt-1" href=""><i
									class="bi bi-youtube"></i></a></li>
							<li class="bg-warning rounded text-center lh-base"
								style="width: 33px; height: 33px; list-style: none;"><a
								class="d-block text-white mt-1" href=""><i
									class="bi bi-instagram"></i></a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6">
						<h3 class="fs-5 fw-bolder text-white lh-base">
							<s:message code="footer.post" />
						</h3>
						<div class="d-flex gap-2 border-bottom pb-4">
							<img class="object-fit-cover d-block rounded"
								src="/views/images/product-02.png" alt="" width="70px"
								height="70px">
							<div>
								<div class="d-flex gap-2">
									<i class="bi bi-calendar-check-fill fs-6 text_price"></i>
									<p class="text-white opacity-50 fs-6 m-0">
										<s:message code="footer.day" />
									</p>
								</div>
								<h4 class="fs-6 fw-bolder text-white lh-base">Blog 1</h4>
							</div>
						</div>
						<div class="d-flex gap-2 pt-3">
							<img class="object-fit-cover d-block rounded"
								src="/views/images/2.jpg" alt="" width="70px" height="70px">
							<div>
								<div class="d-flex gap-2">
									<i class="bi bi-calendar-check-fill fs-6 text_price"></i>
									<p class="text-white opacity-50 fs-6 m-0">
										<s:message code="footer.day" />
									</p>
								</div>
								<h4 class="fs-6 fw-bolder text-white lh-base">Blog 2</h4>
							</div>
						</div>
					</div>
				</div>

				<div class="d-flex justify-content-between py-2 px-0 border-top">
					<p class="text-white opacity-50 fs-6 m-0">Copyright © 2024
						HXLuong</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>