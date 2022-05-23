<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Trang tin nhắn</title>
<link rel="shortcut icon" href="hinh/python.jpg" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.x.x/css/swiper.min.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style>
body {
	display: flex;
	align-items: center;
	justify-content: center;
}

.container-fluid {
	padding: 0;
}

.imgcard {
	text-align: center;
	padding-top: 20px;
}

.imgcard img {
	width: 365px;
}

.imgcard h3 {
	color: #fff;
}

.swiper-container {
	width: 100%;
	padding-top: 50px;
	padding-bottom: 150px;
}

.swiper-slide {
	background-position: center;
	background-size: cover;
	width: 400px;
	height: 450px;
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

a, span, h2, p {
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
	background-color: rgb(255, 255, 255);
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
	padding: 40px 30%;
}

#form a img {
	height: 45px;
}

#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px; /* Height of the footer */
	background: #6cf;
}

footer img {
	height: 50px;
	border-radius: 50px;
	margin-left: 10px;
}

.modal-dialog {
	width: 800px;
	margin: 30px auto;
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
				<li><a class="navbar-brand" href="#"> <img
						src="hinh/phonehead_image.png" style="width: 40px;">
				</a></li>


				<li class="nav-item"><span>Hotline mua hàng:</span><br> <span>Gọi
						ngay: 1900100</span></li>
				<a class="navbar-brand" href="#"> <img src="hinh/user_image.png"
					style="width: 40px;">
				</a>
				<c:if test="${empty khachhang}">
					<li class="nav-item"><span><a href="Login">Đăng
								nhập</a></span></li>
				</c:if>
				<c:if test="${not empty khachhang}">
					<ul>
						<li class="nav-item" style="color: yellow;">Hello, ${language }</li>
						<li class="nav-item"><span><a href="DangXuat">Đăng
									Xuất</a></span></li>
					</ul>
>
				</c:if>
				<c:if test="${not empty Login }">
					<script type="text/javascript">
						$(window).on('load', function() {
							$('#myModal456').modal('show');
						});
					</script>
				</c:if>


			</ul>
		</nav>
		<nav class="navbar bg-dark justify-content-center" id="nav2">
				<ul class="nav " id="reponsive">
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
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Họ Tên</th>
							<th>Nội Dung Phản Hồi</th>
							<th>Nội Dung Được Trả Lời</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${phanhoi}" var="t">
							<tr>
								<td style="color: #2E0249">${t.getHoten() }</td>
								<td style="color: #EB5353;">${t.getNoidung()}</td>
								<td>
								<c:choose>
										<c:when test="${t. getXacnhan() == 0}">
											<p style="color: #A85CF9">Chưa trả lời</p>
										</c:when>
										<c:when test="${t.getXacnhan() == 1 }">
											<p style="color: #A85CF9">${t.getPhanhoi() }</p>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal fade" id="myModal456" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<h3 class="text-center">Bạn cần đăng nhập để tiến hành chức
							năng này</h3>
						<a href="Login">Đăng nhập ngay </a>
					</div>
				</div>
			</div>
		</div>
		<footer class="navbar navbar-expand-sm bg-dark" id="footer">
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
				<a href="#">Phương thức thanh toán</a> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3" id="imgf">
				<a href=""><img src="hinh/fb.png"> </a> <a href=""><img
					src="hinh/tw.png"> </a> <a href=""><img src="hinh/y.png">
				</a>
			</div>
		</footer>
</body>

</html>