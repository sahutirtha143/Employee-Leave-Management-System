
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
	<%@include file="includes/navbar.jsp"%>


	<div id="container" style="height: 70vh; width: 100%; display: flex;">
		<div id="side_bar"
			style="width: 20vw; height: 70vh; background-color: #c0c0c0;">
			<ul class="sidePanel">
				<li class="menu_head"
					style="font-size: 30px; margin: 2rem 0; font-weight: 900; padding-left: 2rem;">Controls</li>
				<li><a href="#">About Employee</a></li>
				<li><a href="employeeUpdate.jsp?id=<%=auth.getId()%> ">Update
						Employee</a></li>
				<li><a href="leave.jsp">Apply Leave</a></li>
				<li><a href="viewLeave.jsp">View Leave History</a></li>
				<li><a href="emp_BalanceLeave.jsp">View Balance Leave</a></li>
				<li><a href="calander.jsp">Calender</a></li>	

			</ul>
		</div>

		<div id="content_panel" style="width: 80vw;">
			<div class="container bootstrap snippets bootdey"
				style="width: 80vw; margin-top: 3rem; margin-left: 6vw;">
				<div class="panel-body inf-content">
					<div class="row">
						<div class="col-md-4">
							<img alt="" style="width: 600px;" title=""
								class="img-circle img-thumbnail isTooltip"
								src="https://bootdey.com/img/Content/avatar/avatar7.png"
								data-original-title="Usuario">

							<ul title="Ratings" class="list-inline ratings text-center">
								<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
								<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
								<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
								<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
								<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							</ul>
						</div>
						<div class="col-md-6" style="margin-top: 8vh;">
							<strong style="font-size: 25px; font-weight: 900;">Information</strong><br>
							<div class="table-responsive">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><strong> <span
													class="glyphicon glyphicon-asterisk text-primary"></span>
													Employee Id
											</strong></td>
											<td class="text-primary"><%=auth.getId()%></td>
										</tr>

										<tr>
											<td><strong> <span
													class="glyphicon glyphicon-user  text-primary"></span> Name
											</strong></td>
											<td class="text-primary"><%=auth.getName()%></td>
										</tr>

										<tr>
											<td><strong> <span
													class="glyphicon glyphicon-user  text-primary"></span>
													Email
											</strong></td>
											<td class="text-primary"><%=auth.getEmail()%></td>
										</tr>

										<tr>
											<td><strong> <span
													class="glyphicon glyphicon-bookmark text-primary"></span>
													Role
											</strong></td>
											<td class="text-primary"><%=auth.getRole()%></td>
										</tr>

										<tr>
											<td><strong> <span
													class="glyphicon glyphicon-eye-open text-primary"></span>
													Department
											</strong></td>
											<td class="text-primary"><%=auth.getDepartment()%></td>
										</tr>

										<tr>
											<td><strong> <span
													class="glyphicon glyphicon-calendar text-primary"></span>
													created
											</strong></td>
											<td class="text-primary"><%=today%></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
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