<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<title>Admin - Quản Lý Điện Thoại</title>

<!-- Custom fonts for this template-->
<link href="css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/admin.css" rel="stylesheet">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="AdminController">Quản Lý Thống
			Kê</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form action="Admin" method="get"
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control"
					placeholder="Search for book" aria-label="Search"
					aria-describedby="basic-addon2" name="tkttk">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li style="color: white; font-family: cursive; font-size: 30px">Hello,
				<c:out value="${sessionScope.admin.getTenDangNhap()} "></c:out>
			</li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="QuanLyPhone">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Quản Lý
						Điện Thoại</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="QuanLyKhachHang"> <i
					class="fas fa-fw fa-chart-area"></i> <span>Quản Lý Khách
						Hàng</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="QuanLyPhanHoi">
					<i class="fas fa-fw fa-chart-area"></i> <span>Quản Lý Phản
						Hồi</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="QuanLyThongKe">
					<i class="fas fa-fw fa-chart-area"></i> <span>Quản Lý Thống
						Kê</span>
			</a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Admin</a></li>
					<li class="breadcrumb-item active">Quản Lý Điện Thoại</li>
				</ol>

				<!-- Icon Cards-->
				<div class="row">
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-primary o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-comments"></i>
								</div>
								<div class="mr-5">26 New Messages!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="#">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-warning o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-list"></i>
								</div>
								<div class="mr-5">11 New Tasks!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="#">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-success o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-shopping-cart"></i>
								</div>
								<div class="mr-5">123 New Orders!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="#">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-danger o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-life-ring"></i>
								</div>
								<div class="mr-5">13 New Tickets!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="#">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
				</div>


				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Điện Thoại
					</div>
					<div class="card-body">
						<div class="container">
							<input type="hidden" value="${sotien[0]}" id="1"> <input
								type="hidden" value="${sotien[1]}" id="2"> <input
								type="hidden" value="${sotien[2]}" id="3"> <input
								type="hidden" value="${sotien[3]}" id="4"> <input
								type="hidden" value="${sotien[4]}" id="5"> <input
								type="hidden" value="${sotien[5]}" id="6"> <input
								type="hidden" value="${sotien[6]}" id="7"> <input
								type="hidden" value="${sotien[7]}" id="8"> <input
								type="hidden" value="${sotien[8]}" id="9"> <input
								type="hidden" value="${sotien[9]}" id="10"> <input
								type="hidden" value="${sotien[10]}" id="11"> <input
								type="hidden" value="${sotien[11]}" id="12">
							<canvas id="myChart"></canvas>
						</div>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>


		</div>
		<!-- /.container-fluid -->

		<!-- Sticky Footer -->
		<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © Your Website 2019</span>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<script>
		let myChart = document.getElementById('myChart').getContext('2d');
		// Global Options
		Chart.defaults.global.defaultFontFamily = 'Lato';
		Chart.defaults.global.defaultFontSize = 18;
		Chart.defaults.global.defaultFontColor = '#777';

		let massPopChart = new Chart(myChart, {
			type : 'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
			data : {
				labels : [ 'Tháng 1', 'Tháng 2 ', 'Tháng 3', 'Tháng 4',
						'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
						'Tháng 10', 'Tháng 11', 'Tháng 12' ],
				datasets : [ {
					//   label:'Population',
					data : [ parseInt(document.getElementById("1").value),
							parseInt(document.getElementById("2").value),
							parseInt(document.getElementById("3").value),
							parseInt(document.getElementById("4").value),
							parseInt(document.getElementById("5").value),
							parseInt(document.getElementById("6").value),
							parseInt(document.getElementById("7").value),
							parseInt(document.getElementById("8").value),
							parseInt(document.getElementById("9").value),
							parseInt(document.getElementById("10").value),
							parseInt(document.getElementById("11").value),
							parseInt(document.getElementById("12").value) ],
					//backgroundColor:'green',
					backgroundColor : [ 'rgba(255, 99, 132, 0.6)',
							'rgba(54, 162, 235, 0.6)',
							'rgba(255, 206, 86, 0.6)',
							'rgba(75, 192, 192, 0.6)',
							'rgba(153, 102, 255, 0.6)',
							'rgba(255, 159, 64, 0.6)',
							'rgba(255, 99, 132, 0.6)',
							'rgba(255, 99, 132, 0.6)',
							'rgba(255, 99, 132, 0.6)',
							'rgba(255, 99, 132, 0.6)',
							'rgba(255, 99, 132, 0.6)',
							'rgba(255, 99, 132, 0.6)',
							'rgba(255, 99, 132, 0.6)' ],
					borderWidth : 1,
					borderColor : '#777',
					hoverBorderWidth : 3,
					hoverBorderColor : '#000'
				} ]
			},
			options : {
				title : {
					display : true,
					text : 'Biểu đồ thống kê',
					fontSize : 25
				},
				legend : {
					display : false,
					position : 'right',
					labels : {
						fontColor : '#000'
					}
				},
				layout : {
					padding : {
						left : 50,
						right : 0,
						bottom : 0,
						top : 0
					}
				},
				tooltips : {
					enabled : true
				}
			}
		});
	</script>
	<!-- Scroll to Top Button-->
</body>

</html>