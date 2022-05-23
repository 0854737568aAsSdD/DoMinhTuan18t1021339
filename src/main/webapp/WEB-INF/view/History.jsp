<%@page import="com.dmt.bean.KhachHangBean"%>
<%@page import="com.dmt.bean.LichSuBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>History</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="hinh/python.jpg" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jsproducts.js"></script>
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#footer12 {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px; /* Height of the footer */
	background: #6cf;
}
</style>
</head>
<%
ArrayList<LichSuBean> list = (ArrayList<LichSuBean>) request.getAttribute("history");
KhachHangBean kh = (KhachHangBean) session.getAttribute("khachhang");
%>
<body>
	<div class="container">
		<div class="navbar">
			<nav class="navbar bg-dark justify-content-center" id="nav2">
				<ul class="nav " id="reponsive">
					<li class="nav-item"><a class="nav-link" href="Home">TRANG
							CHỦ</a></li>
					<li class="nav-item"><a class="nav-link" href="About">GIỚI
							THIỆU</a></li>
					<li class="nav-item"><a class="nav-link" href="phone">SẢN
							PHẨM</a></li>
					<li class="nav-item"><a class="nav-link" href="ShowGioHang">GIỎ
							HÀNG</a></li> s
					<li class="nav-item"><a class="nav-link" href="PhanHoi">PHẢN
							HỒI</a></li>
					<li class="nav-item"><a class="nav-link" href="tinnhan">TIN
							NHẮN </a></li>
					<li class="nav-item"><a class="nav-link"
						href="LichSuController">LỊCH SỬ MUA</a></li>
					<li class="nav-item"><a class="nav-link" href="Admin">ADMIN</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="container">
		<%
		if (kh != null) {
		%>
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-4">
						<h2 class="heading-section">Lịch Sử Mua Hàng</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h3 class="h5 mb-4 text-center">Lịch Sử Chi Tiết</h3>
						<table>
							<tr>
								<td>
									<h4>
										Tên Khách Hàng:
										<%=kh.getHoten()%>
									</h4>
								</td>
							</tr>
						</table>
						<div class="table-wrap">
							<table class="table">
								<thead class="thead-primary">
									<tr>
										<th>&nbsp;</th>
										<th>&nbsp;</th>
										<th>Sản phẩm</th>
										<th>Tên Sản Phẩm</th>
										<th>Số Lượng</th>
										<th>Giá</th>
										<th>Thời Điểm Mua</th>
										<th>Tình Trạng Đơn Hàng</th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								<%
								for (LichSuBean sb : list) {
								%>
								<tbody>
									<tr class="alert" role="alert">
										<td></td>
										<td></td>
										<td>
											<div class="img"
												style="background-image: url(<%=sb.getAnh()%>);"></div>
										</td>
										<td>
											<div class="email">
												<span
													style="font-family: serif; font-size: 20px; color: blue;"><%=sb.getTendienthoai()%></span>
											</div>
										</td>
										<td>
											<div class="email">
												<span
													style="font-family: serif; font-size: 20px; color: red;">     <%=sb.getSoluong()%></span>
											</div>
										</td>
										<td>
											<div class="email">
												<span
													style="font-family: serif; font-size: 20px; color: green;"><%=sb.getGia()%></span>
											</div>
										</td>

										<td>
											<div class="email">
												<span
													style="font-family: serif; font-size: 20px; color: blue;"><%=sb.getDate()%></span>
											</div>
										</td>
										<td>
											<%
											if (sb.getDamua() == 0) {
											%>
											<div class="email">
												<span
													style="font-family: serif; font-size: 20px; color: red;">
													<p style="color: blueviolet">Chờ Xử Lý</p>
												</span>
											</div> <%
 } else if (sb.getDamua() == 1) {
 %>
											<div class="email">
												<span
													style="font-family: serif; font-size: 20px; color: red;">Đang
													Vận Chuyển </span>
											</div> <%
 }
 %>
										</td>
									</tr>

								</tbody>
								<%
								}
								%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		<%
		} else {
		%>
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
		<h1 style="text-align: center;">Bạn cần đăng nhập để thực hiện
			chức năng này</h1>
		<a href="Login"
			style="margin-left: 450px; color: blueviolet; font-size: 30px">Đăng
			Nhập Ngay</a> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br />

		<%
		}
		%>
	</div>
	<footer class="navbar navbar-expand-sm bg-dark" id="footer">
		<div class="col-md-2">
			<a href="#">Chính sách bảo hành</a> <br>
		</div>
		<div class="col-md-2">
			<a href="#">Hướng dẫn mua online</a> <br>
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
