<%@page import="com.dmt.utills.MyConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="csscuatoi.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
<script src="js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<%
	String saidangnhap = (String) request.getAttribute("saidangnhap");
	String SaiCapcha = (String) request.getAttribute("SaiCapcha");
	%>
	<c:if test="${not empty saidangnhap }">
		<script type="text/javascript">
			$(window).on('load', function() {
				$('#myModal123').modal('show');
			});
			saidangnhap = null;
		</script>
	</c:if>
	<c:if test="${not empty SaiCapcha }">
		<script type="text/javascript">
			$(window).on('load', function() {
				$('#myModal456').modal('show');
			});
			SaiCapcha = null;
		</script>
	</c:if>
	<section class="vh-100">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-login-form/draw2.png"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<form action="Admin" method="post">
						<!-- Email input -->
						<div class="form-outline mb-4">
							<input type="text" id="form3Example3"
								class="form-control form-control-lg"
								placeholder="Enter a username" name="username" />
						</div>

						<!-- Password input -->
						<div class="form-outline mb-3">
							<input type="password" id="form3Example4"
								class="form-control form-control-lg"
								placeholder="Enter password" name="pwd" />
						</div>

						<div class="d-flex justify-content-between align-items-center">
							<!-- Checkbox -->
							<div class="form-check mb-0">
								<input class="form-check-input me-2" type="checkbox" value=""
									id="form2Example3" /> <label class="form-check-label"
									for="form2Example3"> Remember me </label>
							</div>
							<br /> <a href="#!" class="text-body">Forgot password?</a>
						</div>
						<div class="form-group">
							<div class="g-recaptcha" data-sitekey="<%=MyConstants.SITE_KEY%>"></div>

						</div>
						<div class="text-center text-lg-start mt-4 pt-2">
							<input type="submit" value="Login">
							<p class="small fw-bold mt-2 pt-1 mb-0">
								Don't have an account? <a href="#!" class="link-danger">Register</a>
							</p>
						</div>

					</form>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal123" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<h3 class="text-center">Sai thông tin tài khoản hoặc mật khẩu
						</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal456" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<h3 class="text-center">Bạn chưa nhập capcha</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>