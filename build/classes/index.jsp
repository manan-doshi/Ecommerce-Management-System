<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuickKart</title>
<meta name="description"
	content="Quickkart - Effortlessly manage your online store with our e-commerce system. 
Seamlessly manage products, streamline transactions, and elevate customer experiences. Secure, scalable, and optimized for success. and 
Buy products like mobiles, grocery, clothes(fashion), electronics, furniture, appliances, shoes, electronics, etc.">

<link rel="shortcut icon" href="img/logo.png" type="image/x-icon">

<!-- J-query (add-to-cart) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>

<!-- Bootstarp -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZx`x`dgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<!-- Icons  -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">

<!-- CSS Link -->

<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/footer.css">

</head>

<body>

	<div id="progress-bar"></div>

	<%
	if (session.getAttribute("uemail") == null) {
	%>
	<div id="popup" class="popup">
		<div class="popup-content">
			<a href="login.jsp"><button>LOGIN</button> <a href="signup.jsp"><p>Sign
						up</p></a>
		</div>
	</div>
	<%
	}
	%>

	<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("uemail") == null) {
	}
	%>

	<header>

		<!-- Navbar  -->

		<nav class="navbar navbar-expand-lg bg-body-tertiary"
			style="background: radial-gradient(circle 815px at 23.4% -21.8%, rgba(9, 29, 85, 1) 0.2%, rgba(0, 0, 0, 1) 100.2%);">
			<div class="container-fluid">
				<img src="img/logo.png"> <a class="navbar-brand"
					style="color: white;" href="#">Quick<i
					class='bx bxs-shopping-bags bx-tada'
					style='color: #01a1fe; margin-top: 5px'></i>Kart
				</a>
				<button class="navbar-toggler" style="background-color: white;"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" style="color: white;" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<%
								if (session.getAttribute("uemail") == null) {
								%> Account <%
								} else {
								String name = (String) session.getAttribute("uname");
								String capitalizedName = name.substring(0, 1).toUpperCase() + name.substring(1);
								%> Hello <%=capitalizedName%> <%
 }
 %>
						</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="coupon.jsp">Coupons</a></li>
								<li><a class="dropdown-item" href="about_us.jsp">About
										Us</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="contact_us.jsp">Contact
										Us</a></li>
							</ul></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="text" id="searchInput"
							onkeyup="searchFun()" placeholder="Search for Products"
							aria-label="Search">

						<button type="button" onclick="scrollToProduct()"
							class="btn btn-outline-light">Search</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</form>




					<%
					if (session.getAttribute("uemail") != null) {
					%>
					<a class="nav-items"> <a class="nav-link"
						href="./show_cart_products.jsp" data-toggle="model"
						data-target="#cart"> <i class='bx bxs-cart-alt bx-tada'
							style="color: white; font-size: 1.8rem; cursor: pointer; margin-right: 70px"></i>
							<span class="cart-items"
							style="color: rgba(255, 255, 255, 0.75); margin-right: 18px; position: absolute; bottom: 32px; right: 119px">(
								4 )</span></a>
					</a>
					<%
					} else {
					%>
					<a class="nav-items"> <a class="nav-link-cart" href="#"
						data-toggle="model" data-target="#cart" onclick="doLogin()"> <i
							class='bx bxs-cart-alt bx-tada'
							style="color: white; font-size: 1.8rem; cursor: pointer; margin-right: 44px"></i></a>
					</a>
					<%
					}
					%>

					<%
					if (session.getAttribute("uemail") == null) {
					%>
					<span class="button"> <a class="btn btn-outline-light"
						style="align-items: center;" href="login.jsp" role="button">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</span>
					<%
					} else {
					%>

					<form action="./Logout" method="post">
						<input type="submit" value="Logout"
							class="logout_btn btn btn-outline-light">
					</form>

					<%
					}
					%>
				</div>
			</div>
		</nav>
	</header>

	<div class="no-items-found-message" style="display: none;">
		<img alt="No Result Found" src="img/no_result.png">
	</div>



	<!-- down to top button -->

	<button id="scrollButton" class="hidden">
		<i class="fa-solid fa-angle-up"
			style="color: #ffffff; font-size: 30px; margin-top: 4px"></i>
	</button>



	<!-- All Product Categories  -->
	<div class="dataa">
		<div class="category">
			<div class="container">
				<div class="category-item-container has-scrollbar">
					<%
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

					Statement smt = connection.createStatement();
					ResultSet ResultSet = smt.executeQuery("SELECT * FROM PRODUCT_CATEGORIES order by category_id");
					while (ResultSet.next()) {

						int id = ResultSet.getInt("category_id");
						String name = ResultSet.getString("name");
						String images = ResultSet.getString("images");
						int count = ResultSet.getInt("count");
				%>
					<div class="category-item">
						<div class="category-img-box">
							<img src="img/<%=images%>" alt="category1" width="45" height="55">
						</div>
						<div class="category-content-box">
							<div class="category-content-flex">
								<h3 class="category-item-title"><%=name%></h3>
								<p class="category-item-amount">
									(<%=count%>)
								</p>
							</div>
							<a href="#<%=name%>" class="category-btn">Show All</a>
						</div>
					</div>
					<%
				}
				} catch (Exception e) {
				out.println(e);
				System.out.println(e);
				}
				%>

				</div>
			</div>
		</div>

		<!-- Banner Slider Advertisement Banner (Auto slider)-->



		<div class="banner">
			<div class="container">
				<div class="slider-container has-scrollbar">

					<div class="prev-button">
						<i class="fa-solid fa-chevron-left" style="margin-left: 14px;"></i>
					</div>
					<div class="slider-item">
						<img src="img/banner1.png" alt="women's latest fashion sale"
							class="banner-img">
						<div class="banner-content">
							<p class="banner-subtitle">SAMSUNG</p>
							<h2 class="banner-title">SAMSUNG Galaxy S22 Ultra 5G</h2>
							<p class="banner-text">
								<i class='bx bx-rupee' style="font-size: 23px;"></i><b>85,300
									- <i class='bx bx-rupee bx-tada' style="font-size: 23px;"></i>3099
									Instant Discount*
								</b>
							</p>
							<a href="product_desc.jsp?id=10" class="banner-btn">Shop now</a>
						</div>
					</div>

					<div class="slider-item">
						<img src="img/banner2.png" alt="modern sunglasses"
							class="banner-img">
						<div class="banner-content">
							<p class="banner-subtitle">India Ka Furniture Store</p>
							<h2 class="banner-title">Living Room Furniture Sale</h2>
							<p class="banner-text">
								Upto <i class='bx bx-rupee bx-tada' style="font-size: 23px;"></i><b>50%
									OFF - Limited time only.</b>
							</p>
							<a href="product_desc.jsp?id=51" class="banner-btn">Shop now</a>
						</div>
					</div>

					<div class="slider-item">
						<img src="img/banner3.png" alt="new fashion summer sale"
							class="banner-img">
						<div class="banner-content">
							<p class="banner-subtitle color">Toys and Games</p>
							<h2 class="banner-title">PLAY | LEARN | CREATE - Trending
								toys</h2>
							<p class="banner-text color">
								From <i class='bx bx-rupee bx-tada' style="font-size: 23px;"></i><b>399</b>
							</p>
							<a href="#" class="banner-btn">Shop now</a>
						</div>
					</div>

					<div class="slider-item">
						<img src="img/banner4.png" alt="new fashion summer sale"
							class="banner-img">
						<div class="banner-content">
							<p class="banner-subtitle">Men's & Women's Fashion</p>
							<h2 class="banner-title">SEASON SALE! UPTO 60% OFF</h2>
							<p class="banner-text">
								New arrival fashion <b>SALE*</b>
							</p>
							<a href="product_desc.jsp?id=24" class="banner-btn">Shop now</a>
						</div>
					</div>

					<div class="slider-item">
						<img src="img/banner5.png" alt="new fashion summer sale"
							class="banner-img">
						<div class="banner-content">
							<p class="banner-subtitle colors">Kitchen and Dining</p>
							<h2 class="banner-title">Kitchen, Cookware & Serveware</h2>
							<p class="banner-text colors">
								starting at just <i class='bx bx-rupee bx-tada'
									style="font-size: 23px;"></i><b>250</b>
							</p>
							<a href="product_desc.jsp?id=46" class="banner-btn">Shop now</a>
						</div>
					</div>
					<div class="next-button">
						<i class="fa-solid fa-chevron-right" style="margin-right: 12px;"></i>
					</div>
				</div>
			</div>
		</div>

		<div class="product mobile"
			data-names="mobile,mobiles,poco,redmi,infinix,samsung,oneplus,vivo,apple,iphone,POCO C51,Redmi 9A Sport,Infinix SMART 7,SAMSUNG Galaxy M14 5G,OnePlus Nord CE 2 Lite 5G,SAMSUNG Galaxy A14 5G,POCO X5 Pro 5G,SAMSUNG Galaxy S22 5G,SAMSUNG Galaxy S22 Ultra,SAMSUNG Galaxy S23 Ultra,Vivo X90,OnePlus 11R 5G,APPLE IPhone 13,APPLE IPhone 14 Pro,APPLE IPhone 14 Pro Max">

			<!-- label - mobile -->

			<div class="container">
				<section class="shop containerr" id="Mobiles">
					<div id="section-title">Smartphones & Premium Mobiles</div>
			</div>

		</div>
		<!-- content  -->
		<div class="shop-content container">
			<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

			Statement smtt = con.createStatement();
			ResultSet Rs = smtt
			.executeQuery("select * from admin_add_products where categories='mobiles' and price <=30000 order by id");
			while (Rs.next()) {

				int discount = Rs.getInt("discount");
				String name = Rs.getString("name");
				String images = Rs.getString("images");
				int price = Rs.getInt("price");
				int id = Rs.getInt("id");
				String categories=Rs.getString("categories");
				int stock =Rs.getInt("stock");
		%>

			<div class="product-box">
				<a href="product_desc.jsp?id=<%=id%>"> <img
					src="products_img/<%=images%>" width="200px" class="product-img"
					alt="<%=name%>">
				</a>
				<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
				</h5>
				<div class="price">
					<i class='bx bx-rupee'></i><%=price%>
					<span id="discount"><%=discount%>%off</span>
				</div>
				<%
			if (session.getAttribute("uemail") != null) {
			%>
				<button class="add-cart"
					onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>, <%=stock%>)">Add
					to Cart</button>
				<%
			} else {
			%>
				<button class="add-cart-disable" onclick="loginFirst()">Add
					to Cart</button>
				<%
			}
			%>
			</div>
			<%
		}
		} catch (Exception e) {
		out.println(e);
		System.out.println(e);
		}
		%>
		</div>
		</section>



		<!-- Label-2 premium mobile -->
		<section class="shop containerrr">
			<div class="shop-content container">

				<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

				Statement smtt = con.createStatement();
				ResultSet Rs = smtt
				.executeQuery("select * from admin_add_products where categories='mobiles' and price>30000 order by id");
				while (Rs.next()) {

					int discount = Rs.getInt("discount");
					String name = Rs.getString("name");
					String images = Rs.getString("images");
					int price = Rs.getInt("price");
					int id = Rs.getInt("id");
					String categories=Rs.getString("categories");
					int stock =Rs.getInt("stock");
			%>

				<div class="product-box">
					<a href="product_desc.jsp?id=<%=id%>"> <img
						src="products_img/<%=images%>" width="200px" class="product-img"
						alt="<%=name%>">
					</a>
					<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
					</h5>
					<div class="price">
						<i class='bx bx-rupee'></i><%=price%>
						<span id="discount"><%=discount%>%off</span>
					</div>
					<%
				if (session.getAttribute("uemail") != null) {
				%>
					<button class="add-cart"
						onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>, <%=stock%>)">Add
						to Cart</button>
					<%
				} else {
				%>
					<button class="add-cart-disable" onclick="loginFirst()">Add
						to Cart</button>
					<%
				}
				%>
				</div>
				<%
			}
			} catch (Exception e) {
			out.println(e);
			System.out.println(e);
			}
			%>
			</div>
		</section>

		<%@include file="./show_cart_products.jsp"%>

		<!-- HDFC and ICICI Offer -->
		<div class="container">
			<div class="offer-image">
				<a href="offer.jsp"><img src="img/offer.png" class="img-fluid"
					alt="..."></a>
			</div>
		</div>


		<div class="product grocery"
			data-names="grocery,oil,ghee,atta,biscuits,handwash,creame,Fortune Rice Bran Oil,Amul Ghee,Fortune Chakki Atta,BRITANNIA Biscuits,Godrej Hand Wash,DOVE CREAM BEAUTY">


			<!-- label - grocery -->
			<div class="container" id="grocery">
				<section class="shop containerr" id="Grocery">
					<div id="section-title">Grocery - Food Essentials & Personal
						Care</div>
			</div>
		</div>
		<!-- content  -->
		<div class="shop-content container">
			<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

			Statement smtt = con.createStatement();
			ResultSet Rs = smtt.executeQuery("select * from admin_add_products where categories='grocery' order by id");
			while (Rs.next()) {

				int discount = Rs.getInt("discount");
				String name = Rs.getString("name");
				String images = Rs.getString("images");
				int price = Rs.getInt("price");
				int id = Rs.getInt("id");
				String categories=Rs.getString("categories");
		%>

			<div class="product-box">
				<a href="product_desc.jsp?id=<%=id%>"> <img
					src="products_img/<%=images%>" width="200px" class="product-img"
					alt="<%=name%>">
				</a>
				<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
				</h5>
				<div class="price">
					<i class='bx bx-rupee'></i><%=price%>
					<span id="discount"><%=discount%>%off</span>
				</div>
				<%
			if (session.getAttribute("uemail") != null) {
			%>
				<button class="add-cart"
					onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
					to Cart</button>
				<%
			} else {
			%>
				<button class="add-cart-disable" onclick="loginFirst()">Add
					to Cart</button>
				<%
			}
			%>
			</div>
			<%
		}
		} catch (Exception e) {
		out.println(e);
		System.out.println(e);
		}
		%>
		</div>
		</section>


		<div class="product fashion"
			data-names="fashion,t-shirt,tshirt,shirt,trouser,top,shorts,kurta,suit,men cotton red t-Shirt,men slim fit casual shirt,men black cotton trousers,casual women black top,women black shorts,printed women jumpsuit,women pure cotton kurta,salwar suit material printed">

			<!-- label - fashion -->
			<div class="container">
				<section class="shop containerr" id="Fashion (Men's & Women's)">
					<div id="section-title">Fashion (Men's & Women's)</div>
			</div>
		</div>
		<!-- content  -->
		<div class="shop-content container">
			<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

			Statement smtt = con.createStatement();
			ResultSet Rs = smtt.executeQuery("select * from admin_add_products where categories='fashion' order by id");
			while (Rs.next()) {

				int discount = Rs.getInt("discount");
				String name = Rs.getString("name");
				String images = Rs.getString("images");
				int price = Rs.getInt("price");
				int id = Rs.getInt("id");
				String categories=Rs.getString("categories");
		%>

			<div class="product-box">
				<a href="product_desc.jsp?id=<%=id%>"> <img
					src="products_img/<%=images%>" width="200px" class="product-img"
					alt="<%=name%>">
				</a>
				<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
				</h5>
				<div class="price">
					<i class='bx bx-rupee'></i><%=price%>
					<span id="discount"><%=discount%>%off</span>
				</div>
				<%
			if (session.getAttribute("uemail") != null) {
			%>
				<button class="add-cart"
					onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
					to Cart</button>
				<%
			} else {
			%>
				<button class="add-cart-disable" onclick="loginFirst()">Add
					to Cart</button>
				<%
			}
			%>
			</div>
			<%
		}
		} catch (Exception e) {
		out.println(e);
		System.out.println(e);
		}
		%>
		</div>
		</section>


		<div class="product eletronics"
			data-names="electronics,buds,buds pro,smartwatch,headset,headphone,laptop,hp laptop,hp,lenovo,lenovo laptop,apple ipad,ipad,monitor,camera,dslr,printer,Blood Pressure Machine,Truke Buds Q1+,OnePlus Buds Pro 2,SONY SRS-XB100,MARCRAZY M4 Smart Watch,Pebble Evolve Bluetooth Headset,Blood Pressure Machine Bp Monitor,HP Laptop Core I3,Lenovo IdeaPad,APPLE IPad,LG 27inch WQHD LED Monitor,HP Printer Laser Jet WiFi,Canon EOS 3000D DSLR">

			<!-- label - eletronics -->
			<div class="container">
				<section class="shop containerr" id="Electronics">
					<div id="section-title">Electronics Item</div>
			</div>
		</div>
		<!-- content  -->
		<div class="shop-content container">
			<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

			Statement smtt = con.createStatement();
			ResultSet Rs = smtt.executeQuery(
			"select * from admin_add_products where categories='electronics' and price<20000 order by id");
			while (Rs.next()) {

				int discount = Rs.getInt("discount");
				String name = Rs.getString("name");
				String images = Rs.getString("images");
				int price = Rs.getInt("price");
				int id = Rs.getInt("id");
				String categories=Rs.getString("categories");
		%>

			<div class="product-box">
				<a href="product_desc.jsp?id=<%=id%>"> <img
					src="products_img/<%=images%>" width="200px" class="products-img"
					alt="<%=name%>">
				</a>
				<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
				</h5>
				<div class="price">
					<i class='bx bx-rupee'></i><%=price%>
					<span id="discount"><%=discount%>%off</span>
				</div>
				<%
			if (session.getAttribute("uemail") != null) {
			%>
				<button class="add-cart"
					onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
					to Cart</button>
				<%
			} else {
			%>
				<button class="add-cart-disable" onclick="loginFirst()">Add
					to Cart</button>
				<%
			}
			%>
			</div>
			<%
		}
		} catch (Exception e) {
		out.println(e);
		System.out.println(e);
		}
		%>
		</div>
		</section>


		<section class="shop containerrr">
			<div class="shop-content container">
				<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

				Statement smtt = con.createStatement();
				ResultSet Rs = smtt.executeQuery(
				"select * from admin_add_products where categories='electronics' and price>20000 order by id");
				while (Rs.next()) {

					int discount = Rs.getInt("discount");
					String name = Rs.getString("name");
					String images = Rs.getString("images");
					int price = Rs.getInt("price");
					int id = Rs.getInt("id");
					String categories=Rs.getString("categories");
			%>

				<div class="product-box">
					<a href="product_desc.jsp?id=<%=id%>"> <img
						src="products_img/<%=images%>" width="200px" class="products-img"
						alt="<%=name%>">
					</a>
					<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
					</h5>
					<div class="price">
						<i class='bx bx-rupee'></i><%=price%>
						<span id="discount"><%=discount%>%off</span>
					</div>
					<%
				if (session.getAttribute("uemail") != null) {
				%>
					<button class="add-cart"
						onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
						to Cart</button>
					<%
				} else {
				%>
					<button class="add-cart-disable" onclick="loginFirst()">Add
						to Cart</button>
					<%
				}
				%>
				</div>
				<%
			}
			} catch (Exception e) {
			out.println(e);
			System.out.println(e);
			}
			%>
			</div>
		</section>


		<div class="product furniture"
			data-names="furniture,Pressure Cooke,Chopping Board,knife,tawa,tv,shelf,Dinner Set,Lunch Box,Recliner,bed,Limera 3 L Pressure Cooker,Kreme Flat Dosa Tawa,Chopping Board With 1 Knife,Mishna Pack Of 36 Plastic Dinner Set,Cello Puro Steel-X Benz,MILTON (3) Lunch Box,Homes Flamenco Wood Bed,Duroflex Seater Avalon Recliner,Allie Wood 4 Seater Dining Set,SNQ Wood King Size TV Unit,GOLENS Smart Digital Door Lock,Hexago Shape Wall Shelf">

			<!-- label - furniture -->

			<div class="container">
				<section class="shop containerr" id="Home & Furniture">
					<div id="section-title">Home and Furniture</div>
			</div>
		</div>
		<!-- content  -->
		<div class="shop-content container">
			<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

			Statement smtt = con.createStatement();
			ResultSet Rs = smtt.executeQuery(
			"select * from admin_add_products where categories='home & furniture' and price<1000 order by id");
			while (Rs.next()) {

				int discount = Rs.getInt("discount");
				String name = Rs.getString("name");
				String images = Rs.getString("images");
				int price = Rs.getInt("price");
				int id = Rs.getInt("id");
				String categories=Rs.getString("categories");
		%>

			<div class="product-box">
				<a href="product_desc.jsp?id=<%=id%>"> <img
					src="products_img/<%=images%>" width="200px" class="products-img"
					alt="<%=name%>">
				</a>
				<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
				</h5>
				<div class="price">
					<i class='bx bx-rupee'></i><%=price%>
					<span id="discount"><%=discount%>%off</span>
				</div>
				<%
			if (session.getAttribute("uemail") != null) {
			%>
				<button class="add-cart"
					onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
					to Cart</button>
				<%
			} else {
			%>
				<button class="add-cart-disable" onclick="loginFirst()">Add
					to Cart</button>
				<%
			}
			%>
			</div>
			<%
		}
		} catch (Exception e) {
		out.println(e);
		System.out.println(e);
		}
		%>
		</div>
		</section>


		<section class="shop containerrr">
			<div class="shop-content container">
				<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

				Statement smtt = con.createStatement();
				ResultSet Rs = smtt.executeQuery(
				"select * from admin_add_products where categories='home & furniture' and price>1000 order by id");
				while (Rs.next()) {

					int discount = Rs.getInt("discount");
					String name = Rs.getString("name");
					String images = Rs.getString("images");
					int price = Rs.getInt("price");
					int id = Rs.getInt("id");
					String categories=Rs.getString("categories");
			%>

				<div class="product-box">
					<a href="product_desc.jsp?id=<%=id%>"> <img
						src="products_img/<%=images%>" width="200px" class="products-img"
						alt="<%=name%>">
					</a>
					<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
					</h5>
					<div class="price">
						<i class='bx bx-rupee'></i><%=price%>
						<span id="discount"><%=discount%>%off</span>
					</div>
					<%
				if (session.getAttribute("uemail") != null) {
				%>
					<button class="add-cart"
						onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
						to Cart</button>
					<%
				} else {
				%>
					<button class="add-cart-disable" onclick="loginFirst()">Add
						to Cart</button>
					<%
				}
				%>
				</div>
				<%
			}
			} catch (Exception e) {
			out.println(e);
			System.out.println(e);
			}
			%>
			</div>
		</section>


		<div class="product appliances"
			data-names="appliances,Grinder,mixer Grinder,cooktop,iron,Microwave Oven,oven,Washing Machine,Refrigerator,ac,Prestige Atlas Neo Cooktop,PowerChef 500 W Mixer Grinder,Electric Egg Boiler Egg Cooker,Crompton 1000 W Dry Iron,Panasonic 20 L Microwave Oven,SONY(55-Inch) Ultra HD ,LG 7 Kg Washing Machine,SAMSUNG 301L Refrigerator,LG Dual Inverter HD Filter AC,Blue Star 1 Ton Portable AC">

			<!-- label - Appliances -->

			<div class="container">
				<section class="shop containerr" id="Appliances">
					<div id="section-title">Appliances (Next-gen Tech for a
						Smarter Home)</div>
			</div>
		</div>
		<!-- content  -->
		<div class="shop-content container">
			<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

			Statement smtt = con.createStatement();
			ResultSet Rs = smtt
			.executeQuery("select * from admin_add_products where categories='appliances' and price<=5000 order by id");
			while (Rs.next()) {

				int discount = Rs.getInt("discount");
				String name = Rs.getString("name");
				String images = Rs.getString("images");
				int price = Rs.getInt("price");
				int id = Rs.getInt("id");
				String categories=Rs.getString("categories");
		%>

			<div class="product-box">
				<a href="product_desc.jsp?id=<%=id%>"> <img
					src="products_img/<%=images%>" width="200px" class="products-img"
					alt="<%=name%>">
				</a>
				<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
				</h5>
				<div class="price">
					<i class='bx bx-rupee'></i><%=price%>
					<span id="discount"><%=discount%>%off</span>
				</div>
				<%
			if (session.getAttribute("uemail") != null) {
			%>
				<button class="add-cart"
					onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
					to Cart</button>
				<%
			} else {
			%>
				<button class="add-cart-disable" onclick="loginFirst()">Add
					to Cart</button>
				<%
			}
			%>
			</div>
			<%
		}
		} catch (Exception e) {
		out.println(e);
		System.out.println(e);
		}
		%>
		</div>
		</section>

		<section class="shop containerrr">
			<div class="shop-content container">
				<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

				Statement smtt = con.createStatement();
				ResultSet Rs = smtt
				.executeQuery("select * from admin_add_products where categories='appliances' and price>5000 order by id");
				while (Rs.next()) {

					int discount = Rs.getInt("discount");
					String name = Rs.getString("name");
					String images = Rs.getString("images");
					int price = Rs.getInt("price");
					int id = Rs.getInt("id");
					String categories=Rs.getString("categories");
			%>

				<div class="product-box">
					<a href="product_desc.jsp?id=<%=id%>"> <img
						src="products_img/<%=images%>" width="200px" class="products-img"
						alt="<%=name%>">
					</a>
					<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
					</h5>
					<div class="price">
						<i class='bx bx-rupee'></i><%=price%>
						<span id="discount"><%=discount%>%off</span>
					</div>
					<%
				if (session.getAttribute("uemail") != null) {
				%>
					<button class="add-cart"
						onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
						to Cart</button>
					<%
				} else {
				%>
					<button class="add-cart-disable" onclick="loginFirst()">Add
						to Cart</button>
					<%
				}
				%>
				</div>
				<%
			}
			} catch (Exception e) {
			out.println(e);
			System.out.println(e);
			}
			%>
			</div>
		</section>


		<div class="product footwear"
			data-names="footwear,sandal,Sneakers,Slippers,shoes,Men Olive Clogs Sandal,Nike Bolt Sneakers,PUMA Slippers,CozySock 2.0 Shoes,Women Tan Flats Sandal,Women Copper Heels Sandal">

			<!-- label - Footwear -->

			<div class="container">
				<section class="shop containerr" id="Shoes">
					<div id="section-title">Men's & Women's Footwear</div>
			</div>
		</div>
		<!-- content  -->
		<div class="shop-content container">
			<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

			Statement smtt = con.createStatement();
			ResultSet Rs = smtt.executeQuery("select * from admin_add_products where categories='footwear' order by id");
			while (Rs.next()) {

				int discount = Rs.getInt("discount");
				String name = Rs.getString("name");
				String images = Rs.getString("images");
				int price = Rs.getInt("price");
				int id = Rs.getInt("id");
				String categories=Rs.getString("categories");
		%>

			<div class="product-box">
				<a href="product_desc.jsp?id=<%=id%>"> <img
					src="products_img/<%=images%>" width="200px" class="productss-img"
					alt="<%=name%>">
				</a>
				<h5 class="product-title"><%=name%><div style="display: none"><%=categories%></div>
				</h5>
				<div class="price">
					<i class='bx bx-rupee'></i><%=price%>
					<span id="discount"><%=discount%>%off</span>
				</div>
				<%
			if (session.getAttribute("uemail") != null) {
			%>
				<button class="add-cart"
					onclick="add_to_cart(<%=id%>, '<%=name%>', <%=price%>)">Add
					to Cart</button>
				<%
			} else {
			%>
				<button class="add-cart-disable" onclick="loginFirst()">Add
					to Cart</button>
				<%
			}
			%>
			</div>
			<%
		}
		} catch (Exception e) {
		out.println(e);
		System.out.println(e);
		}
		%>
		</div>
		</section>

		<!-- Footer -->

		<footer>

			<div class="footer-category">

				<div class="container">

					<h2 class="footer-category-title">Brand directory</h2>

					<div class="footer-category-box">
						<h3 class="category-box-title">Grocery :</h3>
						<a href="#" class="footer-category-link">fortune oil</a> <a
							href="#" class="footer-category-link">ghee</a> <a href="#"
							class="footer-category-link">fortune atta</a> <a href="#"
							class="footer-category-link">biscuits</a> <a href="#"
							class="footer-category-link">hand wash</a> <a href="#"
							class="footer-category-link">soap</a> <a href="#"
							class="footer-category-link">eggs</a>
					</div>

					<div class="footer-category-box">
						<h3 class="category-box-title">Mobiles :</h3>
						<a href="#" class="footer-category-link">samsung</a> <a href="#"
							class="footer-category-link">apple</a> <a href="#"
							class="footer-category-link">vivo</a> <a href="#"
							class="footer-category-link">oppo</a> <a href="#"
							class="footer-category-link">oneplus</a> <a href="#"
							class="footer-category-link">redmi</a> <a href="#"
							class="footer-category-link">infinix</a> <a href="#"
							class="footer-category-link">poco</a>
					</div>

					<div class="footer-category-box">
						<h3 class="category-box-title">Fashion :</h3>
						<a href="#" class="footer-category-link">men's t-shirt</a> <a
							href="#" class="footer-category-link">shirt</a> <a href="#"
							class="footer-category-link">Hoodie tshirts for men</a> <a
							href="#" class="footer-category-link">pant</a> <a href="#"
							class="footer-category-link">women's designer kurtis</a> <a
							href="#" class="footer-category-link">shorts</a> <a href="#"
							class="footer-category-link">ethnic wear</a> <a href="#"
							class="footer-category-link">dresses</a> <a href="#"
							class="footer-category-link">jumpsuit</a>
					</div>

					<div class="footer-category-box">
						<h3 class="category-box-title">Electronic :</h3>
						<a href="#" class="footer-category-link">laptop</a> <a href="#"
							class="footer-category-link">computer (PC)</a> <a href="#"
							class="footer-category-link">tablet</a> <a href="#"
							class="footer-category-link">printer</a> <a href="#"
							class="footer-category-link">camera</a> <a href="#"
							class="footer-category-link">earbuds</a> <a href="#"
							class="footer-category-link">speaker</a> <a href="#"
							class="footer-category-link">headphones</a> <a href="#"
							class="footer-category-link">watches</a> <a href="#"
							class="footer-category-link">bp monitor</a>
					</div>

					<div class="footer-category-box">
						<h3 class="category-box-title">home and furniture :</h3>
						<a href="#" class="footer-category-link">furniture</a> <a href="#"
							class="footer-category-link">bed</a> <a href="#"
							class="footer-category-link">sofa</a> <a href="#"
							class="footer-category-link">tv unit</a> <a href="#"
							class="footer-category-link">wall (decor)</a> <a href="#"
							class="footer-category-link">home: </a> <a href="#"
							class="footer-category-link">pressure cooker</a> <a href="#"
							class="footer-category-link">tawa</a> <a href="#"
							class="footer-category-link">bottles</a> <a href="#"
							class="footer-category-link">lunch box</a>
					</div>

					<div class="footer-category-box">
						<h3 class="category-box-title">appliances :</h3>
						<a href="#" class="footer-category-link">sony tv</a> <a href="#"
							class="footer-category-link">washine machine</a> <a href="#"
							class="footer-category-link">refrigerator</a> <a href="#"
							class="footer-category-link">AC</a> <a href="#"
							class="footer-category-link">portable ac</a> <a href="#"
							class="footer-category-link">iron</a> <a href="#"
							class="footer-category-link">egg boiler</a> <a href="#"
							class="footer-category-link">mixer</a> <a href="#"
							class="footer-category-link">oven</a>
					</div>

					<div class="footer-category-box">
						<h3 class="category-box-title">footwear :</h3>
						<a href="#" class="footer-category-link">sport</a> <a href="#"
							class="footer-category-link">formal</a> <a href="#"
							class="footer-category-link">Boots</a> <a href="#"
							class="footer-category-link">casual</a> <a href="#"
							class="footer-category-link">safety shoes</a> <a href="#"
							class="footer-category-link">Party wear shoes</a> <a href="#"
							class="footer-category-link">Branded</a> <a href="#"
							class="footer-category-link">Firstcopy</a>
					</div>

				</div>

			</div>

			<div class="footer-nav">

				<div class="container">

					<ul class="footer-nav-list">

						<li class="footer-nav-item">
							<h2 class="nav-title">Popular Categories</h2>
						</li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Fashion</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Electronic</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Appliances</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Grocery</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Footwear</a></li>

					</ul>

					<ul class="footer-nav-list">

						<li class="footer-nav-item">
							<h2 class="nav-title">Products</h2>
						</li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Prices drop</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">New products</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Best sales</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Additional discounts</a></li>

					</ul>

					<ul class="footer-nav-list">

						<li class="footer-nav-item">
							<h2 class="nav-title">Services</h2>
						</li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Prices drop</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Premium quality</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">New products</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Best sales</a></li>

						<li class="footer-nav-item"><a href="#"
							class="footer-nav-link">Easy Return</a></li>

					</ul>
					<ul class="footer-nav-list">
						<li class="footer-nav-item">
							<h2 class="nav-title">Contact us</h2>
						</li>
						<li class="footer-nav-item"><a href="./contact_us.jsp"
							class="footer-nav-link">Contact Us</a></li>

						<!-- <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">+91 7046448720</a>
          </li> -->
						<li class="footer-nav-item"><a href="#"
							class="footer-nav-llink">quickkart@gmail.com</a></li>
						<li class="footer-nav-item flex"><a href="tel:+7046448720"
							class="footer-nav-link">+91 7046448720</a></li>

					</ul>

					<ul class="footer-nav-list">

						<li class="footer-nav-item">
							<h2 class="nav-title">Social (Connect With Us)</h2>
						</li>
						<li class="footer-nav-item"><a
							href="https://www.instagram.com/" class="footer-nav-link">Instagram</a>
						</li>
						<li class="footer-nav-item"><a
							href="https://www.facebook.com/" class="footer-nav-link">Facebook</a>
						</li>
						<li class="footer-nav-item"><a href="https://twitter.com/"
							class="footer-nav-link">Twitter</a></li>
					</ul>

					<ul class="footer-nav-list">
					</ul>
					</li>

					</ul>

				</div>

			</div>

			<div class="footer-bottom">
				<div class="container">
					<p class="copyright">
						&copy; <a href="#">QuickKart</a> all rights reserved.
					</p>
				</div>
			</div>
		</footer>

		<script src="js/home.js"></script>
		<script type="js/product_cart.js"></script>
	</div>
</body>

</html>