<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Locale"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuickKart - Order Confirmed</title>
<link rel="shortcut icon" href="img/logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/confirm_order.css">
<link rel="stylesheet" type="text/css" href="css/print-styles.css"
	media="print">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

</head>
<body>

	<div class="jack">
		<div class="image">
			<img src="img/logo.png" alt="">
		</div>
		<nav>
			<div class="name">
				Quick<i class='bx bxs-shopping-bags bx-tada' style='color: #01a1fe'></i>Kart
			</div>
		</nav>
		<div class="buttons">
			<a href="index.jsp"><button class="btn">Back To
					Dashboard</button></a>
		</div>
	</div>

	<div class="watermark">
		<img alt="logo" src="img/watermark.png">
	</div>

	<div id="loader">
		<div class="loader-text">Please await order processing...</div>
	</div>

	<div id="pdf-only-content" style="display: none;">
		<h1>
			QUICKKART <img alt="logo" src="img/logo.png" width="35px">
		</h1>
	</div>


	<h1 style="text-decoration: none; margin-top: 15px;">
		Order Confirmation <i class="fa-solid fa-circle-check"
			style="color: #008528;"></i>
	</h1>
	<h2>Your Order Details</h2>

	<form action="your_action_servlet_or_jsp" method="post"
		style="display: none;">
		<!-- Add a form element -->
		<div class="input-box">
			<span class="details">Email</span> <input type="email" name="email"
				placeholder="Enter your Email" value="${sessionScope.uemail}"
				required>
			<div class="input-box">
				<span class="details">id</span> <input type="number" name="id"
					placeholder="Enter your id" value="${sessionScope.id}" required>
			</div>
			<input type="submit" value="Submit">
		</div>
	</form>
	<table border="1" style="margin-top: 15px">
		<tr>
			<th>Product Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total Price</th>
			<th>Final Price</th>
		</tr>
		<%
    String email = request.getParameter("email");
    int Id = (Integer) session.getAttribute("id");
    int total_price = 0;
    int discount=0;

    DecimalFormat decimalFormat = (DecimalFormat) DecimalFormat.getInstance(Locale.US);
    decimalFormat.applyPattern("#,###"); 

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

        PreparedStatement pstm = conn.prepareStatement("SELECT * FROM customer_order_confirm where id=?");
        pstm.setInt(1, Id);

        ResultSet resultSets = pstm.executeQuery();

        while (resultSets.next()) {
            String product_name = resultSets.getString("product_name");
            int product_price = resultSets.getInt("product_price");
            int product_quantity = resultSets.getInt("product_quantity");
            discount = resultSets.getInt("discount");
           // Update discount 
            int product_total_price = product_price * product_quantity;
            total_price += product_total_price;
            if(discount==0) {
            	discount+=total_price;
            }
    %>

		<tr>
			<td><%=product_name%></td>
			<td><%=decimalFormat.format(product_price)%></td>
			<td><%=product_quantity%></td>
			<td><%=decimalFormat.format(product_total_price)%></td>
			<td></td>
		</tr>
		<%
        }
    } catch (Exception e) {
        out.println(e);
        System.out.println(e);
    }
    %>
		<tr>
			<td style="font-size: 20px"><b>Total Amount</b></td>
			<td></td>
			<td></td>
			<td style="font-size: 20px; text-align: center;">&#8377;<%=decimalFormat.format(total_price)%></td>
			<td style="font-size: 20px; text-align: center;"><b>&#8377;<%=decimalFormat.format(discount)%></b></td>
			<!-- Print discount -->
		</tr>
	</table>

	<h2 style="text-align: center; font-size: 30px;">User Details</h2>

	<table style="margin-top: 13px">
		<%
		int Ids = (Integer) session.getAttribute("id");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

			PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM customer_order_confirm where id= ?");
			pstmt.setInt(1, Ids);

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) {
				String emails = resultSet.getString("email");
				String CUSTOMER_NAME = resultSet.getString("CUSTOMER_NAME");
				String ADDRESS = resultSet.getString("ADDRESS");
				String PIN_CODE = resultSet.getString("PIN_CODE");
				String STATE = resultSet.getString("STATE");
				String PAYMENTOPTION = resultSet.getString("PAYMENTOPTION");
				

				Long contact_number = Long.parseLong(resultSet.getString("phone_number"));
				String city = resultSet.getString("CITY");
		%>
		<tr>
			<td style="font-weight: 600; width: 22%;">Full Name:</td>
			<td><%=CUSTOMER_NAME%></td>
		</tr>
		<tr>
			<td style="font-weight: 600;">Email:</td>
			<td><%=emails%></td>
		</tr>
		<tr>
			<td style="font-weight: 600;">Phone Number:</td>
			<td><%=contact_number%></td>
		</tr>
		<tr>
			<td style="font-weight: 600;">City:</td>
			<td><%=city%></td>
		</tr>
		<tr>
			<td style="font-weight: 600;">State:</td>
			<td><%=STATE%></td>
		</tr>
		<tr>
			<td style="font-weight: 600;">Pin-code:</td>
			<td><%=PIN_CODE%></td>
		</tr>
		<tr>
			<td style="font-weight: 600;">Address:</td>
			<td><%=ADDRESS%></td>
		</tr>
		<tr>
			<td style="font-weight: 600;">Payment Method:</td>
			<td><%=PAYMENTOPTION%></td>
		</tr>
		<%
		}
		} catch (Exception e) {
		out.println(e);
		System.out.println(e);
		}
		%>
	</table>

	<div class="confirm" style="text-align: center;">
		<h3>"Your order has been placed successfully, Thank you for
			shopping with us at QuickKart!</h3>
	</div>

	<div class="btn">

		<button type="button" class="btn btn-primary checkout-btn check"
			onclick="printSlip()">Download Invoice</button>

		<a onclick="continueShopping()">
			<button type="button" class="btn btn-secondary cls"
				data-dismiss="modal">Continue Shopping</button>
		</a>
	</div>

	<script>
		function printSlip() {
			window.print();
		}
		function printSlip(){
	        document.getElementById("pdf-only-content").style.display = "block";

	        window.print();

	        document.getElementById("pdf-only-content").style.display = "none";
		}
	</script>



	<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        var id = '<%=Id%>';
        var loaderShownFlag = localStorage.getItem('loaderShownForId' + id);

        if (id && !loaderShownFlag) {
            document.querySelector("#loader").style.display = "block";

            localStorage.setItem('loaderShownForId' + id, 'true');

            setTimeout(function() {
                document.querySelector("#loader").style.display = "none";
            }, 3000);
        } else {
            document.querySelector("#loader").style.display = "none";
        }
    });

    function continueShopping() {
        localStorage.clear();
        window.location.replace("index.jsp");
    }
</script>



</body>
</html>