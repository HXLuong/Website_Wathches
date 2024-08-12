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
					<div class="col-sm-8 co-lg-8 p-0">
						<div
							class="d-lg-flex align-items-center justify-content-center d-sm-block d-none">
							<div>
								<input class="rounded-start lh-lg border-white p-2"
									type="search"
									placeholder="<s:message
											code="header.search" />..."
									style="outline: none; width: 340px; height: 40px" />
							</div>
							<a href="#"
								class="btn_Search text-white d-flex align-items-center rounded-end">
								<i class=" bi bi-search m-4"></i>
							</a>
						</div>
					</div>
					<div class="col-sm-2 co-lg-2 p-0 d-flex gap-4 justify-content-end">
						<div class="dropdown d-sm-block d-none">
							<c:choose>
								<c:when test="${empty user}">
									<a href="#"
										class="d-flex align-items-center text-decoration-none dropdown-center"
										data-bs-toggle="dropdown"> <i
										class="bi bi-person-circle text-white fs-2 header_icon"></i>
									</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="/login"><s:message
													code="header.login" /></a></li>
										<li><a class="dropdown-item" href="/signup"><s:message
													code="header.signup" /></a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<a href="#"
										class="d-flex align-items-center text-decoration-none dropdown-center"
										data-bs-toggle="dropdown"> <i
										class="bi bi-person-circle text-white fs-2 header_icon"></i>
									</a>
									<ul class="dropdown-menu">
										<li><span class="dropdown-item"><s:message
													code="header.hello" />! ${user.fullname}</span></li>
										<li><a class="dropdown-item" href="/history"><s:message
													code="header.history" /></a></li>
										<li><a class="dropdown-item" href="/logout"><s:message
													code="header.logout" /></a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="dropdown d-sm-block d-none">
							<a href="#"
								class="d-flex align-items-center text-decoration-none dropdown-center"
								data-bs-toggle="dropdown"> <i
								class="bi bi-translate text-white fs-2 header_icon"></i>
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="?lang=vi"><s:message
											code="header.vietnamese" /></a></li>
								<li><a class="dropdown-item" href="?lang=en"><s:message
											code="header.english" /></a></li>
							</ul>
						</div>
						<a href="/cart/view"
							class="d-flex align-items-center text-decoration-none dropdown-center position-relative me-lg-0 me-3">
							<i class="bi bi-cart-fill text-white fs-2 header_icon fs"></i> <span
							class="position-absolute start-100 translate-middle badge rounded-pill cart_info"
							style="top: 8px;">${Count}</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
<script>
	$(document).ready(function() {
		$("a[href*=lang]").on("click", function() {
			var param = $(this).attr("href");
			$.ajax({
				url : "/index" + param,
				success : function() {
					location.reload();
				}
			});
			return false;
		})
	})
</script>
</html>