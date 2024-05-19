
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

<!-- CSS Bootstrap Link for the User table -->
<link rel='stylesheet'
	href='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
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
         .form-title {
            font-size: 36px;
            font-weight:700;
            margin-bottom: 3px;
            color: #333333;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-align: center;
        }
        .sub-container {
        
            width:75vw;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 2vh;
        }
        .box {
        width:25vw;
        height:25vh;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.9);
            text-align: center;
            margin: 5px;
            width: calc(33.333% - 20px);
            box-sizing: border-box;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .box:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .box h3 {
            margin-top: 0;
            color: #555;
            font-size: 24px;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .box p {
            font-size: 30px;
            font-weight: bold;
            color: #28a745;
            margin: 0;
        }
        @media (max-width: 768px) {
            .box {
                width: calc(50% - 20px);
            }
        }
        @media (max-width: 480px) {
            .box {
                width: 100%;
                margin: 10px 0;
            }
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
				<li><a href="#" style="color: black;">Dashboard</a></li>
				<li><a href="admin.jsp" style="color: black;">Hello  <span style="color: green;"><%=auth.getName() %></span>
						</a></li>
				<li><a href="admin_EmployeeList.jsp" style="color: black;">Employee
						List</a></li>
				<li><a href="admin_LeaveAuthorize.jsp" style="color: black;">Leave
						Authorize</a></li>
				<li><a href="admin_UserCreation.jsp" style="color: black;">User
						Creation</a></li>
			</ul>
		</div>

		<div id="content_panel" style="width: 80vw;">
			<!-- <h2 class="form-title">Your Balance Leave</h2>
			<a href="l" class="btn btn-dark"
				style="padding: 1.5rem 1.5rem; position: absolute; top: 39%; left: 60%; transform: translate(-50%, -50%);">view
				balance</a> -->
			<div class="form-title">Dashboard</div>
        <div class="sub-container">
            <div class="box">
                <h3>Available Types of Leaves</h3>
                <p>3</p>
            </div>
            <div class="box">
                <h3>Registered Employees</h3>
                <p>10</p>
            </div>
            <div class="box">
                <h3>Available Departments</h3>
                <p>4</p>
            </div>
        </div>
        <div class="sub-container">
            <div class="box">
                <h3>Pending Leave Requests</h3>
                <p>5</p>
            </div>
            <div class="box">
                <h3>Approved Leave Requests</h3>
                <p>10</p>
            </div>
            <div class="box">
                <h3>Rejected Leave Requests</h3>
                <p>15</p>
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
</body>

</html>
