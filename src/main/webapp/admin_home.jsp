
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>
<link rel="shortcut icon" href="img/admin.png" type="image/x-icon">
<link rel="stylesheet" href="css/admin_home.css">
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
			<div class="admin_name">
				<%
				String name = (String) session.getAttribute("u_name");
				String capitalizedName = (name != null && !name.isEmpty())
						? name.substring(0, 1).toUpperCase() + name.substring(1)
						: "Guest";
				%>
				Hello
				<%=capitalizedName%>
			</div>

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
							href="#"><i class="fa-solid fa-cart-shopping"
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

		<div id="input-container" style="text-align: center;">
			<input type="text" id="name-input" placeholder="Enter name or email">
			<button onclick="downloadExcel()"
				style="background: rgb(32, 45, 58) 81.3%;">Export Order
				Data</button>
		</div>

		<table id="table">
			<thead>
				<tr style="text-align: center;">
					<th>Customer Name</th>
					<th>Product Name</th>
					<th>Product Price</th>
					<th>Product Quantity</th>
					<th>Payment Method</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>State</th>
					<th>City</th>
					<th>Pin Code</th>
					<th>Address</th>
					<th>Remove</th>
				</tr>
			</thead>

			<tbody>
				<%
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

					Statement st = con.createStatement();
					String sql = "SELECT * FROM customer_order_confirm WHERE email IN "
					+ "(SELECT DISTINCT email FROM customer_order_confirm)";
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
						String product_name = rs.getString("product_name");
						int product_price = rs.getInt("product_price");
						int product_quantity = rs.getInt("product_quantity");
						String paymentoption = rs.getString("paymentoption");
						String customer_name = rs.getString("customer_name");
						String email = rs.getString("email");
						Long phone_number = Long.parseLong(rs.getString("phone_number"));
						String state = rs.getString("state");
						String city = rs.getString("city");
						String pin_code = rs.getString("pin_code");
						String address = rs.getString("address");
				%>

				<tr>
					<td><%=customer_name%></td>
					<td><%=product_name%></td>
					<td><%=product_price%></td>
					<td><%=product_quantity%></td>
					<td><%=paymentoption%></td>
					<td><%=email%></td>
					<td><%=phone_number%></td>
					<td><%=state%></td>
					<td><%=city%></td>
					<td><%=pin_code%></td>
					<td><%=address%></td>
					<form action="./Admin_home_remove" method="post"
						onsubmit="return myFunction()">
						<td style="text-align: center"><input type="hidden"
							name="product_name" value="<%=product_name%>"> <input
							id="button1" type="submit" value="Remove"></td>
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
			if (confirm("Are you sure you want to remove this customer order details?")) {
				return true;
			} else {
				return false;
			}
		}
	</script>

	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			var nameInput = document.getElementById("name-input");
			var table = document.getElementById("table");
			var rows = table.getElementsByTagName("tr");

			nameInput.addEventListener("input", function() {
				var query = nameInput.value.trim().toLowerCase();
				var noDataFound = true;

				for (var i = 1; i < rows.length; i++) {
					var usernameCell = rows[i].getElementsByTagName("td")[0];
					var emailCell = rows[i].getElementsByTagName("td")[5]; 

					if (usernameCell && emailCell) {
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

				// Remove any existing "No data found" rows
				var noDataRows = table.getElementsByClassName("no-data-row");
				while (noDataRows.length > 0) {
					noDataRows[0].parentNode.removeChild(noDataRows[0]);
				}
				if (noDataFound) {
					// If no data matches the input, add a "No data found" row.
					var noDataRow = document.createElement("tr");
					var noDataCell = document.createElement("td");
					noDataCell.colSpan = 12; // Adjust the colspan to match the number of columns
					noDataCell.textContent = "No data found";
					noDataRow.appendChild(noDataCell);
					noDataRow.classList.add("no-data-row"); // Add a class to identify this row
					table.appendChild(noDataRow);
				}
			});
		});
	</script>

	<script>
        function downloadExcel() {
            const table = document.getElementById('table');
            const rows = table.querySelectorAll('tr');
            const data = [];

            const headerRow = rows[0].querySelectorAll('th');
            const headerData = [];
            for (let i = 0; i < headerRow.length; i++) {
                headerData.push(headerRow[i].textContent);
            }
            data.push(headerData);

            for (let i = 1; i < rows.length; i++) {
                const cols = rows[i].querySelectorAll('td');
                const rowData = [];
                for (let j = 0; j < cols.length; j++) {
                    rowData.push(cols[j].textContent);
                }
                data.push(rowData);
            }

            const csvContent = "data:text/csv;charset=utf-8,"
                + data.map(e => e.join(",")).join("\n");

            const encodedUri = encodeURI(csvContent);
            const link = document.createElement("a");
            link.setAttribute("href", encodedUri);
            link.setAttribute("download", "Quickkart_orders.csv");
            document.body.appendChild(link);
            link.click();
        }
    </script>

</body>
</html>