
<%@page import="ELM.java.Model.*"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign In Form</title>
<%@include file="includes/header.jsp"%>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<!-- SWEET ALERT CSS CDN -->
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<link rel="stylesheet" href="includes/style.css">

<style type="text/css">
.sign-in {
	width: 100%;
	height: 90vh;
	background-color: #10151B;
	padding-top: 7vh;
}

.container {
	width: 48vw;
	height: 70vh;
}

.signin-content {
	/* background-color: blue; */
	width: 45vw;
	height: 70vh;
}
</style>

</head>
<body style="background-color: #10151B;">

	<%@include file="includes/navbar.jsp"%>
	<!-- <input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	

		<!-- Sing in  Form -->
	<!-- <section class="sign-in" style=""> -->
		<div class="container"
			style="background-color:; width: 60vw; height: 80vh; margin-top: 2rem; margin-bottom: 2rem;">
			<div class="signin-content"
				style="background-color:; width: 55vw; height: 80vh;">
				<div class="signin-image">
					<figure>
						<img src="images/signin-image.jpg" alt="sing up image">
					</figure>
					<a href="registration.jsp" class="signup-image-link">Create an
						account</a>
				</div>

				<div class="signin-form" style="" >
					<h2 class="form-title" style="margin-bottom: 2.5vh;">Sign in</h2>
					<form method="post" action="login" class="register-form"
						id="login-form">
						<div class="form-group">
							<label for="username"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="useremail" id="username"
								placeholder="Your Email" />
						</div>
						<div class="form-group">
							<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
								type="password" name="userpassword" id="password"
								placeholder="Password" />
						</div>
						<div class="form-group" style="display: none;">
							<label for="" style="padding-right: 2rem;"><i
								class="zmdi zmdi-caret-down-circle"></i></label> <select name="rule"
								style="width: 30vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
								<!-- <option value="">Select Rule</option> -->
								 <option value="Employee">Employee</option>
								<!-- <option value="Manager">Manager</option> -->

							</select>
						</div>
						<div class="form-group">
							<input type="checkbox" name="remember-me" id="remember-me"
								class="agree-term" /> <label for="remember-me"
								class="label-agree-term"><span><span></span></span>Remember
								me</label> <br> <br> </i>
								 <label class="label-agree-term"><a href="adminLogin.jsp" class="signup-image-link" style="color: blue;">Goto Admin Panel<i class="zmdi zmdi-arrow-right"
								style="color: blue; font-weight: 900; padding-left: 0.5rem;"></a></label>
						</div>

						<div class="form-group form-button"
							style="position: absolute; top: 82%; left: 56.5%; transform: translate(-50%, -50%);">
							<input type="submit" name="signin" id="signin"
								class="form-submit" value="Log in" />
								
								<a href="go-to-view-user-list" class="btn btn-dark"
								style="padding: 1.7rem 1.7rem; display: none;">View Leave History</a>
						</div>
					</form>
					<!-- <div class="social-login">
						<span class="social-label">Or login with</span>
						<ul class="socials">
							<li><a href="#"><i
									class="display-flex-center zmdi zmdi-facebook"></i></a></li>
							<li><a href="#"><i
									class="display-flex-center zmdi zmdi-twitter"></i></a></li>
							<li><a href="#"><i
									class="display-flex-center zmdi zmdi-google"></i></a></li>
						</ul>
					</div> -->
				</div>
			</div>
		</div>
	<!-- </section> -->
<div id="footer"
		style="background-color: black; width: 100%; height:16vh;">
		<div style="width: 90%; margin: auto auto; display:flex; justify-content: space-between; padding-top: 5vh;">
			<p style="font-size: 15px;">ELM: Employee Leave Management</p>
			<p style="font-size: 15px;">Created By: Tirtha Sahu</p>
			</div>
		</div>
	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

	<!-- //SWEET ALERT BY JS
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	if(status == "failed"){
		swal("Sorry","Wrong username and password","error");
	}
	
	</script> -->

	<%@include file="includes/footer.jsp"%>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>