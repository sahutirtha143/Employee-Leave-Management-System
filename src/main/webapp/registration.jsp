
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
<title>Sign Up Form</title>
<%@include file="includes/header.jsp"%>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- <!-- Main css -->
<link rel="stylesheet" href="css/style.css">
-->

<!-- SWEET ALERT CSS CDN -->
<link rel="stylesheet" href="alert/dist/sweetalert.css">


</head>
<body style="background-color: #10151B;">
	<%@include file="includes/navbar.jsp"%>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<!-- 	<div class="main" style="display: flex; align-items: center; background-color: red; height: 100vh; width: 100%;"> -->

	<!-- Sign up form -->
	<!-- <section class="signup"
		style="background-color:; width: 100%; height: 80vh; margin-top: 0.3rem;"> -->
		<div class="container"
			style="background-color:; width: 60vw; height: 80vh; margin-top: 2rem; margin-bottom: 2rem;">
			<div class="signup-content"
				style="background-color:; width: 55vw; height: 80vh;">


				<div class="signup-form" style="">
					<h2 class="form-title" style="margin-bottom: 2.5vh;">Sign up</h2>
					<form method="post" action="signUp" class="register-form"
						id="register-form"
						style="background-color:; padding-bottom: 4rem;">

						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="name" id="name" placeholder="Your Name" />
						</div>
						<div class="form-group">
							<label for="email"><i class="zmdi zmdi-email"></i></label> <input
								type="email" name="email" id="email" placeholder="Your Email" />
						</div>
						
							<div class="form-group">
								<label for="" style="padding-right: 2rem;"><i
									class="zmdi zmdi-caret-down-circle"></i></label> <select name="rule"
									style="width: 30vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
									<option value="">Select Rule</option>
									<option value="Employee">Employee</option>
									<option value="Manager">Manager</option>

								</select>
							</div>
							<div class="form-group">
								<label for="" style=""><i
									class="zmdi zmdi-caret-down-circle"></i></label> <select
									name="department"
									style="width: 30vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
									<option value="">Select Department</option>
									<option value="HR">Human Resources</option>
									<option value="IT">Information Technology</option>
									<option value="FIN">Finance</option>
									<option value="ENG">Engineering</option>
								</select>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group" style="">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><!-- <span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label> -->
							</div>
							<div class="form-group form-button"
								style="z-index: 100; position: absolute; top: 85%; left: 64%; transform: translate(-50%, -50%); ">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register"  style="padding:1.5rem 8rem;"/>
									
									<!-- <a href="go-to-view-user-list" class="btn btn-dark"
								style="padding: 1.7rem 1.7rem; display: none;">View Leave History</a> -->
									
							</div>
					</form>
				</div>
				<div class="signup-image">
					<figure>
						<img src="images/signup-image.jpg" alt="sing up image">
					</figure>

					<a href="login.jsp" class="signup-image-link">I am already
						member</a>
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

	<!-- </div> -->


	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

	<!-- 	//SWEET ALERT BY JS -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "sucess") {
			swal("Congrats", "Account created sucessfully", "sucess");
		}
	</script>




</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>