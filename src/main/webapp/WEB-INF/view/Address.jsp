<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Address</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jsproducts.js"></script>
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px; /* Height of the footer */
	background: #6cf;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="#">Home</a>

		<!-- Links -->
		<ul class="navbar-nav">
		</ul>
	</nav>
	<br>

	<div class="container">
		<h3 style="text-align: center;">Mời bạn nhập địa chỉ giao hàng</h3>
		<form action="${pageContext.request.contextPath}/DatMuaHangController"
			method="post" id="form-new">
			<div class="form-group">
				<label for="email">Họ và tên:</label> <input type="text"
					class="form-control" placeholder="Nhập họ tên" name="hovaten"
					id="hovaten"> <span class="form-message" style="color: red"></span>
			</div>
			<div class="form-group">
				<label for="pwd">Số điện thoại:</label> <input type="text"
					class="form-control" placeholder="Nhập số điện thoại"
					name="sodienthoai" id="sodienthoai"> <span
					class="form-message" style="color: red"></span>

			</div>
			<div class="form-group">
				<label for="pwd">Địa chỉ giao hàng:</label> <input type="text"
					class="form-control" id="diachi"
					placeholder="Nhập địa chỉ giao hàng" name="diachigiaohang">
				<span class="form-message" style="color: red"></span>
			</div>
			<div class="form-group">
				<label for="pwd">Nhập gmail người nhận hàng:</label> <input
					type="text" class="form-control" id="email"
					placeholder="Nhập email người nhận hàng" name="gmail"> <span
					class="form-message" style="color: red"></span>

			</div>
			<div class="form-group">
				<input type="hidden"
					value="Cảm ơn bạn đã mua hàng từ phía cửa hàng chúng tôi. Đơn hàng của bạn sẽ được giao đến địa chỉ. "
					name="text0" /> <input type="hidden"
					value=" với tên người nhận là: " name="text1" /> <input
					type="hidden" value=" .Vui lòng chuẩn bị số tiền là " name="text2" />
				<input type="hidden"
					value=" đồng để gửi cho bên giao hàng. Xin cảm ơn" name="text3" />
				<input type="hidden" value="Thông báo về đơn hàng" name="subject" />
			</div>
			<div class="form-group">
				<input type="hidden" value="<%=request.getAttribute("sotien")%>"
					name="sotien">
			</div>
			<button type="submit" class="btn btn-primary">Hoàn thành</button>
		</form>
	</div>
	<!-- ------------footer----------- -->
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
	<script>
		
	<%@include file="../../js/Validator.js"%>
		
	</script>
	<script type="text/javascript">
		Validator({
			form : '#form-new',
			errorSelector : '.form-message',
			rules : [ Validator.isRequired('#hovaten'),
					Validator.isRequired('#sodienthoai'),
					Validator.isRequired('#diachi'),
					Validator.isRequired('#email'),
					Validator.isEmail('#email'),
					Validator.isSoDienThoaiTuan('#sodienthoai'),
					Validator.isTenTuan('#hovaten')],
		//Validator.isLogic('#ngayXuatPhat') 
		//		onSubmit : function(data) {
		//		console.log(data);
		//}
		});
	</script>
</body>
</html>
