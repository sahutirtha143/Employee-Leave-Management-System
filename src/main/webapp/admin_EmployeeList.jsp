
<%@page import="ELM.java.DAO.UserDao"%>
<%@page import="ELM.java.Model.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*"%>
<%
LocalDate today = LocalDate.now();
UserDao userDao = new UserDao();
Users auth = (Users) request.getSession().getAttribute("auth");
List<Users> userList = userDao.selectAllUsers(null);
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
	href='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>  -->
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
				<li><a href="#">Employee List</a></li>
				<li><a href="admin_LeaveAuthorize.jsp">Leave Authorize</a></li>
				<li><a href="admin_UserCreation.jsp">User Creation</a></li>
			</ul>
		</div>

		<div id="content_panel">
			<div class="d-flex py-3 px-3">
				<h2 style="width: 60vw;">Employee List</h2>
				<!-- <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a> -->
			</div>

			<table class="table table-lought"
				style="width: 75vw; margin: auto auto">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">UserId</th>
						<th scope="col">Email</th>
						<th scope="col">Role</th>
						<th scope="col">Department</th>
						<th scope="col">Day Allotted</th>
						<th scope="col">Delete</th>
						<th scope="col">Update</th>
					</tr>
					</tr>
				</thead>

				<tbody>
					<%
					for (Users user : userList) {
					%>
					<tr>

						<td>
							<form action="order-now" method="post" class="form-inline">
								<input type="hidden" name="id" value="" class="form-input">
							</form>
						</td>
						<td><%=user.getId()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getRole()%></td>
						<td><%=user.getDepartment()%></td>
						<td><%=user.getLeaveDay()%></td>
						<td><a class="btn btn-sm btn-danger"
							href="delete-leave?id=<%=user.getId()%>">Delete</a></td>

						<td><a class="btn btn-sm btn-success"
							href="admin_update.jsp?id=<%=user.getId()%>">Update</a></td>


					</tr>
					<%
					}
					%>

				</tbody>
			</table>
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
