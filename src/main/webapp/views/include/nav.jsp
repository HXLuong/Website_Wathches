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
<nav class="navbar navbar-expand-lg p-3 d-flex justify-content-center">
		<div class="container-fluid">
			<div class="d-flex justify-content-between align-items-center">
				<button class="navbar-toggler btn_drop border " type=" button"
					data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
					aria-controls="navbarTogglerDemo03" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="bi bi-list btn_drop" style="font-size: 35px;"></i>
				</button>
				<div class="d-flex d-lg-none d-block ms-4">
					<div>
						<input class="rounded-start lh-lg border-white p-2" type="search"
							placeholder="<s:message
											code="header.search" />..."
							style="outline: none; width: 200px; height: 40px" />
					</div>
					<a href="#"
						class="btn_Search text-white d-flex align-items-center rounded-end">
						<i class=" bi bi-search my-4 mx-3"></i>
					</a>
				</div>
			</div>
			<div class="collapse navbar-collapse w-100" id="navbarTogglerDemo03">
				<ul
					class="navbar-nav me-auto mb-2 mb-lg-0 d-flex gap-5 justify-content-center w-100">
					<li class="nav-item mt-3 mt-lg-0 "><a href="/index"
						class="text-white text-decoration-none fw-medium pb-1 nav_btn"><s:message
											code="nav.home" /></a></li>
					<li class="nav-item"><a href="#"
						class="text-white text-decoration-none fw-medium pb-1 nav_btn"><s:message
											code="nav.about" /></a></li>
					<li class="nav-item"><a href="/category/CT01"
						class="text-white text-decoration-none fw-medium pb-1 nav_btn"><s:message
											code="nav.malewatch" /></a></li>
					<li class="nav-item"><a href="/category/CT02"
						class="text-white text-decoration-none fw-medium pb-1 nav_btn"><s:message
											code="nav.femalewatch" /></a></li>
					<li class="nav-item"><a href="#"
						class="text-white text-decoration-none fw-medium pb-1 nav_btn">BLOGS</a>
					</li>
					<li class="nav-item"><a href="#"
						class="text-white text-decoration-none fw-medium pb-1 nav_btn"><s:message
											code="nav.contact" /></a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>