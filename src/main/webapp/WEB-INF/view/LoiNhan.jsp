<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Message</title>
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
<script src="js/Validator.js"></script>
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
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	%>
	<nav class="navbar bg-dark justify-content-center" id="nav2">
		<ul class="nav " id="reponsive">
			<li class="nav-item"><a class="nav-link" href="HomeAdmin">Admin</a></li>
		</ul>
	</nav>
	<br>
	<%-- 	<div class="card-body">
		<h4>Admin Trả Lời</h4>
		<form action="AdminPhanHoi" method="post">
			<label for="loinhan">Nhập lời nhắn</label> <input type="text"
				name="phanhoi" id="loinhan"> <input type="hidden"
				name="maphanhoi" value="${maphanhoi}"> <input type="submit">
		</form>
	</div>
 --%>
	<div class="container">
		<h3 style="text-align: center;">Nhập lời nhắn cho khách hàng</h3>
		<form action="AdminPhanHoi" method="post" id="form-new">
			<div class="form-group">
				<label for="loinhan">Nhập lời nhắn:</label> <input type="text"
					class="form-control" placeholder="Nhập lời nhắn tới khách hàng"
					name="phanhoi" id="loinhan"> <span class="form-message"
					style="color: red"></span> <input type="hidden" name="maphanhoi"
					value="${maphanhoi}">
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
	<!--
		<script>
		
	<%@include file="../../js/Validator.js"%>
		
	</script>
	  -->

	<script type="text/javascript">
		Validator({
			form : '#form-new',
			errorSelector : '.form-message',
			rules : [ Validator.isRequired('#loinhan'), ],
		//Validator.isLogic('#ngayXuatPhat') 
		//		onSubmit : function(data) {
		//		console.log(data);
		//}
		});
	</script>
	
</body>
</html>
