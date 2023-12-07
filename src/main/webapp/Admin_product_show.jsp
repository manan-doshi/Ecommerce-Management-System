<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel - Product Details</title>
<link rel="shortcut icon" href="img/admin.png" type="image/x-icon">
<link rel="stylesheet" href="css/Admin_product_show.css">
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
	response.setHeader("Expires", "0");

	if (session.getAttribute("uemail_admin") == null) {
		response.sendRedirect("admin_login.jsp");
	}
	%>


	<nav class="navbar navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Admin Panel</a>
			<div class="admin_name">Product Details</div>

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

	<div id="input-container" style="text-align: center; margin-top: 100px">
		<input type="text" id="name-input"
			placeholder="Search Products by Name">

		<table>
			<thread>
			<tr>
				<th>Name</th>
				<th>Price</th>
				<th>Discount</th>
				<th>Image</th>
				<th colspan=2>Actions</th>
			</tr>
			</thread>
			<tbody>
				<%
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

					Statement smtt = con.createStatement();
					ResultSet Rs = smtt.executeQuery("SELECT * FROM admin_add_products");
					while (Rs.next()) {
						int id = Rs.getInt("id");
						int discount = Rs.getInt("discount");
						String name = Rs.getString("name");
						String images = Rs.getString("images");
						int price = Rs.getInt("price");
						String categories = Rs.getString("categories");
						String description = Rs.getString("description");
				%>

				<tr>
					<td><%=name%></td>
					<td><%=price%></td>
					<td><%=discount%>%</td>
					<td><%=images%></td>

					<form action="./Admin_product_show.jsp" method="post">
						<td style="text-align: center"><input type="hidden" name="id"
							value="<%=id%>"> <input type="submit" value="Update"
							id="button2"></td>
					</form>

					<form action="./Admin_delete_products" method="post"
						onsubmit="return myFunction()">
						<td style="text-align: center"><input type="hidden" name="id"
							value="<%=id%>"> <input type="submit" value="Remove"
							id="button1"></td>
					</form>

				</tr>
				<%
				}
				} catch (Exception e) {
				out.println(e);
				}
				%>
			</tbody>

			<script>
				function myFunction() {
					if (confirm("Are you sure you want to remove this product?")) {
						return true;
					} else {
						return false;
					}
				}
			</script>

		</table>
		<%
		String id = request.getParameter("id");
		%>
		<%
		if (id != null) {
		%>

		<div id="update_product">

			<span id="closeButton" class="close-button" onclick="closeForm()"><i
				class='bx bx-x bx-tada' style="font-size: 35px;"></i></span>
			<form method="post" action="./Admin_update_products"
				enctype="multipart/form-data">
				<p id="p">
					Received ID: <b><%=id%></b>
				</p>

				<label id="lid" for="id">Id:-</label> <input type="number" name="id"
					value="<%=id%>" id="id" placeholder="Enter Product Id" required><br>
				<br> <label id="lprice" for="price">Price:-</label> <input
					type="number" name="price" id="price"
					placeholder="Enter Product Price" required><br> <br>
				<label id="lname" for="name">Name:-</label> <input type="text"
					name="name" id="name" placeholder="Enter Product Name" required><br>
				<br> <label id="ldis" for="discount">Discount:-</label> <input
					type="number" id="dis" name="discount" placeholder="% Of Discount"
					required><br> <br> <label id="limage"
					for="images">Upload Image:-</label> <input id="image" type="file"
					name="images" required><br> <br> <label id="lcat"
					for="Category">Choose A Category:-</label> <select
					name="categories" id="categories">
					<option value="grocery">grocery</option>
					<option value="mobiles">mobiles</option>
					<option value="fashion">fashion</option>
					<option value="electronics">electronics</option>
					<option value="home & furniture">home & furniture</option>
					<option value="appliances">appliances</option>
					<option value="footwear">footwear</option>
				</select><br> <br> <label id="ldesc" for="description">Description:-</label>
				<textarea id="desc" cols="40" rows="10" name="description"
					placeholder="Enter Product Description"></textarea>
				<br> <br> <input id="submit" type="submit"
					value="Update Product">
			</form>

			<script>
				function update() {
					var form = document.getElementById("update_product");
					form.style.display = "none";
				}

				var closeButton = document.getElementById("closeButton");
				closeButton.addEventListener("click", update);
			</script>
			<%
			} else {
			%>

			<h4>no item to update</h4>
			<%
			}
			%>
		</div>

		<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        var nameInput = document.getElementById("name-input");
        var table = document.querySelector("table");
        var rows = table.querySelectorAll("tbody tr");

        nameInput.addEventListener("input", function() {
            var query = nameInput.value.trim().toLowerCase();
            var noDataFound = true;

            for (var i = 0; i < rows.length; i++) {
                var nameCell = rows[i].getElementsByTagName("td")[0];
                var priceCell = rows[i].getElementsByTagName("td")[1];
                var discountCell = rows[i].getElementsByTagName("td")[2];
                var imageCell = rows[i].getElementsByTagName("td")[3];

                if (nameCell && priceCell && discountCell && imageCell) {
                    var nameText = nameCell.textContent || nameCell.innerText;
                    var priceText = priceCell.textContent || priceCell.innerText;
                    var discountText = discountCell.textContent || discountCell.innerText;
                    var imageText = imageCell.textContent || imageCell.innerText;

                    nameText = nameText.toLowerCase();
                    priceText = priceText.toLowerCase();
                    discountText = discountText.toLowerCase();
                    imageText = imageText.toLowerCase();

                    if (nameText.includes(query) || priceText.includes(query) || discountText.includes(query) || imageText.includes(query)) {
                        rows[i].style.display = "";
                        noDataFound = false;
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }

            var noDataRows = table.getElementsByClassName("no-data-row");
            while (noDataRows.length > 0) {
                noDataRows[0].parentNode.removeChild(noDataRows[0]);
            }

            if (noDataFound) {
                var noDataRow = document.createElement("tr");
                var noDataCell = document.createElement("td");
                noDataCell.colSpan = 5;
                noDataCell.textContent = "No data found";
                noDataRow.appendChild(noDataCell);
                noDataRow.classList.add("no-data-row"); 
                table.querySelector("tbody").appendChild(noDataRow);
            }
        });
    });
</script>
</body>
</html>