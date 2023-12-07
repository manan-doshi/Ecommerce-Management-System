<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel - Customer Details</title>
<link rel="shortcut icon" href="img/admin.png" type="image/x-icon">
<link rel="stylesheet" href="css/admin_user_details_show.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

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
			<div class="admin_name">Customer Details</div>

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
		<div id="input-container">

			<input type="text" id="name-input" placeholder="Enter name or email">

			<a href="signup.jsp"><button
					style="background: rgb(32, 45, 58) 81.3%;"; >Add User</button></a>
		</div>
		<table id="myTable">
			<thead>
				<tr>
					<th style="text-align: center; background: rgb(32, 45, 58) 81.3%;"; >User_name</th>
					<th
						style="text-align: center; background: rgb(32, 45, 58) 81.3%; )"; >Email</th>
					<th
						style="text-align: center; background: rgb(32, 45, 58) 81.3%; )"; >Contact
						Number</th>
					<th
						style="text-align: center; background: rgb(32, 45, 58) 81.3%; )"; >Password</th>
					<th colspan=2
						style="text-align: center; background: rgb(32, 45, 58) 81.3%; )"; >Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

					Statement smtt = con.createStatement();
					ResultSet Rs = smtt.executeQuery("SELECT * FROM quickkart_user_login");
					while (Rs.next()) {
						String username = Rs.getString("username");
						String email = Rs.getString("email");
						Long contact_number = Long.parseLong(Rs.getString("contact_number"));
						String password = Rs.getString("password");
				%>

				<tr>
					<td><%=username%></td>
					<td><%=email%></td>
					<td><%=contact_number%></td>
					<td><input type="password" value="<%=password%>"
						readonly="readonly" style="border: none;"></td>

					<form action="./Admin_user_remove" method="post"
						onsubmit="return myFunction()">
						<td style="text-align: center"><input type="hidden"
							name="username" value="<%=username%>"> <input
							id="button1" type="submit" value="Remove"></td>
					</form>
					<form action="./admin_user_details_show.jsp" method="post">
						<td style="text-align: center"><input type="hidden" name="id"
							value="<%=username%>"> <input id="button2" type="submit"
							value="Update"></td>
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
					if (confirm("Are you sure you want to remove this user?")) {
						return true;
					} else {
						return false;
					}
				}
			</script>

		</table>
	</div>
	<%
	String id = request.getParameter("id");
	%>
	<%
	if (id != null) {
	%>

	<div id="container2">
		<div id="closeButton" class="close-button" onclick="update()">
			<i class='bx bx-x bx-tada' style="font-size: 25px;"></i>
		</div>
		<form method="post" id="form2" action="./admin_user_update">
			<p>
				<b>Received name: <%=id%></b>
			</p>
			<br> <label for="name">Name:-</label><br> <input
				type="text" name="username" value="<%=id%>" required><br>
			<br> <label for="email">E-mail:-</label><br> <input
				type="text" name="email" placeholder="Enter User E-mail" required><br>
			<br> <label for="phoneno" style="margin-right: 160px;">
				Contact_Number:-</label><br> <input type="number" name="contact_number"
				placeholder="Enter User Contact_No." required><br> <br>
			<label for="password" style="margin-right: 210px;">Password:-</label><br>
			<input type="text" name="password" placeholder="Enter User Password"
				required><br> <br> <input type="submit"
				id="subbutton" value="Update User">
		</form>
	</div>
	<%
	} else {
	%>

	<h4>No Item to Update</h4>
	<%
	}
	%>

	<script>
		function update() {
			var form = document.getElementById("container2");
			form.style.display = "none";
		}
		var closeButton = document.getElementById("closeButton");
		closeButton.addEventListener("click", update);
	</script>

	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			var nameInput = document.getElementById("name-input");
			var table = document.getElementById("myTable");
			var rows = table.getElementsByTagName("tr");

			nameInput.addEventListener("input", function() {
				var query = nameInput.value.trim().toLowerCase();
				var noDataFound = true;

				for (var i = 1; i < rows.length; i++) {
					var usernameCell = rows[i].getElementsByTagName("td")[0];
					var emailCell = rows[i].getElementsByTagName("td")[1];

					if (usernameCell || emailCell) {
						var usernameText = usernameCell.textContent
								|| usernameCell.innerText;
						var emailText = emailCell.textContent
								|| emailCell.innerText;

						usernameText = usernameText.toLowerCase();
						emailText = emailText.toLowerCase();

						if (usernameText.includes(query)
								|| emailText.includes(query)) {
							rows[i].style.display = "";
							noDataFound = false;
						} else {
							rows[i].style.display = "none";
						}
					}
				}

				if (noDataFound) {
					// If no data matches the input.
					var noDataRow = document.createElement("tr");
					var noDataCell = document.createElement("td");
					noDataCell.colSpan = 5;
					noDataCell.textContent = "No data found";
					noDataRow.appendChild(noDataCell);
					table.appendChild(noDataRow);
				} else {
					var noDataRows = table
							.getElementsByClassName("no-data-row");
					while (noDataRows.length > 0) {
						noDataRows[0].parentNode.removeChild(noDataRows[0]);
					}
				}
			});
		});
	</script>


</body>
</html>