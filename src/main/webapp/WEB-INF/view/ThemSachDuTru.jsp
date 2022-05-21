<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Product</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor1/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor1/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor1/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor1/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor1/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor1/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form"
				action="AddOneBookController" method="post"
				enctype="multipart/form-data">
				<span class="contact100-form-title"> Thêm Điện Thoại
					<div>
						<c:if test="${themsach !=null}">
							<h3 style="color: red; font-family: serif; font-size: 20px;">
								Add Phone Complete!</h3>
							<a href="Admin"> Back To Admin Page!</a>
						</c:if>
					</div>
				</span>

				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Mã Điện Thoại</span> <input
						id="txtmasach" name="txtmadienthoai" placeholder="Mã Điện Thoại"
						class="input100" required="" type="text">
					<div>
						<span class="form-message" style="color: red"> ${error }</span>
					</div>
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Tên Điện Thoại</span> <input
						value="${tendienthoai }" id="txttensach" name="txttendienthoai"
						placeholder="Tên Điện Thoại" class="input100" required=""
						type="text"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Màn Hình</span> <input
						value="${manhinh }" id="txtmanhinh" name="txtmanhinh"
						placeholder="Màn Hình" class="input100" required="" type="text">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Camera Sau</span> <input
						value="${camerasau }" id="txtcamerasau" name="txtcamerasau"
						placeholder="Camera Sau" class="input100" required="" type="text">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Camera Trước</span> <input
						value="${cameratruoc }" id="txtcameratruoc" name="txtcameratruoc"
						placeholder="Camera Trước" class="input100" required=""
						type="text"> <span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">RAM</span> <input id="txtram"
						value="${ram }" name="txtram" placeholder="Ram" class="input100"
						required="" type="text"> <span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Bộ Nhớ Trong</span> <input
						value="${bonhotrong }" id="txtbonhotrong" name="txtbonhotrong"
						placeholder="Bộ Nhớ Trong" class="input100" required=""
						type="text"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Giá</span> <input value="${gia }"
						id="txthedieuhanh" name="txtgia" placeholder="Giá"
						class="input100" required="" type="number"> <span
						class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Hệ Điều Hành</span> <input
						value="${hedieuhanh }" id="txtsoluong" name="txthedieuhanh"
						placeholder="Hệ Điều Hành" class="input100" required=""
						type="text"> <span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 input100-select">
					<span class="label-input100">Thể Loại</span>
					<div>
						<select class="selection-2" name="service"
							onchange="genderChanged(this)">
							<option selected>Chọn loại điện thoại</option>
							<c:forEach items="${loai}" var="l">
								<option value="${l.maloai }">${l.tenloai }</option>
							</c:forEach>
						</select>
					</div>
					<script language="javascript">
						function genderChanged(obj) {
							var value = obj.value;
							result.value = value;
						}
					</script>
					<span class="focus-input100"></span> <input type="hidden"
						id="result" value="" name="txtloai" class="input100" />
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">CPU</span> <input id="txtsotap"
						value="${cpu }" name="txtcpu" placeholder="CPU" class="input100"
						required="" type="text"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Ảnh</span> <img alt="" src="${anh }">
					<input id="txtfile" name="txtfile" placeholder="Ảnh"
						class="input100" required="" type="file"
						onchange="previewFile(this);"> <span
						class="focus-input100"></span>
					<div id="preview"></div>
				</div>

				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						<button class="contact100-form-btn">
							<span> Submit <i class="fa fa-long-arrow-right m-l-7"
								aria-hidden="true"></i>
							</span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<script type="text/javascript">
	function previewFile(input) {
		const [file] = input.files
		const preview = document.getElementById('preview')
		const reader = new FileReader()
		
		reader.onload = e => {
			const img = document.createElement('img')
			img.src = e.target.result
			img.width = 200
			img.height = 200 
			img.alt ='file'
			preview.appendChild(img)
		}
		reader.readAsDataURL(file)
		
	}
	</script>
</body>
</html>