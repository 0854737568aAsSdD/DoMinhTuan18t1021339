<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Detail</title>
<link rel="stylesheet" href="css/css20.css">
<link rel="stylesheet" href="css/css.css">
<link rel="shortcut icon" href="hinh/python.jpg" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#myInput").on("keyup", function() {
			var dt = 0;
			var value = $(this).val().toLowerCase();
			$("#myList li").filter(function() {
				var k = $(this).text().toLowerCase().indexOf(value) > -1;
				if (k == true) {
					dt += 1
					if (dt > 6) {
						k = false
					}
				}
				$(this).toggle(k)

			});
			$("#myList").attr('style', 'display:block')
			if ($(this).val() == "") {
				$("#myList").attr('style', 'display:none');
			}
		});
		$("#docT").click(function() {
			$("#mo").attr("style", "display: block")
		})
		return true;
	});
</script>
</head>

<body>
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
				<li class="nav-item"><a class="nav-link" href="ShowGioHang">GIỎ
						HÀNG</a></li>

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
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="Html/Home.html">Trang
						chủ</a></li>
				<li class="breadcrumb-item"><a href="Html/Products.html">Sản
						phẩm</a></li>
				<li class="breadcrumb-item active">${tendienthoai }</li>
			</ul>
			<div class="rowtop">
				<h2>${tendienthoai }</h2>
			</div>
			<div class="row">
				<div class="col-md-4" style="padding-left: 0px; padding-top: 50px;">
					<img style="height: 50%;" src="${anh }">
				</div>
				<div class="col-md-5">
					<aside class="price_sale">
						<div class="area_price">
							<strong style="color: #e10c00; font-size: 25px;">${gia }₫
							</strong> <label> Trả góp 0%</label>
						</div>
						<div class="area_promotion">
							<strong style="font-size: 130%;">Khuyến mãi</strong>
							<ul class="nav">

								<li class="nav-item"><img src="hinh/tick.png"> Giảm
									ngay 7 triệu (áp dụng đặt và nhận hàng từ 19 - 21/6) (đã trừ
									vào giá)</li>
								<li class="nav-item"><img src="hinh/tick.png"> Trả
									góp 0% thẻ tín dụng</li>
								<li class="nav-item"><img src="hinh/tick.png"> Ưu đãi
									phòng chờ thương gia</li>
								<li class="nav-item"><img src="hinh/tick.png"> Tặng 2
									suất mua Đồng hồ thời trang giảm 40% (không áp dụng thêm khuyến
									mãi khác</li>
								<li class="nav-item"><img src="hinh/tick.png">Tặng
									suất mua đồng hồ Samsung Active 2 giảm đến 3.000.000đ</li>
							</ul>

						</div>
						<div class="area_order ">
							<div class="col-md-12"
								style="margin-top: 30px; margin-bottom: 15px; padding: 0px;">
								<button type="button" class="btn btn-warning btn-block">
									<p style="font-size: 20px;">
										<b> <a
											href="cart?makh=${khachhang}&tendienthoai=${tendienthoai}&gia=${gia}&anh=${anh}&madienthoai=${madienthoai}">
												Thêm vào giỏ hàng </a></b>
									</p>
								</button>
							</div>
							<p style="text-align: center; color: black;">
								Gọi đặt mua: <a href="#">1900.100</a> (miễn phí - 7:30-22:00)
							</p>
						</div>
					</aside>
				</div>
				<div class="col-md-3">
					<A href="#"> Kiểm tra hàng tại nơi bạn ở không?</A>
					<div class="right_info">
						<ul class="nav ">
							<li class="nav-item">Bộ sản phẩm gồm: <a href="#"> Sạc,
									Tai nghe, S&#225;ch hướng dẫn, Hộp, C&#226;y lấy sim, Ốplưng,
									C&#225;p.</a>
							</li>
							<li class="nav-item">Bảo hành chính hãng 12 tháng.</li>
							<li class="nav-item" style="border: none;">Lỗi là đổi mới
								trong 1 tháng tại hơn 2026 siêu thị toàn quốc <a href="#">(click
									xem chi tiết)</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row box_content">
				<aside class="col-md-9 ">
					<article>
						<h2>
							<a href="${anh }">${tendienthoai }</a> là mẫu <a href="${anh }">smartphone</a>
							tầm trung vừa được <a href="${anh }"></a> ra mắt đầu tháng
							5/2022. Chiếc điện thoại gây ấn tượng với thiết kế màn hình khoét
							lỗ tràn viền, cụm 4 camera ấn tượng và được bán với mức giá vô
							cùng phải chăng.
						</h2>
						<h3 style="margin-top: 30px">Hiệu năng mạnh mẽ trên
							${cpu }</h3>
						<p>${tendienthoai } được trang bị cho mình con chip ${cpu} mạnh
							mẽ cho hiệu năng cao, xử lý đa nhiệm mượt mà, “cân” tốt các tựa
							game mobile hiện hành.</p>
						<div id="mo" style="display: none;">
							<p>Màn hình ${manhinh } khả năng hiển thị màu sắc sắc nét, độ
								chi tiết cao và sống động.</p>
							<p>Khung máy được hoàn thiện một cách tỉ mỉ, độ chính xác cao
								với viền màn hình đã được thiết kế cong nhẹ cho cảm giác dễ dàng
								cầm nắm, không bị cấn tay hay vô tình chạm vào màn hình.</p>
							<p>Điểm nổi bật trên chiếc điện thoại ${tendienthoai } chính
								là việc trang bị màn hình được thiết kế độc đáo</p>
							<p>Camera sau ${camerasau} và Camera trước ${ cameratruoc}
								giúp khách hàng có thể chụp những bức hình tuyệt vời nhất</p>
							<p>Ram ${ram} là sự bổ sung hoàn hảo cho dòng máy này</p>
							<p>Bộ nhớ trong ${bonhotrong } cực khủng giúp người dùng có
								thể lưu trữ dữ liệu thoải mái</p>
						</div>
					</article>
					<p class="show-more text-center">
						<button id="docT" class="btn btn-info dropdown-toggle">Đọc
							thêm</button>
					</p>




				</aside>
				<aside class="col-md-3 tableparameter" style="padding: 0px;">
					<h2>Thông số kỹ thuật</h2>
					<ul class="parameter ">
						<li><span>Màn hình:</span>
							<div>
								${manhinh }</a>
							</div></li>
						<li><span>Hệ điều hành:</span>
							<div>
								${hedieuhanh }</a>
							</div></li>
						<li><span>Camera sau:</span>
							<div>${camerasau }</div></li>
						<li><span>Camera trước:</span>
							<div>${cameratruoc }</div></li>
						<li><span>CPU:</span>
							<div>${cpu }</div></li>
						<li><span>RAM:</span>
							<div>${ram }</div></li>
						<li><span>Bộ nhớ trong:</span>
							<div>${bonhotrong }</div></li>
					</ul>
					<button type="button" class="btn btn-primary btn-block">Xem
						thêm cấu hình chi tiết</button>
				</aside>
			</div>
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
</body>

</html>