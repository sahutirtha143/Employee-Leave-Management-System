
<%@page import="ELM.java.Connection.DbCon"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="ELM.java.Model.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.LocalDate"%>
<%
LocalDate today = LocalDate.now();

LeaveDao leaveDao = new LeaveDao(DbCon.getConnection());
List<ApplyLeave> all_Leave_list = leaveDao.getAllLeaveRequests();
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);

} else {
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
	
	<!-- Font Icon -->
	<link rel="stylesheet"
		href="fonts/material-icon/css/material-design-iconic-font.min.css">

		<!-- Main css -->
		<link rel="stylesheet" href="css/style.css">

<!-- CSS Bootstrap Link for the User table -->
<!-- <link rel='stylesheet'
	href='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'> -->
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
    padding-bottom: 16vh; /* Ensure content doesn't overlap footer */
    position: relative;
    z-index: 1; /* Make sure content is above the footer */
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
    z-index: 2; /* Ensure the footer is above the content */
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

.form-title {
    width: 100%;
    text-align: center;
    font-size: 50px;
    margin-top: 5vh;
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
	<%@include file="includes/adminNavbar.jsp"%>


	<div id="container">
        <div id="side_bar">
            <ul class="sidePanel">
				<li class="menu_head"
					style="font-size: 30px; margin: 2rem 0; font-weight: 900;">Controls</li>
				<li><a href="dashboard.jsp">Dashboard</a></li>
				<li><a href="admin.jsp">Hello <span style="color: green;"><%=auth.getName() %></span></a></li>
				<li><a href="admin_EmployeeList.jsp">Employee List</a></li>
				<li><a href="#">Leave Authorize</a></li>
				<li><a href="admin_UserCreation.jsp">User Creation</a></li>
			</ul>
		</div>

		<div id="content_panel" style="width:80vw;">
			<!-- <div class="min-container" style="width: 80%;"> -->
				<div class="d-flex py-3 px-3">
					<h2 style="width: 60vw;">Leave Authorize</h2>
					<!-- <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a> -->
				</div>

				<table class="table table-lought" style="width: 75vw; margin: auto auto">
					<thead>
						<tr>
							<th scope="col" style="display: none;"></th>
							<th scope="col" >Id</th>
							<th scope="col">Apply Date</th>
							<th scope="col">Start Date</th>
							<th scope="col">End Date</th>
							<th sc ope="col">Leave Type</th>
							<th scope="col">Reason</th>
							<th scope="col">Admin Coment</th>
							<th scope="col">Status</th>
							<th scope="col"><form method="post" action="">
									<input type="hidden" name="" value=""
										style="display: none;"></input> <input type="submit"
										class="btn btn-sm " value="Approve" style="font-size: 15px; font-weight: 700;"></input>
								</form></th>
								
							<th scope="col"><form method="post" action="">
									<input type="hidden" name="" value=""
										style="display: none;"> <input type="submit"
										class="btn btn-sm" value="Declined" style="font-size: 15px; font-weight: 700;">
								</form> </th>
						</tr>
						</tr>
					</thead>

					<tbody>
						<%
						for (ApplyLeave alr : all_Leave_list) {
						%>
						<tr>
							<td style="display: none;"><a href="admin-leave-authorize"
								class="btn btn-dark" style="padding: 1.7rem 1.7rem;">View
									Leave History</a></td>
							<td><%=alr.getL_id()%></td>
							<td><%=alr.getStartDate()%></td>
							<td><%=alr.getStartDate()%></td>
							<td><%=alr.getEndDate()%></td>
							<td><%=alr.getType()%></td>
							<td><%=alr.getReason()%></td>
							<td>xxxxx</td>
							<td>
							<% if (alr.getStatus().equals("Approved")) { %>
        					<span class="approved"><%= alr.getStatus() %></span>
    						<% } else { %>
      					    <span class="pending"><%= alr.getStatus() %></span>
   							 <% } %>
							</td>
							<td>
								<%
								if (alr.getStatus().equals("Pending")) {
								%>
								<form method="post" action="updateStatusApprove">
									<input type="hidden" name="l_id" value="<%=alr.getL_id()%>"
										style="display: none;"> <input type="submit"
										class="btn btn-sm btn-success" value="Approve">
								</form>
								 <%
 }
 %>
							</td>

							<td>
								<%
								if (alr.getStatus().equals("Pending")) {
								%>
								<form method="post" action="updateStatusDeclined">
									<input type="hidden" name="l_id" value="<%=alr.getL_id()%>"
										style="display: none;"> <input type="submit"
										class="btn btn-sm btn-danger" value="Declined">
								</form> <%
 }
 %>
							</td>
						</tr>

						<%
						}
						%>
					</tbody>
				</table>
			<!-- </div> -->
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
</body>

</html>
