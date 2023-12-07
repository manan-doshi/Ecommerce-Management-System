
<%
HttpSession session2 = request.getSession(false);
%>
<%
if (session.getAttribute("uemail") != null) {
	response.sendRedirect("index.jsp"); // Redirect to home page
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuickKart</title>
<link rel="stylesheet" href="css/login.css">
<link rel="icon" href="img/logo.png" type="image/x-icon">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<!-- BootStrap -->
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

	<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("uemail") == null) {
	}
	%>


	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

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
			<a href="admin_login.jsp"><button type="button"
					class="btn btn-outline-light">Admin login</button></a>
		</div>
	</header>

	<div class="containerr">

		<%
		if (session.getAttribute("login_fail") != null) {
		%>
		<div class="alert alert-danger" role="alert">
			<strong>Incorrect Email or Password, Please try again!</strong>
		</div>
		<%
		session.removeAttribute("login_fail");
		}
		%>
		<div class="wrapper">
			<div class="title">
				<span>Login &nbsp;<i
					class="fa-solid fa-arrow-right-to-bracket"></i></span>
			</div>

			<form method="post" action="Login">

				<div class="rrow">
					<i class="fas fa-user"></i> <input type="text" name="email"
						placeholder="Email Address" id="email" required>
				</div>
				<div class="roww">
					<i class="fas fa-lock"></i> <input type="password" name="password"
						placeholder="Password" id="password" required>
					<i1 class="fa-solid fa-eye" id="eye"></i1>
				</div>
				<div class="pass">
					<a href="forgot_password.jsp">Forgot password?</a>
				</div>
				<div class="rrow button">
					<input type="submit" value="Login">
				</div>
				<div class="signup-link">
					Not a member? Create an account <br> <i
						class='bx bx-down-arrow-alt bx-flashing'></i><br> <a
						href="signup.jsp">Signup now</a>
				</div>
			</form>
		</div>
	</div>

	<script>
		const passwordInput = document.querySelector("#password")
		const eye = document.querySelector("#eye")

		eye
				.addEventListener(
						"click",
						function() {
							this.classList.toggle("fa-eye-slash");
							const type = passwordInput.getAttribute("type") === "password" ? "text"
									: "password";
							passwordInput.setAttribute("type", type);
						})
	</script>

</body>
</html>