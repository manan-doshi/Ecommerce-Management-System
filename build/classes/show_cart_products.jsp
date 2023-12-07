<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<title>Shopping Cart | QuickKart.com</title>
<link rel="shortcut icon" href="img/logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/show_cart_products.css">
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


	<div class="ccontainer">

		<div class="modal" tabindex="-1" role="dialog" id="cart">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content ">
					<div class="modal-header">
						<h1 class="modal-title">
							Your Shopping Cart <i class='bx bxs-cart-download bx-tada'></i>
						</h1>

					</div>
					<div class="modal-body">
						<div class="cart-body"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary checkout-btn check"
							onclick="emptyCart()">Empty Cart</button>

						<a href="index.jsp"><button type="button"
								class="btn btn-secondary cls " data-dismiss="modal">Continue
								Shopping</button></a>

						<button type="button" class="btn btn-primary checkout-btn check "
							onclick="goToCheckout()">Go to CheckOut</button>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/product_cart.js"></script>

</body>
</html>