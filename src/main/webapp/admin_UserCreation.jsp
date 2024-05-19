
<%@page import="ELM.java.Model.*"%>
<%@page import="java.time.LocalDate"%>
<%
LocalDate today = LocalDate.now();

Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>

<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin User Creat Page</title>
<%@include file="includes/header.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

	<!-- Font Icon -->
	<link rel="stylesheet"
		href="fonts/material-icon/css/material-design-iconic-font.min.css">

		<!-- Main css -->
		<link rel="stylesheet" href="css/style.css">

			<!-- SWEET ALERT CSS CDN -->
			<link rel="stylesheet" href="alert/dist/sweetalert.css">
<style>
body {
	display: flex;
	flex-direction: column;
	height: 100vh;
	margin: 0;
	overflow: hidden; /* Prevent scrolling of the body */
}

#container {
	display: flex;
	flex: 1;
	height: 100%; /* Take full height of the viewport */
	width: 100%;
}

.sidePanel li a {
	color: black;
	font-size: 20px;
	font-weight: 700;
}

#side_bar {
	width: 20vw;
	background-color: #c0c0c0;
	position: fixed;
	height: 100%; /* Full height of the viewport */
	overflow: auto;
}
.sidePanel{
width: 20vw;
}
.sidePanel li {
	border-bottom: 2px solid #999;
	
}
.sidePanel li a {
	color: black;
	font-size: 20px;
	font-weight: 700;
	/* padding: 2rem 2rem;; */
	text-decoration: none;

}
.sidePanel li a:hover{
color: blue;
}
#content_panel {
	margin-left: 20vw; /* Same as the width of the sidebar */
	width: 80vw;
	height: calc(100vh - 16vh); /* Adjust for the footer height */
	overflow-y: auto;
	padding-bottom: 5vh; /* Ensure content doesn't overlap footer */
}

#footer {
	background-color: black;
	width: 100%;
	height: 16vh;
	position: fixed;
	bottom: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

#footer div {
	width: 90%;
	display: flex;
	justify-content: space-between;
	padding-top: 5vh;
}

#footer p {
	font-size: 15px;
	color: white;
}
.form-group {
	padding-right: 2rem;
}
</style>
<link rel="stylesheet" href="includes/style.css">
</head>

<body>
	<%@include file="includes/adminNavbar.jsp"%>
<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div id="container">
        <div id="side_bar">
            <ul class="sidePanel">
				<li class="menu_head"
					style="font-size: 30px; margin: 2rem 0; font-weight: 900;">Controls</li>
				<li><a href="dashboard.jsp ">Dashboard</a></li>
				<li><a href="admin.jsp">Hello<span style="color: green;"><%=auth.getName() %></span></a></li>
				<li><a href="admin_EmployeeList.jsp">Employee List</a></li>
				<li><a href="admin_LeaveAuthorize.jsp">Leave Authorize</a></li>
				<li><a href="#">User Creation</a></li>

			</ul>
		</div>

		<div id="content_panel" style="width: 80vw;">
			<div class="signup-content" style="width: 80vw;">
				<div class="signup-form" style="width: 80vw;">
					<h2 class="form-title" style="width: 60vw; margin-bottom: 3vh;">Create
						Employee</h2>

					<form method="post" action="admin-user-creation" class="register-form"
						id="register-form" style="width: 20vw;">
						<%-- <%
						while (rs.next()) {
						%> --%>
						<div class="main1"
							style="position: relative; display: flex; justify-content: space-around; width: 100%;">
							<div class="main2" style="width: 30vw;">
								<div class="form-group" style="display: none;">
									<label for="name"><i class="zmdi zmdi-accounts-list"></i></label>
									<input type="hidden" name="userId" id="name" value=""
										placeholder="Enter ID" />
								</div>
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
										style="width: 28.8vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
										<option value="">Select Rule</option>
										<option value="Employee">Employee</option>
										<option value="Manager">Manager</option>

									</select>
								</div>

								<div class="form-group">
									<label for="" style=""><i
										class="zmdi zmdi-caret-down-circle"></i></label> <select
										name="department"
										style="width: 28.8vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
										<option value="">Select Department</option>
										<option value="HR">Human Resources</option>
										<option value="IT">Information Technology</option>
										<option value="FIN">Finance</option>
										<option value="ENG">Engineering</option>
									</select>
								</div>

							</div>

							<div class="main3">
								<div class="form-group" style="width: 35vw;">
									<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
										type="password" name="pass" id="pass" placeholder="Password" />
								</div>
								<div class="form-group">
									<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
									<input type="password" name="re_pass" id="re_pass"
										placeholder="Repeat your password" />
								</div>
								<div class="form-group" style="">
									<label for="name"><i class="zmdi zmdi-accounts-list"></i></label>
									<input type="text" name="leave-day" id="leaveday" value=""
										placeholder="Assign Leave Day" />
								</div>
								<div class="form-group" style="">

									<input type="checkbox" name="agree-term" id="agree-term"
										class="agree-term" /> <label for="agree-term"
										class="label-agree-term"><!-- <span><span></span></span>I
										agree all statements in <a href="#" class="term-service">Terms
											of service</a></label> -->
								</div>
								<%-- <%
						}
						%> --%>

								<!-- <div class="form-group form-button" style="margin-bottom: 3rem;"> -->
									 								<div class="form-group form-button"
									style="position: absolute; top: 85%; left: 200%; transform: translate(-50%, -50%);">
									<input type="submit" name="signup" id="signup"
										class="form-submit" value="Submit" />
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
	</div>
	<div id="footer">
		<div>
			<p>ELM: Employee Leave Management</p>
			<p>Created By: Tirtha Sahu</p>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- JS Bootstrap link for the userTable -->
	<script
		src='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
		
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

</html>
