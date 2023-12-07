<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel - Customer Survey Details</title>
<link rel="shortcut icon" href="img/admin.png" type="image/x-icon">
<link rel="stylesheet" href="css/admin_survey.css">

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
			<div class="admin_name">Customer Experience Survey</div>

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
		<h2></h2>
		<table id="table">
			<thead>
				<tr style="text-align: center; font-size: 17px;">
					<th>Email</th>
					<th>Contact number</th>
					<th>Categories</th>
					<th>Future categories</th>
					<th>Technical issue</th>
					<th>Shopping experience</th>
					<th>Suggestions</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM customer_survey");
		while (rs.next()) {
			String email = rs.getString("email");
			Long mobile_number = Long.parseLong(rs.getString("mobile_number"));
			String categories = rs.getString("categories");
			String future_categories = rs.getString("future_categories");
			String technical_issue = rs.getString("technical_issue");
			String experience = rs.getString("experience");
			String suggestion = rs.getString("suggestion");
	%>

				<tr>
					<td><%=email%></td>
					<td><%=mobile_number%></td>
					<td><%=categories%></td>
					<td><%=future_categories%></td>
					<td><%=technical_issue%></td>
					<td><%=experience%></td>
					<td><%=suggestion%></td>
					<form action="./Admin_survey_remove" method="post"
						onsubmit="return myFunction()">
						<td style="text-align: center"><input type="hidden"
							name="email" value="<%=email%>"> <input id="button1"
							type="submit" value="Remove"></td>
					</form>
				</tr>
				<%
	}
	} catch (Exception e) {
	out.println(e);
	}
	%>
			</tbody>
		</table>
	</div>

	<script>
		function myFunction() {
			if (confirm("Are you sure you want to remove this product?")) {
				// The user clicked "OK" in the confirmation dialog, proceed with deletion
				return true;
			} else {
				// The user clicked "Cancel" in the confirmation dialog, do not proceed with deletion
				return false;
			}
		}
	</script>
</body>
</html>