
<%@page import="ELM.java.Model.*"%>
<%@page import="java.util.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@page import="ELM.java.Connection.*"%>
<%@page import="java.sql.*"%>

<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

/*  ArrayList<ApplyLeave> leave_List = (ArrayList<ApplyLeave>) session.getAttribute("leave-list"); 
LeaveDao ld = new LeaveDao(DbCon.getConnection());*/
ApplyLeave leave = new ApplyLeave();

/* List<ApplyLeave> leaves = ld.addLeaveRequest(leave); */
String ID = request.getParameter("id");
Integer empId = Integer.parseInt(ID);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/employeelm?useSSL=false", "root", "2112");
Statement stm = con.createStatement();
String sql = "select * from users where id='" + empId + "'";
ResultSet rs = stm.executeQuery(sql);
%>

<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Employee Page</title>
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
#content_panel form label>span {
	width: 130px;
}

#content_panel form input[type="submit"] {
	margin-left: 195px;
}

.sidePanel li a {
	color: black;
	font-size: 20px;
	font-weight: 700;
	padding: 2rem 2rem;;
}

.form-group {
	padding-right: 2rem;
	
}

</style>
<link rel="stylesheet" href="includes/style.css">
</head>

<body>
	<%@include file="includes/navbar.jsp"%>


	<div id="container" style="height: 70vh; width: 100%; display: flex;">
		<div id="side_bar"
			style="width: 20vw; height: 70vh; background-color: #c0c0c0;">
			<ul class="sidePanel">
				<li class="menu_head"
					style="font-size: 30px; margin: 2rem 0; font-weight: 900; padding-left: 2rem;">Controls</li>
				<%-- <li><input type="hidden" name="id" value="<%= auth.getId()%>" class="form-input"></li> --%>
				<li><a href="employee.jsp">About Employee</a></li>
				<li><a href="">Update Employee</a></li>
				<li><a href="leave.jsp">Apply Leave</a></li>
				<li><a href="viewLeave.jsp">View Leave History</a></li>
				<li><a href="emp_BalanceLeave.jsp">View Balance Leave</a></li>
				<li><a href="calander.jsp">Calender</a></li>	
			</ul>
		</div>

		<div id="content_panel">
			<%
			String success = request.getParameter("success");
			if (success != null) {
				if (success.equals("true")) {
					out.println("<p style='color:green;'>User updated successfully!</p>");
				} else {
					out.println("<p style='color:red;'>Failed to update user. Please try again.</p>");
				}
			}
			%>
			<div class="signup-content" style="">
				<div class="signup-form" style="width:35vw;margin-left: 2rem; ">
					<h2 class="form-title" style="width: 50vw; margin-bottom: 3vh;">Update Employee</h2>

					<form method="post" action="update-servlet" class="register-form"
						id="register-form" style="width:35vw;">
						<%
						while (rs.next()) {
						%>
						<!-- <div class="main1"
							style="display: flex; justify-content: space-around; width: 100%;">
							<div class="main2" style=""> -->
						<div class="form-group" style="display: none;">
							<label for="name"><i class="zmdi zmdi-accounts-list"></i></label>
							<input type="hidden" name="userId" id="name"
								value="<%=rs.getInt("id")%>" placeholder="Enter ID" />
						</div>
						<div class="form-group" style="">
							<label for="name"><i class="zmdi zmdi-accounts-list"></i></label>
							<input type="text" name="name" id="name"
								value="<%=rs.getString("name")%>" placeholder="Enter Name" />
						</div>
						<div class="form-group">
							<label for="email"><i class="zmdi zmdi-accounts-list"></i></label>
							<input type="text" name="email" id="email"
								value="<%=rs.getString("email")%>" placeholder="Enter Email" />
						</div>

						<div class="form-group">
							<label for="" style="padding-right: 2rem;"><i
								class="zmdi zmdi-caret-down-circle"></i></label> <select name="rule"
								style="width:35vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
								<option value="">Select Rule</option>
								<option value="Employee">Employee</option>
								<option value="Manager">Manager</option>

							</select>
						</div>

						<!-- </div>
							<div class="main3"> -->
						<div class="form-group">
							<label for="" style=""><i
								class="zmdi zmdi-caret-down-circle"></i></label> <select
								name="department"
								style="width:35vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
								<option value="">Select Department</option>
								<option value="HR">Human Resources</option>
								<option value="IT">Information Technology</option>
								<option value="FIN">Finance</option>
								<option value="ENG">Engineering</option>
							</select>
						</div>

						<!-- <div class="form-group">
									<label for="email"><i class="zmdi zmdi-accounts-list"></i></label>
									<input type="password" name="password" id="email"
										placeholder="Enter password" />
								</div>
								<div class="form-group">
									<label for="email"><i class="zmdi zmdi-accounts-list"></i></label>
									<input type="password" name="conpassword" id="email"
										placeholder="Enter Conform password" />
								</div> -->
						<%
						}
						%>

						<!-- <div class="form-group form-button" style="position:relative; margin-bottom: 3rem;"> -->
									<div class="form-group form-button"
									style="position: absolute; top: 75%; left: 35%; transform: translate(-50%, -50%);">
							<input type="submit" name="signup" id="signup"
								class="form-submit" value="Update" />
						</div>
						<!-- 	</div>
						</div> -->
					</form>
				</div>
			</div>

		</div>

	</div>
	<div id="footer"
		style="background-color: black; width: 100%; height:20vh;">
		<div style="width: 90%; margin: auto auto; display:flex; justify-content: space-between; padding-top: 5vh;">
			<p style="font-size: 15px;">ELM: Employee Leave Management</p>
			<p style="font-size: 15px;">Created By: Tirtha Sahu</p>
			</div>
		</div>

	<%@include file="includes/footer.jsp"%>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>