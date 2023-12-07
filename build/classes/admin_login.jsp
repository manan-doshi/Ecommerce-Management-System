<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuickKart - Admin login</title>
<link rel="shortcut icon" href="img/admin.png" type="image/x-icon">
<link rel="stylesheet" href="css/admin_login.css">
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

<!-- icons -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>
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
			<button type="button" class="btn btn-outline-light"
				style="cursor: auto;">
				Admin Access <i class="fa-solid fa-user-lock"
					style="color: #a39e9e;"></i>
			</button>
		</div>
	</header>



	<div class="containerr">

		<% if(session.getAttribute("login_fail_admin") != null){ %>
		<div class="alert alert-danger" role="alert">
			<strong>Incorrect Email or Password, Please try again!</strong>
		</div>
		<%session.removeAttribute("login_fail_admin");
    } %>
		<div class="wrapper">
			<div class="title">
				<span>Admin Login &nbsp;<i
					class="fa-solid fa-arrow-right-to-bracket"></i></span>
			</div>

			<form method="post" action="./Admin_login_access">

				<div class="rrow">
					<i class='bx bxs-user-account'></i> <input type="text"
						name="username" placeholder="Username" required>
				</div>

				<div class="rrow">
					<i class="fas fa-user"></i> <input type="text" name="email"
						placeholder="Email Address" id="email" required>
				</div>
				<div class="roww">
					<i class="fas fa-lock"></i> <input type="password" name="password"
						placeholder="Password" id="password" required>
					<i1 class="fa-solid fa-eye" id="eye"></i1>
				</div>
				<div class="rrrow button">
					<input type="submit" value="Login">
				</div>

			</form>
		</div>
	</div>

	<script>
       const passwordInput = document.querySelector("#password")
        const eye = document.querySelector("#eye")

        eye.addEventListener("click", function () {
            this.classList.toggle("fa-eye-slash");
            const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
            passwordInput.setAttribute("type", type);
        })
    </script>
</body>
</html>