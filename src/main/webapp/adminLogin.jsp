
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
	padding-top: 4vh;
}

.container {
	width: 48vw;
	height: 77vh;
}

.signin-content {
	/* background-color: blue; */
	width: 45vw;
	height: 70vh;
}
</style>

</head>
<body style="background-color: #10151B;">

	 <%@include file="includes/adminNavbar.jsp"%> 
<%-- 	<header>
		<div class="header">
			<a href="home.jsp" class="logo"><img
				style="height: 100px; width: 100px;" src="images/logo/logo3.png"
				alt="logo"></a>

			<div class="header-right" style="display: flex; align-items: center;">

				<a href="home.jsp">Home</a>
				 <!-- <%
                if (auth != null) {
                %> -->
				<a href="user.jsp">Profile</a> <a href="employee.jsp">About
					Admin</a>

				<!-- <%
                } else {
                %> -->
				<div class="subnav">
					<button class="subnavbtn">
						Register<i class="#"></i>
					</button>
					<div class="subnav-content">
						<li><a href="registration.jsp">SignUp</a></li>
						<li><a href="login.jsp">SignIn </a></li>
					</div>
				</div>
				  <!-- <%
                }
                %> -->
			</div>
		</div>
	</header> --%>
	<!-- <input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	

		<!-- Sing in  Form -->
	<!-- <section class="sign-in" style=""> -->
		<div class="container"
			style="background-color:; width: 60vw; height: 80vh; margin-top: 2rem; margin-bottom: 2rem;">
			<div class="signup-content"
				style="background-color:; width: 55vw; height: 80vh;">
			<div class="signin-form" style=" margin-top: 2vh;">
				<h2 class="form-title" style="width: 30vw;">Admin Login Panel</h2>
				<form method="post" action="admin-login" class="register-form"
					id="login-form">
					<div class="form-group">
						<label for="username"><i
							class="zmdi zmdi-account material-icons-name"></i></label> <input
							type="text" name="" id="username"
							placeholder="Your UserId" />
					</div>
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
							<!-- <option value="Employee">Employee</option> -->
							<option value="Manager">Manager</option>

						</select>
					</div>
					<div class="form-group" style="display: block;">
						<input type="checkbox" name="remember-me" id="remember-me"
							class="agree-term" /> <label for="remember-me"
							class="label-agree-term"><span><span></span></span>Remember
							me</label><br><br>
							
							<label class="label-agree-term"><a href="login.jsp" class="signup-image-link" style="color: blue; font-weight: 900;"><i class="zmdi zmdi-arrow-left" style="color: blue; font-weight: 900; padding-right: 0.5rem;"></i>Back to Employee Panel</a></label>
							
					</div>
					
	<div class="form-group form-button"
						style="position: absolute; top: 89%; left: 50%; transform: translate(-50%, -50%);">
						<input type="submit" name="signin" id="signin" class="form-submit"
							value="Log in" />
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
			<!-- <div class="signin-image">
					<figure>
						<img src="images/signin-image.jpg" alt="sing up image">
					</figure>
					<a href="registration.jsp" class="signup-image-link">Create an
						account</a>
				</div> -->
		</div>
		 </div>

	<!-- </section> -->

	</div>
	<div id="footer"
		style="background-color: black; width: 100%; height:16vh;">
		<div style="width: 90%; margin: auto auto; display:flex; justify-content: space-between; padding-top: 5vh;">
			<p style="font-size: 15px;">ELM: Employee Leave Management</p>
			<p style="font-size: 15px;">Created By: Tirtha Sahu</p>
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