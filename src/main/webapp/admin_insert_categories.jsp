<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel - Add Category</title>
<link rel="shortcut icon" href="img/admin.png" type="image/x-icon">
<link rel="stylesheet" href="css/add_category.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">

</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("uemail_admin") == null) {
		response.sendRedirect("admin_login.jsp");
	}
	%>

	<script>
		document.getElementById("form").addEventListener("submit", function(e) {
			e.preventDefault()
			alert("submitted");
		})
	</script>

	<nav class="navbar navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Admin Panel</a>
			<div class="admin_name">Add a new category</div>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
				aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
				id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel"></h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="title"><a class="nav-link active"
							aria-current="page">Admin Controls&nbsp; <i
								class="fa-solid fa-sliders" style="color: #ffffff;"></i></a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="admin_home.jsp"><i class="fa-solid fa-cart-shopping"
								style="color: #ffffff;"> </i>&nbsp;&nbsp; Customer order details</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="admin_insert_categories.jsp"><i
								class="fa-solid fa-circle-plus" style="color: #ffffff;"></i>&nbsp;
								&nbsp;Add categories</a></li>
						<li class="nav-item"><a class="nav-link"
							href="admin_add_product.jsp"><i class="fa-solid fa-plus"
								style="color: #ffffff;"></i></i>&nbsp; &nbsp;Add products</a></li>
						<li class="nav-item"><a class="nav-link"
							href="Admin_product_show.jsp"><i
								class="fa-solid fa-bag-shopping" style="color: #ffffff;"></i>&nbsp;
								&nbsp;Product details</a></li>
						<li class="nav-item"><a class="nav-link"
							href="admin_user_feedback.jsp"><i
								class="fa-solid fa-circle-exclamation" style="color: #ffffff;"></i>
								</i>&nbsp; Customer issue/query</a></li>
						<li class="nav-item"><a class="nav-link"
							href="admin_survey.jsp"><i class="fa-solid fa-user-check"
								style="color: #ffffff;"></i>&nbsp; Customer experience survey</a></li>
						<li class="nav-item"><a class="nav-link"
							href="admin_user_details_show.jsp"><i
								class="fa-solid fa-user-group" style="color: #ffffff;"> </i>&nbsp;&nbsp;Customer
								details</a></li>
					</ul>
					<div class="buttons ml-auto">
						<form action="./Admin_logout" method="post">
							<input type="submit" value="Logout" class="btn btn-outline-light">
						</form>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div id="container">

		<form id="form" method="post" action="./Admin_insert_categories"
			enctype="multipart/form-data">

			<label for="id" id="label">id:</label> <input type="number"
				name="category_id" placeholder="Enter Category Id" required><br>
			<br> <label for="name" id="label">name</label> <input
				type="text" name="name" placeholder="Enter Category Name" required><br>
			<br> <label for="count" id="label">count</label><br> <input
				type="number" name="count" placeholder="Enter Product Count"
				required><br> <br> <label for="images" id="label">image:</label>
			<input type="file" name="images" id="image" required><br>
			<br> <input type="submit"
				style="border: none; background-color: green; width: 200px; color: white; border-radius: 5px; font-size: 20px; padding: 10px; text-align: center; margin-left: 155px; margin-top: 12px;"
				value="Add Category">

		</form>
	</div>
	<%
	if (session.getAttribute("status") != null) {
	%>
	<div class="alert alert-success alert-centered" role="alert">
		<strong>Category Added Successfully!</strong>
	</div>
	<%
	session.removeAttribute("status");
	}
	%>

	<%
	if (session.getAttribute("status_fail") != null) {
	%>
	<div class="alert alert-danger alert-centered" role="alert">
		<strong>Something Went Wrong! Please try again.</strong>
	</div>
	<%
	session.removeAttribute("status_fail");
	}
	%>

	<style>
.alert-centered {
	position: absolute;
	top: 15%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	margin: 0 auto;
}
</style>

</body>
</html>