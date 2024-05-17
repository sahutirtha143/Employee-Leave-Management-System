
<%@page import="ELM.java.Model.*"%>
<%@page import="java.util.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@page import="ELM.java.Connection.*"%>

<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

/*  ArrayList<ApplyLeave> leave_List = (ArrayList<ApplyLeave>) session.getAttribute("leave-list"); 
LeaveDao ld = new LeaveDao(DbCon.getConnection());*/
ApplyLeave leave = new ApplyLeave();

/* List<ApplyLeave> leaves = ld.addLeaveRequest(leave); */
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
</style>
<link rel="stylesheet" href="includes/style.css">
</head>

<body>
	<%@include file="includes/navbar.jsp"%>


	<div id="container" style="height: 66.6vh; width: 100%; display: flex;">
		<div id="side_bar"
			style="width: 20vw; height: 70vh; background-color: #c0c0c0;">
			<ul class="sidePanel">
				<li class="menu_head"
					style="font-size: 30px; margin: 2rem 0; font-weight: 900; padding-left: 2rem;">Controls</li>
				<%-- <li><input type="hidden" name="id" value="<%= auth.getId()%>" class="form-input"></li> --%>
				<li><a href="employee.jsp">About Employee</a></li>
				<li><a href="employeeUpdate.jsp?id=<%=auth.getId()%>">Update
						Employee</a></li>
				<li><a href="#">Apply Leave</a></li>
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
					out.println("<p style='color:green;'>Leave request submitted successfully!</p>");
				} else {
					out.println("<p style='color:red;'>Failed to submit leave request. Please try again.</p>");
				}
			}
			%>

			<div class="signup-content" style="">
				<div class="signup-form" style="width:35vw;margin-left: 2rem; ">
					<h2 class="form-title" style="width: 50vw; margin-bottom: 3vh;">Employee Leave</h2>

					<form method="post" action="ApplyLeaveServlet"
						class="register-form" id="register-form">
						<div class="form-group">
							<label for="name"><i class="zmdi zmdi-receipt"></i></label> <input
								type="text" name="userId" id="name" placeholder="Enter User ID" />
						</div>
						<div class="form-group">
							<label for="name"><i class="zmdi zmdi-receipt"></i></label> <input
								type="date" name="startDate" id="name"
								placeholder="Starting Date" />
						</div>
						<div class="form-group">
							<label for="email"><i class="zmdi zmdi-receipt"></i></label> <input
								type="date" name="endDate" id="email" placeholder="Ending Date" />
						</div>
						<div class="form-group">
							<label for="" style="padding-right: 2rem;"><i
								class="zmdi zmdi-caret-down-circle"></i></label> <select name="type"
								style="width: 33vw; height: 5.5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
								<option value="">Please choose an option--</option>
								<option value="Sick Leave">Sick Leave</option>
								<option value="Vacation Leaves">Vacation Leaves</option>
								<option value="Other Leaves">Other Leaves</option>
							</select>
						</div>
						<div class="form-group">
							<label for="name"><i class="zmdi zmdi-keyboard"></i></label> <input
								type="text" name="reason" id="name"
								placeholder="Reason of leave" />
						</div>

						<div class="form-group form-button"
							style="position: absolute; top: 75%; left: 60%; transform: translate(-50%, -50%);">
							<input type="submit" name="signup" id="signup"
								class="form-submit" value="Apply Leave" />
							<%-- <%
							if (!leaves.isEmpty()) {
								for (ApplyLeave p : leaves) {
							%> --%>
							<%-- <a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">View Leave History</a>  --%>
							<a href="go-to-view" class="btn btn-dark"
								style="padding: 1.7rem 1.7rem; display: none;">View Leave
								History</a>
							<%-- <%
							}
							}
							%> --%>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
	<<div id="footer"
		style="background-color: black; width: 100%; height:16vh;">
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