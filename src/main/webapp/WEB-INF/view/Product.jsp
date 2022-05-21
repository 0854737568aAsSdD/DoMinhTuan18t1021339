<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sản phẩm</title>
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
.chat-btn {
	position: absolute;
	right: 5px;
	bottom: 30px;
	cursor: pointer
}

.chat-btn .close {
	display: none
}

.chat-btn i {
	transition: all 0.9s ease
}

#check:checked ~.chat-btn i {
	display: block;
	pointer-events: auto;
	transform: rotate(180deg)
}

#check:checked ~.chat-btn .comment {
	display: none
}

.chat-btn i {
	font-size: 22px;
	color: #fff !important
}

.chat-btn {
	width: 50px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50px;
	background-color: blue;
	color: #fff;
	font-size: 22px;
	border: none
}

.wrapper {
	position: absolute;
	right: 20px;
	bottom: 100px;
	width: 300px;
	background-color: #fff;
	border-radius: 5px;
	opacity: 0;
	transition: all 0.4s
}

#check:checked ~.wrapper {
	opacity: 1
}

.header {
	padding: 13px;
	background-color: blue;
	border-radius: 5px 5px 0px 0px;
	margin-bottom: 10px;
	color: #fff
}

.chat-form {
	padding: 15px;
	border: solid 1px #ccc;
	border-radius: 10px;
	border: solid 1px #ccc;
	height: 300px;
	overflow: scroll;
}

.chat-form input, textarea, button {
	margin-bottom: 10px
}

.chat-form textarea {
	resize: none
}

.form-control:focus, .btn:focus {
	box-shadow: none
}

.btn, .btn:focus, .btn:hover {
	background-color: blue;
	border: blue
}

#check {
	display: none !important
}

.choice {
	background-color: #EEEECC;
	border: solid 1px #ccc;
	border-radius: 10px;
	margin: 4px;
	padding: 2px 6px;
	display: inline-block;
	cursor: pointer;
	border: solid 1px #ccc;
}

.choiceresult {
	float: right;
	background-color: #00BFFF;
	border: solid 1px #ccc;
	border-radius: 10px;
	margin: 4px;
	padding: 2px 6px;
	display: inline-block;
	cursor: pointer;
	border: solid 1px #ccc;
	background-color: #00BFFF;
}
</style>
</head>
<body
	<c:set var="language" value="${khachhang.getHoten()}" scope="session" />
	data-spy="scroll" data-target="#nav1" data-offset="50">

	<div class="container-fluid" style="padding: 70px 0px 0px 0px;">
		<nav
			class="navbar navbar-expand-sm bg-dark justify-content-center fixed-top"
			id="nav1">
			<ul class="navbar-nav" id="uln">
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
				<c:if test="${not empty khachhang}">
					<ul>
						<li class="nav-item" style="color: yellow;">Hello, ${language }</li>
						<li class="nav-item"><span><a href="KiemTra?kiemtra=0">Đăng
									Xuất</a></span></li>
					</ul>
>
				</c:if>
			</ul>
			<form action="phone" style="padding-left: 10%; position: relative;">
				<div class="input-group mb-3" id="formtk">
					<input id="myInput" class="form-control" type="text"
						placeholder="Tìm kiếm sản phẩm.." name="txtTimkiem">
					<div class="input-group-append">
						<button class="btn btn-light " type="submit">Go</button>
					</div>
				</div>
			</form>
		</nav>
		<div>
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
				<div class="filter">
					<div class="row" style="padding: 0px 15px;">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<c:forEach items="${loai}" var="c">
										<td id="samsung	"><a href="phone?maloai=${c.maloai}"
											class=""><img src="${c.anhloai}" /></a></td>
									</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  <div class="row" id="lc">
						<p style="padding-right: 10px;">Chọn mức giá:</p>
						<a href="#">Dưới 2 triệu</a> <a href="#">từ 2 - 4 triệu</a> <a
							id="4_7" href="#">từ 4 - 8 triệu</a> <a href="#">từ 8 - 15
							triệu</a> <a id="15_" href="#">trên 15 triệu</a> <input
							style="margin: 5px 5px 0px 0px;" type="checkbox"> <a
							href="#">Mới</a> <input style="margin: 5px 5px 0px 0px;"
							type="checkbox"> <a href="#">Trả góp 0%</a> <input
							style="margin: 5px 5px 0px 0px;" type="checkbox"> <a
							href="#">Độc quyền</a>
					</div>s-->

					<ul class="homeproduct" id="homeproduct">
						<c:forEach items="${phone}" var="c">
							<li class="item"><a href="Html/htmlA92.html"> <img
									width="180" height="180" src="${c.anh}">
									<h3>${c.tendienthoai}</h3>
									<div class="price">
										<strong value>${c.gia} ₫</strong> <a style="color: blueviolet"
											href="cart?makh=${khachhang.getMakh()}&tendienthoai=${c.tendienthoai}$&gia=${c.gia}&anh=${c.anh}&madienthoai=${c.madienthoai}">Đặt
											mua</a>
									</div>
									<div class="promo noimage">
										<p>Tặng 2 suất mua Đồng hồ thời trang giảm 40% (kh&#244;ng
											&#225;p dụng th&#234;m khuyến m&#227;i kh&#225;c)</p>
									</div> <label class="installment">Trả góp 0%</label>
							</a></li>
						</c:forEach>

					</ul>
					<input type="checkbox" id="check"> <label class="chat-btn"
						for="check"> <i class="fa fa-commenting-o comment"></i> <i
						class="fa fa-close close"></i>
					</label>
					<div class="wrapper">
						<div class="header">
							<h6>Xin chào quý khách đến với hỗ trợ trực tuyến</h6>
						</div>
						<div class="chat-form" id="conversation">
							<div>
								<a onclick="submitChoice(this)"
									data-choice="Yêu cầu tư vấn sản phẩm của bạn sẽ được tới với nhân viên trực tuyến"
									style="background: white-space:; color: black;" class="choice">
									Tư vấn sản phẩm </a> <br /> <a onclick="submitChoice(this)"
									style="background: white-space:; color: black;" class="choice"
									data-choice="Yêu cầu hỗ trợ kĩ thuật của bạn sẽ được tới với nhân viên trực tuyến">
									Hỗ trợ kĩ thuật </a> <br />

							</div>
						</div>
					</div>

					<script type="text/javascript">
						function submitChoice(el) {
							let choice = document.createElement('p');
							choice.innerHTML = el.dataset.choice;
							choice.setAttribute('class', "choiceresult");
							choice.setAttribute('color', "blue");
							choice.setAttribute('background-color', "blue");
							$('#conversation').append(choice);
							let element = document.createElement('div');
							element.innerHTML = '<a onclick="submitChoice(this)"\
                data-choice="Yêu cầu tư vấn sản phẩm của bạn sẽ được tới với nhân viên trực tuyến"\
                style="background: white-space:; color: black;" class="choice">\
                Tư vấn sản phẩm </a> <br /> <a onclick="submitChoice(this)"\
                style="background: white-space:; color: black;" class="choice"\
                data-choice="Yêu cầu hỗ trợ kĩ thuật của bạn sẽ được tới với nhân viên trực tuyến"> Hỗ trợ kĩ\
                thuật </a> <br />';
							$('#conversation').append(element);

						}
					</script>
			</section>
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
		</div>
	</div>
</body>

</html>