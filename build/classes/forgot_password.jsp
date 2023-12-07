<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuickKart</title>
<link rel="stylesheet" href="css/forgot_password.css">
<link rel="shortcut icon" href="img/logo.png" type="image/x-icon">

<!-- By Using below href we can add icons in our website  -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<!-- By Using script tag we can show pop-up in our website  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- By Using below href we can add icons in our website  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

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

	<input type="hidden" id="status"
		value="<%= request.getAttribute("status") %>">

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

	<div class="container">
		<!-- Used for pop-up -->
		<% if(session.getAttribute("forgot_pass") != null){ %>
		<div class="alert alert-success" role="alert">
			<strong>Password Updated Successfully</strong>
		</div>
		<%session.removeAttribute("forgot_pass");
    } %>

		<% if(session.getAttribute("forgot_fail") != null){ %>
		<div class="alert alert-danger" role="alert">
			<strong>Sorry! We cannot find an account with that email
				address!</strong>
		</div>
		<%session.removeAttribute("forgot_fail");
    } %>
		<div class="wrapper">
			<div class="title">
				<span>Reset Your Password &nbsp;<i
					class="fa-solid fa-user-lock fa-xs"></i></span>
			</div>
			<form method="post" action="ForgotPassword"
				onsubmit="return validateForm()">
				<div class="rrow">
					<i class='bx bxl-gmail'></i> <input type="email" name="email"
						placeholder="Email Address" required>
				</div>
				<div class="roww">
					<i class="bx bxs-lock-alt"></i> <input type="password"
						name="password" placeholder="New password" id="password1"
						onkeyup='passConfirm();' required
						pattern="(?=.*[a-z])(?=.*)(?=.*\d).{6,}"
						title="Password must be at least 6 characters long and include at least one lowercase letter, and one digit">
					<i1 class="fa-solid fa-eye" id="eye1"></i1>
				</div>
				<div class="roww">
					<i class='bx bxs-lock'></i> <input type="password"
						placeholder="Confirm new password" id="password2"
						onkeyup='passConfirm();' required>
					<i1 class="fa-solid fa-eye" id="eye2"></i1>
					<br> <span id="Message"></span>
				</div>
				<div class="rrow button">
					<input type="submit" value="Change Password">
				</div>
				<div class="signup-link">
					Click below to login with your account!<br>
					<i class='bx bx-down-arrow-alt bx-flashing'></i><br>
					<a href="login.jsp">Login</a>
				</div>
			</form>
		</div>
	</div>


	<!-- Your existing HTML code up to the point where you want to add the new code -->

	<script>
  const passwordInput1 = document.querySelector("#password1");
  const passwordInput2 = document.querySelector("#password2");
  const eye1 = document.querySelector("#eye1");
  const eye2 = document.querySelector("#eye2");
  const message = document.getElementById("Message");

  eye1.addEventListener("click", function () {
    this.classList.toggle("fa-eye-slash");
    const type = passwordInput1.getAttribute("type") === "password" ? "text" : "password";
    passwordInput1.setAttribute("type", type);
    passConfirm(); // Call passConfirm when the eye icon is clicked
  });

  eye2.addEventListener("click", function () {
    this.classList.toggle("fa-eye-slash");
    const type = passwordInput2.getAttribute("type") === "password" ? "text" : "password";
    passwordInput2.setAttribute("type", type);
    passConfirm(); // Call passConfirm when the eye icon is clicked
  });

  const passConfirm = function() {
    var password1 = passwordInput1.value;
    var password2 = passwordInput2.value;

    if (password1 !== "" && password2 !== "") {
      if (password1 === password2) {
        message.style.color = "Green";
        message.innerHTML = "Passwords match!";
      } else {
        message.style.color = "Red";
        message.innerHTML = "Passwords do NOT match!";
      }
    } else {
      message.innerHTML = ""; // Clear the message if either password is empty
    }
  }

  // Call passConfirm when either of the password fields change
  passwordInput1.addEventListener("keyup", passConfirm);
  passwordInput2.addEventListener("keyup", passConfirm);
  
//Add this function to handle the "Change Password" button click
  function handleChangePasswordClick(event) {
    if (passwordInput1.value !== passwordInput2.value) {
      event.preventDefault(); // Prevent the form from submitting
      alert("Passwords do not match. Please make sure your passwords match before submitting.");
    }
  }

  // Add a click event listener to the "Change Password" button
  const changePasswordButton = document.querySelector("input[type=submit]");
  changePasswordButton.addEventListener("click", handleChangePasswordClick);
	
</script>

	<script>

// Add this function to handle the "Change Password" button click
function handleChangePasswordClick(event) {
  if (passwordInput1.value !== passwordInput2.value) {
    event.preventDefault(); // Prevent the form from submitting
    alert("Passwords do not match. Please make sure your passwords match before submitting.");
  }
  
//Email format validation
  const emailInput = document.querySelector("input[name='email']");
  const emailError = document.querySelector("#emailError");
  emailInput.addEventListener("blur", function () {
    if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(emailInput.value)) {
      emailError.innerHTML = "Please enter a valid email address.";
    } else {
      emailError.innerHTML = ""; // Clear the error message if valid
    }
  });

// Add a click event listener to the "Change Password" button
const changePasswordButton = document.querySelector("input[type=submit]");
changePasswordButton.addEventListener("click", handleChangePasswordClick);

</script>


</body>

</html>