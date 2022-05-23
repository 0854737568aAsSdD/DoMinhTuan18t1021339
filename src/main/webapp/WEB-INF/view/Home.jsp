<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ</title>
<link rel="shortcut icon" href="hinh/python.jpg" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
body {
	background-image: linear-gradient(rgba(58, 57, 57, 0.45),
		rgba(58, 57, 57, 0.45)), url("hinh/RE4wB6h.jpg");
}

.container-fluid {
	padding: 0;
}

#nav1 {
	padding: 10px 0px;
	opacity: 0.9;
	z-index: 100;
}

#nav2 {
	opacity: 0.9;
	line-height: 70px;
	z-index: 1;
}

a, span {
	color: white;
}

#nav1 li {
	margin-right: 80px;
}

ul {
	list-style: none;
}

.listSP {
	padding-left: 0px;
	display: none;
	position: absolute;
}

#formtk {
	margin-bottom: 10px !important;
	width: 280px;
}

.listSP li {
	padding: 10px;
	width: 100%;
	border-bottom: 1.2px dotted black;
}

.listSP li a {
	color: black;
}

.listSP img {
	width: 40px;
	margin-right: 10px;
}

section {
	margin: 0 auto;
	opacity: 0.9;
}

.carousel-indicators li {
	width: 10px;
	height: 10px;
	border-radius: 100%;
	background-color: rgb(54, 53, 53);
}

#demo {
	margin-bottom: 50px;
	padding-left: 20%;
}

#demo img {
	width: 80%;
	height: 90%;
}

#footer {
	height: 80px;
	padding-left: 14%;
	opacity: 1;
}

footer img {
	height: 50px;
	border-radius: 50px;
	margin-left: 10px;
}
</style>
</head>

<body>
	<c:set var="language" value="${khachhang.getHoten()}" scope="session" />
	<div class="container-fluid">

		<nav class="navbar navbar-expand-sm bg-dark justify-content-center"
			id="nav1">
			<ul class="navbar-nav">
				<a class="navbar-brand" href="#"> <img src="hinh/htch_image.png"
					style="width: 40px;">
				</a>
				<li class="nav-item"><span>Hệ thống:</span><br> <span>Cửa
						hàng bán lẻ</span></li>
				<a class="navbar-brand" href="#"> <img
					src="hinh/phonehead_image.png" style="width: 40px;">
				</a>
				<li class="nav-item"><span>Hotline mua hàng:</span><br> <span>Gọi
						ngay: 1900100</span></li>
				<a class="navbar-brand" href="#"> <img src="hinh/user_image.png"
					style="width: 40px;">
				</a>
				<c:if test="${empty khachhang}">
					<li class="nav-item"><span><a href="Login">Đăng
								nhập</a></span></li>
				</c:if>
				<ul>
					<c:if test="${not empty khachhang}">
						<ul>
							<li class="nav-item" style="color: yellow;">Hello,
								${language }</li>
							<li class="nav-item"><span><a href="DangXuat">Đăng
										Xuất</a></span></li>
						</ul>
>
				</c:if>
				</ul>
			</ul>
		</nav>

		<nav class="navbar bg-dark justify-content-center" id="nav2">
			<ul class="nav ">
				<li class="nav-item"><a class="nav-link" href="Home">TRANG
						CHỦ</a></li>
				<li class="nav-item"><a class="nav-link" href="About">GIỚI
						THIỆU</a></li>
				<li class="nav-item"><a class="nav-link" href="phone">SẢN
						PHẨM</a></li>
				<li class="nav-item"><a class="nav-link" href="ShowGioHang">GIỎ HÀNG</a></li>

				<li class="nav-item"><a class="nav-link" href="PhanHoi">PHẢN
						HỒI</a></li>
				<li class="nav-item"><a class="nav-link" href="tinnhan">TIN
						NHẮN </a></li>
				<li class="nav-item"><a class="nav-link"
					href="LichSuController">LỊCH SỬ MUA</a></li>
				<li class="nav-item"><a class="nav-link" href="Admin">ADMIN</a></li>
			</ul>
		</nav>

		<section>
			<div id="demo" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></a></li>
					<li data-target=" #demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
					<li data-target="#demo" data-slide-to="3"></li>
					<li data-target="#demo" data-slide-to="4"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="phone"><img
							src="hinh/samsung-a31-ft-spec-720x333-4.jpg"></a>

					</div>
					<div class="carousel-item">
						<a href="phone"> <img
							src="hinh/spec-samsung-galaxy-s20-plus-ft.jpg"></a>
					</div>
					<div class="carousel-item">
						<a href="phone"> <img
							src="hinh/samsung-a31-ft-spec-720x333-4.jpg"></a>
					</div>
					<div class="carousel-item">
						<a href="phone"> <img
							src="hinh/samsung-galaxy-tab-s6-lite-ft-spec.jpg">
						</a>

					</div>
					<div class="carousel-item">
						<a href="Html/htmlA52.html"><img
							src="hinh/oppo-a52-spec-720x333.jpg"> </a>
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
			<script>
				$(document).ready(function() {
					// Activate Carousel with a specified interval
					$("#demo").carousel({
						interval : 2000
					});

					// Enable Carousel Indicators
					$(".item1").click(function() {
						$("#demo").carousel(0);
					});
					$(".item2").click(function() {
						$("#demo").carousel(1);
					});
					$(".item3").click(function() {
						$("#demo").carousel(2);
					});
					$(".item4").click(function() {
						$("#demo").carousel(3);
					});
					$(".item4").click(function() {
						$("#demo").carousel(4);
					});

					// Enable Carousel Controls
					$(".carousel-control-prev").click(function() {
						$("#demo").carousel("prev");
					});
					$(".carousel-control-next").click(function() {
						$("#demo").carousel("next");
					});
				});
			</script>
		</section>

		<footer class="navbar navbar-expand-sm" id="footer">
			<div class="col-md-1 ">
				<a> <img src="hinh/python.jpg">
				</a>
			</div>
			<div class="col-md-2">
				<a href="#">Chính sách bảo hành</a> <br> <a href="#">Chính
					sách đổi trả</a>
			</div>
			<div class="col-md-2">
				<a href="#">Hướng dẫn mua online</a> <br> <a href="#">Nội
					quy cửa hàng</a>
			</div>
			<div class="col-md-2">
				<a href="#">Phương thức thanh toán</a> <br> <a href="#">Phương
					thức vận chuyển</a>
			</div>

			<div class="col-md-1"></div>
			<div class="col-md-3" id="imgf">
				<a href=""><img src="hinh/fb.png"> </a> <a href=""><img
					src="hinh/tw.png"> </a> <a href=""><img src="hinh/y.png">
				</a>
			</div>
		</footer>

	</div>
</body>

</html>