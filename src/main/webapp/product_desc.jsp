<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Favicon -->
<link rel="shortcut icon" href="./images/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon" href="img/logo.png" type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap"
	rel="stylesheet" />

<!-- Icons  -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<!-- Animate On Scroll -->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

<!-- Custom StyleSheet -->
<link rel="stylesheet" href="css/product_desc.css" />

<title>QuickKart</title>
</head>

<body>
	<header>
		<div class="containerrr">
			<div id="navbar">
				<img src="img/logo.png" alt="">
				<div id="name">
					Quick<i class='bx bxs-shopping-bags bx-tada' style='color: #01a1fe'></i>Kart
				</div>
			</div>
		</div>

		<div class="page__title-area">

			<%
			int id = Integer.parseInt(request.getParameter("id"));

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

				Statement smtt = con.createStatement();
				PreparedStatement pst = con.prepareStatement("select * from admin_add_products  where id=?");
				pst.setInt(1, id);
				ResultSet rs = pst.executeQuery();
				while (rs.next()) {

					int discount = rs.getInt("discount");
					String name = rs.getString("name");
					String images = rs.getString("images");
					int price = rs.getInt("price");
					String categories = rs.getString("categories");
					String desc = rs.getString("description");
			%>

			<div class="container">
				<div class="page__title-container">
					<ul class="page__titles">
						<li><a href="./index.jsp"> <svg>
                  <use xlink:href="./img/sprite.svg#icon-home"></use>
                </svg>
						</a></li>
						<li class="page__title"><%=name%></li>
					</ul>
				</div>
			</div>
		</div>
	</header>

	<main id="main">
		<div class="container">

			<!-- Products Details -->
			<section class="section product-details__section">
				<div class="product-detail__container">
					<div class="product-detail__left">
						<div class="details__container--left">

							<div class="product__picture" id="product__picture">
								<!-- <div class="rect" id="rect"></div> -->
								<div class="picture__container">
									<img src="products_img/<%=images%>" id="pic" />
								</div>
							</div>
							<div class="zoom" id="zoom"></div>
						</div>

					</div>

					<div class="product-detail__right">
						<div class="product-detail__content">
							<h3><%=name%></h3>
							<div class="price">
								<span class="new__price">&#8377;<%=price%></span>
							</div>
							<div class="product__review">
								<div class="rating">
									<svg>
                    <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                  </svg>
									<svg>
                    <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                  </svg>
									<svg>
                    <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                  </svg>
									<svg>
                    <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                  </svg>
									<svg>
                    <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                  </svg>
								</div>
								<a href="#" class="rating__quatity">5 Star Ratings</a>
							</div>
							<p>
								<span style="color: black; font-weight: 500">Highlights</span><br>
								<%=desc%>
							</p>
							<div class="product__info-container">
								<ul class="product__info">
									<li><span>Product Type:</span> <%=categories%></li>
									<ol style="list-style-type: disc;">
										<span>Available offers:</span>
										<li>Bank Offer 10% upto &#8377; 750 off on Axis Bank
											Credit and Debit Card TransactionsT&C</li>
										<li>Bank Offer 10% Instant Discount on ICICI Bank Credit
											Card Txns, up to &#8377; 750, on orders of &#8377;5000 and
											above.</li>
										<li>Bank Offer10% Instant Discount on ICICI Bank Credit
											Card EMI Txns, up to &#8377;750, on orders of &#8377;5000 and
											above.</li>
										<li>Special PriceGet extra &#8377;3000 off (price
											inclusive of cashback/coupon).</li>
									</ol>
									<li><span>Availability:</span> <a href="#"
										class="in-stock">In Stock (247 Items)</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
		</div>

		<div class="product-detail__bottom">
			<div class="title__container tabs">

				<div class="section__titles category__titles ">
					<div class="section__title detail-btn active" data-id="description">
						<span class="dot"></span>
						<h1 class="primary__title">Description</h1>
					</div>
				</div>

				<div class="section__titles">
					<div class="section__title detail-btn" data-id="reviews">
						<span class="dot"></span>
						<h1 class="primary__title">Reviews</h1>
					</div>
				</div>

				<div class="section__titles">
					<div class="section__title detail-btn" data-id="shipping">
						<span class="dot"></span>
						<h1 class="primary__title">Shipping Details</h1>
					</div>
				</div>
			</div>
			<%
			}
			} catch (Exception e) {
			out.println(e);
			System.out.println(e);
			}
			%>

			<div class="detail__content" style="margin: 0 20px;">
				<div class="content active" id="description">
					<h2>QuickKart: The One-stop Shopping Destination</h2>
					<p>E-commerce is revolutionizing the way we all shop in India.
						Why do you want to hop from one store to another in search of the
						latest phone when you can find it on the Internet in a single
						click? Not only mobiles. QuickKart houses everything you can
						possibly imagine, from trending electronics like laptops, tablets,
						smartphones, and mobile accessories to in-vogue fashion staples
						like shoes, clothing and lifestyle accessories; from modern
						furniture like sofa sets, dining tables, and wardrobes to
						appliances that make your life easy like washing machines, TVs,
						ACs, mixer grinder juicers and other time-saving kitchen and small
						appliances; from home furnishings like cushion covers, mattresses
						and bedsheets to toys and musical instruments, we got them all
						covered. You name it, and you can stay assured about finding them
						all here. For those of you with erratic working hours, QuickKart
						is your best bet. Shop in your PJs, at night or in the wee hours
						of the morning. This e-commerce never shuts down.</p>
				</div>

				<div class="content" id="reviews">
					<h1>Customer Reviews</h1>
					<div class="rating">
						<svg>
                  <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                </svg>
						<svg>
                  <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                </svg>
						<svg>
                  <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                </svg>
						<svg>
                  <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                </svg>
						<svg>
                  <use xlink:href="./img/sprite.svg#icon-star-full"></use>
                </svg>
						<!--   <svg>
                  <use xlink:href="./img/sprite.svg#icon-star-empty"></use>
                </svg> -->
					</div>


					<div class="ratt" style="margin: 1rem 0px; font-size: 21px">
						<div class="ratt1" style="margin: 1rem 0px;">
							<h5>Ease of Use!!!</h5>
							This product is incredibly easy to use and user-friendly. I had
							no trouble setting it up.
							<p style="color: gray; font-size: 15px">Narendra Singh</p>
						</div>
						<div class="ratt2" style="margin: 1rem 0px;">
							<h5>Value For Money</h5>
							Great product for the price. It's a fantastic deal considering
							the quality.
							<p style="color: gray; font-size: 15px">Siddharth Nigam</p>
						</div>
						<div class="ratt3" style="margin: 1rem 0px;">
							<h5>Superb Quality</h5>
							The quality of this product is top-notch. It feels durable and
							well-made.
							<p style="color: gray; font-size: 15px">Abhishek Patel</p>
						</div>
						<div class="ratt4" style="margin: 1rem 0px;">
							<h5>FAB Customer Service</h5>
							I had a question about this product, and the customer service
							team was quick to assist. Great support!
							<p style="color: gray; font-size: 15px">Rohit Sharma</p>
						</div>
						<div class="ratt5" style="margin: 1rem 0px;">
							<h5>Variety Of Products!</h5>
							I appreciate the variety of options available on your website. It
							made it easy to find exactly what I was looking for.
							<p style="color: gray; font-size: 15px">Bharat Singh</p>
						</div>
					</div>


				</div>
				<div class="content" id="shipping">
					<h3>Returns Policy</h3>
					<p>You may return most new, unopened items within 30 days of
						delivery for a full refund.</p>
					<p>You should expect to receive your refund within four weeks
						of giving your package to the return shipper, however, in many
						cases you will receive a refund more quickly.</p>
					<p>If you need to return an item, simply login to your account,
						go to our contact-us page and send message or contact us via email
						or phone number. We'll notify you via e-mail of your refund once
						we've received and processed the returned item.</p>
					<h3>Shipping</h3>
					<p>we're committed to delivering your orders across India
						promptly and efficiently. We offer shipping to most locations in
						India</p>
					<p>Our shipping charges vary based on your location, order
						weight, and delivery speed.</p>
					<p>We work with trusted courier and logistics partners to
						ensure your orders are handled with care and delivered on time..</p>
				</div>
			</div>
		</div>
		</section>



		<!-- Facility Section -->
		<section class="facility__section section" id="facility">
			<div class="container">
				<div class="facility__contianer">
					<div class="facility__box">
						<div class="facility-img__container">
							<svg>
                <use xlink:href="./img/sprite.svg#icon-truck"></use>
              </svg>
						</div>
						<p>SHIPPING ACROSS INDIA</p>
					</div>

					<div class="facility__box">
						<div class="facility-img__container">
							<svg>
                <use xlink:href="./img/sprite.svg#icon-credit-card-alt"></use>
              </svg>
						</div>
						<p>100% MONEY BACK GUARANTEE</p>
					</div>

					<div class="facility__box">
						<div class="facility-img__container">
							<svg>
                <use xlink:href="./img/sprite.svg#icon-credit-card"></use>
              </svg>
						</div>
						<p>Secure Payment</p>
					</div>

					<div class="facility__box">
						<div class="facility-img__container">
							<svg>
                <use xlink:href="./img/sprite.svg#icon-headphones"></use>
              </svg>
						</div>
						<p>24/7 ONLINE SUPPORT</p>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- Go To -->

	<!-- Custom JavaScript -->
	<script src="./js/product_desc.js"></script>

</body>

</html>