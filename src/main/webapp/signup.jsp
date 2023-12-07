<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuickKart</title>
<link rel="stylesheet" href="css/signup.css">
<link rel="icon" href="img/logo.png" type="image/icon type">
<!-- By Using below href we can add icons in our website  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
			
			if(session.getAttribute("uemail")==null){
			}
		%>

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
		<% if(session.getAttribute("status") != null){ %>
		<div class="alert alert-success" role="alert">
			<strong>Welcome!</strong> Account created successfully, click below
			to login with your account.
		</div>
		<%session.removeAttribute("status");
            }%>
		<% if(session.getAttribute("status_fail") != null){ %>
		<div class="alert alert-danger" role="alert">
			<strong>Welcome!</strong> fail
		</div>
		<%session.removeAttribute("status_fail");
            }%>

		<div class="wrapper">
			<div class="title">
				<span>Create an account &nbsp;<i
					class="fa-solid fa-user-plus fa-xs" style="color: #ffffff;"></i></span>
			</div>

			<form method="post" action="./Signup"
				onsubmit="return validateForm()">

				<div class="rrow">
					<i class='bx bxs-user-account'></i> <input type="text"
						name="username" placeholder="Username" required
						pattern="[0-9a-zA-Z_]{2,}"
						title="Username must be at least 2 characters">
				</div>
				<div class="rrow">
					<i class='bx bxl-gmail'></i> <input type="email" name="email"
						placeholder="Email" required><br> <span
						style="color: red" id="emailError">${error}</span>
				</div>
				<div class="rrow">
					<i class='bx bxs-phone'></i> <input type="text"
						name="contact_number" placeholder="Contact number" id="Contact_No"
						required pattern="[0-9]{10}"
						title="Mobile Number Must Be Exactly 10 Digits, e.g., 1234567890"><br>
					<span style="color: red">${error_number}</span>
				</div>
				<div class="roww">
					<i class='bx bxs-lock-alt'></i> <input type="password"
						name="password" placeholder="Create a password" id="password1"
						onkeyup='passConfirm();' required
						pattern="(?=.*[a-z])(?=.*)(?=.*\d).{6,}"
						title="Password must be at least 6 characters long and include at least one lowercase letter, and one digit">
					<i1 class="fa-solid fa-eye" id="eye1"></i1>
				</div>
				<div class="roww">
					<i class='bx bxs-lock'></i> <input type="password" name="password"
						placeholder="Confirm your password" id="password2"
						onkeyup='passConfirm();' required
						pattern="(?=.*[a-z])(?=.*)(?=.*\d).{6,}"
						title="Password must be at least 6 characters long and include at least one uppercase letter, one lowercase letter, and one digit">
					<i1 class="fa-solid fa-eye" id="eye2"></i1>
					<br> <span id="Message"></span>
				</div>

				<div class="rrow button">
					<input type="submit" value="Signup">
				</div>
				<div class="signup-link">
					Already have an account? <a href="login.jsp">Login</a>
				</div>
			</form>
		</div>
	</div>


	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript"> // For screen pop-up notification 
	/*var status= document.getElementById("status").value;
	if(status == "success"){
		Swal.fire({
			  position: 'center',
			  icon: 'success',
			  title: 'Account Created!',
			  showConfirmButton: true,
			  timer: 1500
			})
	}*/
	</script>



	<script>  // For validation of form 
  function validateForm() {

      // Username
      var UsernameInput = document.getElementById("Username");
      var UsernamePattern = /^[0-9a-zA-Z_.]{2,}$/;

      if (!UsernamePattern.test(UsernameInput.value)) {
          alert('Please fill the field.');
          return false;
      }      
      // Contact No validation using regular expression
      var Contact_NoInput = document.getElementById("Contact_No");
      var Contact_NoPattern = /^[0-9]{10}$/;

      if (!Contact_NoPattern.test(Contact_NoInput.value)) {
          alert('Mobile Number Must Be Exactly 10 Digits');
          return false;
      }
      // Password validation using regular expression
      var passwordInput = document.getElementById("password1");
      var passwordPattern = /^(?=.*[a-z])(?=.*)(?=.*\d).{6,}$/;

      if (!passwordPattern.test(passwordInput.value)) {
          alert('include at least one uppercase letter');
          return false;
       }
      return true;  
  }

	// Email format validation for @gmail.com
	const emailInput = document.querySelector("input[name='email']");
	const emailError = document.querySelector("#emailError");

	emailInput.addEventListener("blur", function() {
	    if (!/^[a-zA-Z0-9._%+-]+@gmail\.com$/.test(emailInput.value)) {
	        emailError.innerHTML = "Please enter a valid e-mail address.";
	    } else {
	        emailError.innerHTML = ""; // Clear the error message if it's valid
	    }
	});
</script>



	<script>
		const passwordInput1 = document.querySelector("#password1");
		const passwordInput2 = document.querySelector("#password2");
		const eye1 = document.querySelector("#eye1");
		const eye2 = document.querySelector("#eye2");
		const message = document.getElementById("Message");

		eye1
				.addEventListener(
						"click",
						function() {
							this.classList.toggle("fa-eye-slash");
							const type = passwordInput1.getAttribute("type") === "password" ? "text"
									: "password";
							passwordInput1.setAttribute("type", type);
							passConfirm(); 
						});

		eye2
				.addEventListener(
						"click",
						function() {
							this.classList.toggle("fa-eye-slash");
							const type = passwordInput2.getAttribute("type") === "password" ? "text"
									: "password";
							passwordInput2.setAttribute("type", type);
							passConfirm(); 
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
				message.innerHTML = "";
			}
		}

		passwordInput1.addEventListener("keyup", passConfirm);
		passwordInput2.addEventListener("keyup", passConfirm);

		function handleChangePasswordClick(event) {
			if (passwordInput1.value !== passwordInput2.value) {
				event.preventDefault(); 
				alert("Password do not match. Please make sure your passwords match before submitting.");
			}
		}

		const changePasswordButton = document
				.querySelector("input[type=submit]");
		changePasswordButton.addEventListener("click",
				handleChangePasswordClick);
	</script>

	<script>
		var passConfirm = function() {
			if (document.getElementById("password1").value == document
					.getElementById("password2").value) {
				document.getElementById("Message").style.color = "Green";
				document.getElementById("Message").innerHTML = "Password match!"
			} else {
				document.getElementById("Message").style.color = "Red";
				document.getElementById("Message").innerHTML = "Password do NOT match!"
			}
		}
	</script>


</body>

</html>