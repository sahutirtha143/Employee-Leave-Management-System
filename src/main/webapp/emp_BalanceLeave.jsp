
<%@page import="ELM.java.Connection.DbCon"%>
<%@page import="ELM.java.Model.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="java.io.*" %>
<%
LocalDate today = LocalDate.now();
Users auth = (Users) request.getSession().getAttribute("auth");
/* List<ApplyLeave> leaves=null; */
if (auth != null) {
	request.setAttribute("auth", auth);
	/* leaves=new LeaveDao(DbCon.getConnection()).getLeavesByUserId(auth.getId()); */
}
else{
	response.sendRedirect("login.jsp");
}
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

<!-- CSS Bootstrap Link for the User table -->
<link rel='stylesheet'
	href='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<style>
#content_panel form label>span {
	width: 130px;
}

#content_panel form input[type="submit"] {
	margin-left: 195px;
}

 a {
	color: black;
	font-size: 20px;
	font-weight: 700;
	padding: 2rem 2rem;;
}
/* SUB-CONTAINER */
.form-title {
	width: 100%;
	text-align: center;
	font-size: 50px;
	margin-top: 5vh;
}

.sub-container {
	width: 80vw;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 40vh;
}

.box {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.9);
	text-align: center;
	margin: 10px;
	width: 172px;
	height: 20vh;;
}

.box h3 {
	margin-top: 0;
	color: #333333;
}

.box p {
	font-size: 24px;
	font-weight: bold;
	color: green;
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
				<li><a href="employee.jsp">About Employee</a></li>
				<li><a href="employeeUpdate.jsp?id=<%=auth.getId()%>">Update
						Employee</a></li>
				<%-- 				<li><a href="employeeUpdate.jsp?id=<%=auth.getId()%> ">Update
						Employee</a></li> --%>
				<li><a href="leave.jsp">Apply Leave</a></li>
				<li><a href="viewLeave.jsp">View Leave History</a></li>
				<li><a href="#">View Balance Leave</a></li>
				<li><a href="calander.jsp">Calender</a></li>	

			</ul>
		</div>

		<div id="content_panel" style="width: 80vw;">
			<h2 class="form-title" style="width: 100%; text-align: center;">Your
				Balance Leave</h2>

			<!-- <form action="leave-count" method="post">
				 <input type="hidden" id="userId"
					name="userId" value=""></input>
			</form> -->
			<a href="leave-count?id=<%=auth.getId() %>" class="btn btn-dark"
								style="padding: 1.7rem 1.7rem;">view balance</a>
					<a href="calander.jsp">View Leave Calender</a>
			 
			 
			 <div class="sub-container">
                <div class="box">
                    <h3>Total Leaves</h3>
             <p><%= request.getAttribute("totalLeaves") %></p>
                 </div>
                <div class="box">
                    <h3>Remaining Leaves</h3>
                  <p><%= request.getAttribute("remainingLeaves") %></p> 
                </div>
                <div class="box">
                    <h3>Sick Leaves</h3>
                     <p><%= request.getAttribute("sickLeaves") %></p> 
                </div>
                <div class="box">
                    <h3>Vacation Leaves</h3>
                 <p> <%= request.getAttribute("vacationLeaves") %></p> 
                </div>
                <div class="box">
                    <h3>Other Leaves</h3>
                  <p><%= request.getAttribute("otherLeaves") %></p> 
                </div>
            </div>
		</div>
	</div>
	<div id="footer"
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

	<!-- JS Bootstrap link for the userTable -->
	<script
		src='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
</body>

</html>


