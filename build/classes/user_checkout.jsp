<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Summary | QuickKart</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="img/logo.png" type="image/x-icon">
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link
	href="sha512-W/zrbCncQnky/EzL+/AYwTtosvrM+YG/V6piQLSe2HuKS6cmbw89kjYkp3tWFn1dkWV7L1ruvJyKbLz73Vlgfg==">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="css/checkout.css">


</head>

<body>

	<!-- Navbar  -->
	<header>
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
	</header>

	<div class="container">
		<div id="fbill">
			<h2>Order Summary</h2>
			<div class="row"></div>
			<div class="col-md-6">
				<div class="cart-body"></div>
			</div>

			<div class="conn">
				<div class="checkout">
					<div class="title">Your Details</div>
					<div class="content">
						<form action="ProcessOrderServlet" id="checkout-order-form"
							method="post" onsubmit="prepareAndSubmit(event)"
							id="checkout-order-form">
							<div class="user-details">
								<div class="input-box">
									<span class="details">Full Name</span> <input type="text"
										placeholder="Enter your Name" name="customer_name" required>
								</div>
								<div class="input-box">
									<span class="details">Email</span> <input type="email"
										name="email" placeholder="Enter your Email"
										value="${sessionScope.uemail}" readonly="readonly">
								</div>
								<div class="input-box">
									<span class="details">Phone number</span> <input type="number"
										placeholder="Enter your phone number" id="phone_number"
										name="phone_number" required
										oninput="limitInputLength(this, 10)">     
								</div>
								<div class="input-box">
									<span class="details">City</span> <input type="text"
										placeholder="Enter your City" name="city" required>
								</div>

								<div class="input-box">
									<span class="details">State</span> <select id="state"
										name="state" required>
										<option value="" disabled selected>--Select your
											state--</option>
										<option>Gujarat</option>
										<option>Maharashtra</option>
										<option>Tamil Nadu</option>
										<option>Uttar Pradesh</option>
										<option>Rajasthan</option>
										<option>Andhra Pradesh</option>
										<option>Chhattisgarh</option>

										<!-- Add more options for other states -->
									</select>
								</div>

								<div class="input-box">
									<span class="details">Pin code</span> <input type="number"
										placeholder="Enter your PIN-CODE" id="pin_code"
										name="pin_code" required oninput="limitInputLength(this, 6)">
								</div>


								<div class="numm">
									<div class="inputs-type">
										<span class="details">Total Price After Discount</span> <input
											type="text" placeholder="Total Price"
											id="discountedPriceInput" name="discountedPrice"
											style="color: green; font-weight: bold; font-size: 20px;"
											readonly>
									</div>

									<div class="inputs-coupon">
										<span class="details">Coupon Code</span> <input type="text"
											id="couponCode" placeholder="Enter your Coupon Code">
									</div>
									<button type="submit" id="btncoupon" onclick="funCoupon()">Apply
										Coupon</button>
								</div>

								<div class="input-box">
									<span class="details">Address</span>
									<textarea placeholder="Enter your address" name="address"
										minlength="20" maxlength="400" required></textarea>
								</div>
							</div>

							<div class="card-title">
								<h1>Select Payment Option</h1>
							</div>

							<form id="payment-form">

								<p style="display: none;">
									<spam id="discountedPrice"></spam>
								</p>

								<div class="pay"
									style="margin-top: 40px; font-size: 22px; font-family: Poppins, sans-serif;">
									<input type="radio" class="UPI" name="payment-option"
										value="UPI" required> <label for="UPI"
										style="margin-right: 30px">UPI</label>
									<div class="payment-details" id="upi-details">
										<!-- UPI Payment Form Fields -->
										<input type="text" placeholder="Enter UPI ID: "
											class="myInput">
									</div>

									<input type="radio" id="MasterCard" name="payment-option"
										value="Card" required> <label for="MasterCard"
										style="margin-right: 30px">Credit/Debit Card</label>
									<div class="payment-details" id="card-details">
										<!-- Credit/Debit Card Payment Form Fields -->
										<input type="text" placeholder="Card Number"
											class="card-number" maxlength="19"> <input
											type="text" placeholder="Expiration Date"
											class="expiration-date" maxlength="5"> <input
											type="text" placeholder="CVV" class="cvv" maxlength="3">
									</div>

									<input type="radio" id="Cash" name="payment-option"
										value="Cash on Delivery" required> <label for="Cash">Cash
										On Delivery</label>
									<div class="payment-details" id="cod-details"></div>

									<div class="button">
										<button type="submit" id="submit-order" class="btn">
											Place Order <i class="fa-solid fa-circle-check"
												style="color: #ffffff;"></i>
										</button>
									</div>
								</div>
							</form>

							<script>
								// JavaScript code to validate the form before submission
								document.getElementById('payment-form').addEventListener('submit',function(event) {
													const selectedPaymentOption = document
															.querySelector('input[name="payment-option"]:checked');

													if (!selectedPaymentOption) {
														alert('Please select anyone payment option.');
														event.preventDefault(); // Prevent form submission
													}
												});
							</script>
					</div>
					</form>

				</div>
			</div>
		</div>

		<%@include file="./show_cart_products.jsp"%>

		<script src="js/payment.js"></script>

		<script>
		
			function clearInput() {
				document.getElementById("checkout-order-form").reset();
			}
		</script>


		<script>
			document.getElementById("validate-button").addEventListener(
					"click", function() {
						validateData();
					});

			function validateData() {
				var pinCode = document.getElementById("pin_code").value;
				var phoneNumber = document.getElementById("phone_number").value;

				// Remove any non-digit characters
				pinCode = pinCode.replace(/\D/g, '');
				phoneNumber = phoneNumber.replace(/\D/g, '');

				// Validate PIN code (exactly 6 digits)
				if (pinCode.length !== 6 || isNaN(pinCode)) {
					alert("Please enter a valid 6-digit PIN code.");
					return;
				}

				// Validate phone number (exactly 10 digits)
				if (phoneNumber.length !== 10 || isNaN(phoneNumber)) {
					alert("Please enter a valid 10-digit phone number.");
					return;
				}

				// Data is valid, you can perform further actions here if needed
				alert("Data is valid!");
			}

			// Function to limit input length
			function limitInputLength(element, maxLength) {
				var inputValue = element.value;
				if (inputValue.length > maxLength) {
					element.value = inputValue.slice(0, maxLength);
				}
			}

			document
					.getElementById('yourFormId')
					.addEventListener(
							'submit',
							function(event) {
								// Disable the submit button
								clearInput();
								document.getElementById('submitButtonId').disabled = true;

							});
			function clearInput() {
				document.getElementById("checkout-order-form").reset();
			}
			function prepareAndSubmit(event) {
				// Retrieve data from local storage
				let cartData = JSON.parse(localStorage.getItem('cart'));
				/* let formData = {
				     name: document.getElementById('name').value,
				     email: document.getElementById('email').value,
				     city: document.getElementById('city').value,
				     address: document.getElementById('address').value,
				     zip: document.getElementById('zin').value
				 };*/

				// Add cart data to the form
				let cartInput = document.createElement('input');
				cartInput.type = 'hidden';
				cartInput.name = 'cartData';
				cartInput.value = JSON.stringify(cartData);
				document.getElementById('checkout-order-form').appendChild(
						cartInput);

				// Add form data to the form
				let formInput = document.createElement('input');
				formInput.type = 'hidden';
				formInput.name = 'formData';
				formInput.value = JSON.stringify(formData);
				document.getElementById('checkout-order-form').appendChild(
						formInput);
			}
		</script>

		<script>

		function funCoupon() {
			  let couponCode = document.querySelector('#couponCode').value;
			  let cartString = localStorage.getItem("cart");
			  let cart = JSON.parse(cartString);
			  let totalPrice = 0;

			  var couponCodes = {
			    'COSMETICCODE': 10,  
			    'CODCODE': 5,
			    'DINNINGCODE': 25,
			    'GROCERYCODE': 10,
			    'FASHIONCODE':30,
			    'ELECTRONICCODE':18,
			    'HOMECODE':12,
			    'APPLIANCESCODE':22,
			  };

			  cart.forEach((item) => {
			    let itemTotalPrice = item.productQuantity * item.productPrice;
			    totalPrice += itemTotalPrice;
			    console.log(`Total price for ${item.productName} is ${itemTotalPrice}`);
			  });

			  console.log(`Total price before discount: ${totalPrice}`);

			  if (couponCode in couponCodes) {
			    var discount = couponCodes[couponCode];
			    var discountedPrice = totalPrice - (totalPrice * (discount / 100));

			    document.getElementById('discountedPrice').textContent = discountedPrice.toFixed(2);

			    document.getElementById('discountedPriceInput').value = discountedPrice.toFixed(2);
			    alert('Coupon applied successfully!');
			  } else {
			    alert('Invalid coupon code. Please try again.');
			  }
			}

		</script>
</body>
</html>