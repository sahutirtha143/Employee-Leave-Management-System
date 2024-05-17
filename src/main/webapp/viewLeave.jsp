
<%@page import="ELM.java.Model.*"%>
<%@page import="java.util.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@page import="ELM.java.Connection.*"%>

<%
Users auth = (Users) request.getSession().getAttribute("auth");
List<ApplyLeave> leaves=null;
if (auth != null) {
	request.setAttribute("auth", auth);
	leaves=new LeaveDao(DbCon.getConnection()).userLeaveHistory(auth.getId());
	
}else{
	response.sendRedirect("login.jsp");
}

ArrayList<ApplyLeave> leave_List = (ArrayList<ApplyLeave>) session.getAttribute("leave-list");
if(leave_List != null){
	request.setAttribute("leave_List", leave_List);
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

.btn-incre {
	box-shadow: none;
	font-size: 20px;
}

.form-input {
	width: 30px;
}

.form-control {
	width: 250px;
}
.approved {
	color: green;
	font-weight: bold;
}

.pending {
	color: red;
	font-weight: bold;
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
				<li><a href="employeeUpdate.jsp?id=<%= auth.getId()%>">Update Employee</a></li>
				<li><a href="leave.jsp">Apply Leave</a></li>
				<li><a href="#">View Leave History</a></li>
				<li><a href="emp_BalanceLeave.jsp">View Balance Leave</a></li>
				<li><a href="calander.jsp">Calender</a></li>	
			</ul>
		</div>

		<!-- <div id="content_panel"> -->
		<div class="container" style="width: 80%;">
			<div class="d-flex py-3 px-3">
				<h3 style="font-size: 30px; font-weight: 700;">Leave History</h3>
				<!-- <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a> -->
			</div>

			<table class="table table-lought">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">Sl.No</th>
						<th scope="col">UserId</th>
						<th scope="col">Start Date</th>
						<th scope="col">End date</th>
						<th scope="col">Type of Leave</th>
						<th scope="col">Reason</th>
						<th scope="col">Status</th>
						<!-- <th scope="col">Delete</th> -->
					</tr>
					</tr>
				</thead>

				<tbody>
					 <%
					if (leaves != null) {
						for (ApplyLeave c : leaves) {
					%> 
					<tr>
					 
						<td>
							<form action="order-now" method="post" class="form-inline">
								<input type="hidden" name="id" value="" class="form-input">
							</form>
						</td>
						<td><%=c.getL_id() %></td> 
						<td><%=auth.getId()%></td>
						<td><%=c.getStartDate() %></td>
						<td><%=c.getEndDate() %></td>
						<td><%=c.getType() %></td>
						<td><%=c.getReason() %></td>
						<td><% if (c.getStatus().equals("Approved")) { %>
							<span class="approved"><%= c.getStatus() %></span>
							<% } else { %>
							<span class="pending"><%= c.getStatus() %></span>
							<% } %>
						</td>
				<%-- 		<td><a class="btn btn-sm btn-danger" href="decline-leave?id=<%=c.getL_id()%>">Decline</a></td> --%>

					</tr>
					
					 <%
					}
					}
					%> 
				</tbody>
			</table>
		</div>
		<!-- </div> -->

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
</body>

</html>