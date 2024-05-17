
<%@page import="ELM.java.DAO.UserDao"%>
<%@page import="ELM.java.Model.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*"%>
<%
LocalDate today = LocalDate.now();
UserDao userDao = new UserDao();
Users auth = (Users) request.getSession().getAttribute("auth");
List<Users> userList =userDao.selectAllUsers(null);
if (auth != null) {
	request.setAttribute("auth", auth);
	
}else{
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

.sidePanel li a {
	color: black;
	font-size: 20px;
	font-weight: 700;
	padding: 2rem 2rem;;
}

/* .inf-content{
    border:1px solid #DDDDDD;
    -webkit-border-radius:10px;
    -moz-border-radius:10px;
    border-radius:10px;
    box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3); */
</style>
<link rel="stylesheet" href="includes/style.css">
</head>

<body>
	<%@include file="includes/adminNavbar.jsp"%> 


	<div id="container" style="height: 70vh; width: 100%; display: flex;">
		<div id="side_bar"
			style="width: 20vw; height: 70vh; background-color: #c0c0c0;">
			<ul class="sidePanel">
				<li class="menu_head"
					style="font-size: 30px; margin: 2rem 0; font-weight: 900; padding-left: 2rem;">Controls</li>
				<li><a href="#">Dashboard</a></li>
				<li><a href="admin.jsp">About Admin</a></li>
				<li><a href="#">Employee List</a></li>
				<li><a href="admin_LeaveAuthorize.jsp">Leave Authorize</a></li>
				<li><a href="admin_UserCreation.jsp">User Creation</a></li>
			</ul>
		</div>

		<div id="content_panel" style="width: 80vw;">
		<div class="container" style="width: 80%;">
			<div class="d-flex py-3 px-3">
				<h3>Employee List</h3>
				<!-- <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a> -->
			</div>

			<table class="table table-lought">
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
			<% for (Users user : userList) { %>
					<tr>
					 
						<td>
							<form action="order-now" method="post" class="form-inline">
								<input type="hidden" name="id" value="" class="form-input">
							</form>
						</td>
						<td><%=user.getId() %></td> 
						<td><%=user.getEmail() %></td>
						<td><%=user.getRole()  %></td>
						<td><%=user.getDepartment()%></td>
						<td><%=user.getLeaveDay() %></td>
<%-- 						<td><a class="btn btn-sm btn-danger" href="decline-leave?id=<%=%>">Delete</a></td>
 --%>						<td><a class="btn btn-sm btn-danger" href="delete-leave?id=<%=user.getId()%>">Delete</a></td>
<%-- 						<td><a class="btn btn-sm btn-danger" href="decline-leave?id=<%=%>">Update</a></td>
 --%>						
 <td><a class="btn btn-sm btn-success" href="admin_update.jsp?id=<%= user.getId()%>">Update</a></td>
						

					</tr>
					 <% } %>
				
				</tbody>
			</table>
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
