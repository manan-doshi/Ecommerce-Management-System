<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuicKkart</title>
<link rel="stylesheet" href="css/contact_us.css">
<link rel="icon" href="img/logo.png" type="image/x-icon">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
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
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="upper">
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

	<div class="containerr">

		<%
		if (session.getAttribute("status") != null) {
		%>
		<div class="alert alert-success" role="alert">
			<strong>Submission received! We will get back to you soon.</strong>
		</div>
		<%
		session.removeAttribute("status");
		}
		%>
		<%
		if (session.getAttribute("status_fail") != null) {
		%>
		<div class="alert alert-danger" role="alert">
			<strong>Welcome!</strong> fail
		</div>
		<%
		session.removeAttribute("status_fail");
		}
		%>

		<div class="wrapper">
			<div class="title">
				<span>Contact Us</span>
			</div>

			<form method="post" action="./Contact_us">

				<div class="roow">
					<i class="fa-solid fa-user" style="color: #000000;"></i> <input
						type="text" name="name" placeholder="Full Name" id="email"
						required>
				</div>
				<div class="roow">
					<i class="fa-solid fa-phone" style="color: #000000;"></i> <input
						type="number" name="contact_number" placeholder="Contact number"
						id="Contact_No" required>
				</div>
				<div class="roow">
					<i class="fa-solid fa-envelope" style="color: #050505;"></i> <input
						type="text" name="email" placeholder="Email Address" id="email"
						required>
				</div>
				<div class="rrow" style="margin: 17px 0px;">
					<textarea class="form-control" rows="60" cols="30"
						placeholder="Describe your issue. Tell us more and we'll find the best solution for you!"
						id="message" name="message" style="height: 100px"></textarea>
				</div>
				<div class="roow button">
					<input type="submit" value="Submit">
				</div>
			</form>
		</div>
	</div>

	<div class="contacts">
		<div class="phone-numbers">
			<span><i class="fa-solid fa-phone fa-sm"></i> (+91) 7046448720</span>
			<span>(+91) 9157312511</span>
		</div>

		<div class="social-icons">

			<a href="https://www.facebook.com/"><img src="img/facebook.png"></a>
			<a href="https://www.instagram.com/"><img src="img/Instagram.png"></a>
			<a href="https://www.linkedin.com/"><img src="img/LinkedIn.png"></a>
			<a href="https://twitter.com/"><img src="img/twitter.png"></a>
			<a href="https://www.gmail.com/" target="_blank"><img
				src="img/gmail.png" alt="gmail"></a>

		</div>
	</div>

</body>

</html>