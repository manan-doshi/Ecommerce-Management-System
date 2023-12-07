<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel - Add Product</title>
<link rel="shortcut icon" href="img/admin.png" type="image/x-icon">
<link rel="stylesheet" href="css/admin_add_product.css">
<link rel="icon" href="img/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">
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
		response.setHeader("Expires","0");
		
		if(session.getAttribute("uemail_admin")==null){
		response.sendRedirect("admin_login.jsp");
	} 
		%>


	<nav class="navbar navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Admin Panel</a>
			<div class="admin_name">Add a new product</div>

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

		<div id="form">

			<form method="post" action="./Admin_add_products"
				enctype="multipart/form-data">

				<label id="label" for="Id">Id:-</label><br> <input
					type="number" name="id" placeholder="Enter Product Id" required><br>
				<br> <label id="label" for="price">Price:-</label><br> <input
					type="number" name="price" placeholder="Enter Product Price"
					required><br> <br> <label id="label" for="name">Name:-</label><br>
				<input type="text" name="name" placeholder="Enter Product Name"
					required><br> <br> <label id="label" for="cars">Choose
					a category:</label><br> <select name="categories" id="cars"
					style="font-size: 16px;">
					<option value="grocery">grocery</option>
					<option value="mobiles">mobiles</option>
					<option value="fashion">fashion</option>
					<option value="electronics">electronics</option>
					<option value="home & furniture">home & furniture</option>
					<option value="appliances">appliances</option>
					<option value="footwear">footwear</option>
				</select><br> <br> <label id="label" for="discount">Discount</label><br>

				<input type="number" name="discount" placeholder="% Of Discount"
					required><br> <br> <label id="label" for="images">Image:</label><br>
				<input id="image" type="file" name="images" required> <br>
				<br> <label id="label" for="discription">Description:</label><br>
				<textarea rows="10" cols="40" name="desc"
					placeholder="Enter Product Description"></textarea>
				<br> <br> <input id="submit" type="submit"
					class="btn btn-success"
					style="border: none; background-color: green; width: 200px; color: white; border-radius: 5px; font-size: 20px; padding: 10px; text-align: center; margin-left: 170px; box-shadow: 10px 10px 13px 1px rgba(0, 0, 0, 0.1);"
					value="Add Product">
			</form>
		</div>
	</div>

	<% if (session.getAttribute("status") != null) { %>
	<div class="alert alert-success alert-centered" role="alert">
		<strong>Product Added Successfully!</strong>
	</div>
	<% session.removeAttribute("status"); } %>

	<% if (session.getAttribute("status_fail") != null) { %>
	<div class="alert alert-danger alert-centered" role="alert">
		<strong>Something Went Wrong! Please try again.</strong>
	</div>
	<% session.removeAttribute("status_fail"); } %>

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