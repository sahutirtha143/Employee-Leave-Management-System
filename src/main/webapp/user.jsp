<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<%@page import="ELM.java.Model.*" %>
		<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>user</title>

<!-- INCLUDE PAGES HEAD-->
<%@include file="includes/header.jsp"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	/* background: linear-gradient(90deg, #ff9c15, #47915b); */
	background-image: url('images/slider/12.jpeg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

.container {
	width: 100%;
	height: 80vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	width: 400px;
	background: linear-gradient(90deg, #ff9c15, #47915b);
	border: none;
	cursor: pointer;
	transition: all 0.5s;
}

.image img {
	transition: all 0.5s;
	clip-path: circle(50%);
}

.card:hover .image img {
	transform: scale(1.5);
}

.btn {
	height: 130px;
	width: 130px;
	border-radius: 90%;
	overflow: hidden;
}

.name {
	font-size: 22px;
	font-weight: bold
}

.idd {
	font-size: 14px;
	font-weight: 600
}

.idd1 {
	font-size: 12px
}

.number {
	font-size: 22px;
	font-weight: bold
}

.follow {
	font-size: 12px;
	font-weight: 500;
	color: #444444
}

.btn1 {
	height: 40px;
	width: 150px;
	border: none;
	background: linear-gradient(to right, #ff9c15, #47915b);
	color: #222;
	font-size: 15px
}

.text span {
	font-size: 13px;
	background: linear-gradient(to left, #ff9c15, #47915b);
	color: #545454;
	font-weight: 500
}

.icons i {
	font-size: 19px
}

hr .new1 {
	border: 1px solid
}

.join {
	font-size: 14px;
	background: linear-gradient(to right, #ff9c15, #47915b);
	color: black;
	font-weight: bold
}

.date {
	background-color: #ccc
}

#lo {
	text-decoration: none;
	text-align: center;
}
</style>
</head>
<body style="background-color: #10151B;">

	<!-- Start mainmenu -->
	<%-- <%@include file="includes/navbar.jsp"%> --%>
	<%@include file="includes/navbar.jsp"%>
	<!-- End mainmenu -->

	<div class="container mt-4 mb-4 p-3 d-flex justify-content-center">
		<div class="card p-4">
			<div
				class=" image d-flex flex-column justify-content-center align-items-center">
				<button class="btn btn-secondary">
					<img src="images/baba.jpg" height="100" width="100" />
				</button>
				<span class="name mt-3"><%=auth.getName()%></span> <span class="idd">@<%=auth.getName()+auth.getId()%></span>
				<div
					class="d-flex flex-row justify-content-center align-items-center gap-2">
					<!-- 			<span class="idd1">Oxc4c16a645_b21a</span> <span><i
						class="fa fa-copy"></i></span> -->
				</div>
				<div
					class="d-flex flex-row justify-content-center align-items-center mt-3">
					<span class="number">2121 <span class="follow">Followers</span></span>
				</div>
				<div class=" d-flex mt-2">
					<!-- <button class="btn1 btn-dark">Edit Profile</button> -->
					<a class="btn1 btn-dark" href="employeeUpdate.jsp?id=<%= auth.getId()%>" style="text-decoration: none; text-align: center; margin-top: 1rem; padding-top: 9px;">Edit Profile</a>
				</div>
				<div class=" d-flex mt-2" style="align-items: center;">
					<!-- 	<button class="btn1 btn-dark">My Orders</button> -->
					<!-- <a href="myOrders.jsp" class="btn1 btn-dark"
						style="text-decoration: none; text-align: center;">My Orders</a> -->
				</div>
				<div class=" d-flex mt-2">
					<!-- <button class="btn1 btn-dark" type="submit" name="log-out">LogOut</button> -->
					<a class="btn1 btn-dark" id="lo" href="log-out" style="text-decoration: none; text-align: center; margin-top: 1rem; padding-top: 9px;">Logout</a>
				</div>
				
				<div class=" d-flex mt-2">
					<!-- <button class="btn1 btn-dark" type="submit" name="log-out">LogOut</button> -->
					<a class="btn1 btn-dark" id="lo" href="delete-user?id=<%=auth.getId() %>" style="text-decoration: none; text-align: center; margin-top: 1rem; padding-top: 9px;">Delete</a>
				</div>
				<!-- <div class="text mt-3"> <span>Eleanor Pena is a creator of minimalistic x bold graphics and digital
                        artwork.<br><br> Artist/ Creative Director by Day #NFT minting@ with FND night. </span> </div> -->
				<div
					class="gap-3 mt-3 icons d-flex flex-row justify-content-center align-items-center">
					<span><i class="fa fa-twitter"></i></span> <span><i
						class="fa fa-facebook-f"></i></span> <span><i
						class="fa fa-instagram"></i></span> <span><i
						class="fa fa-linkedin"></i></span>
				</div>
				<div class=" px-2 rounded mt-4 date ">
					<span class="join">Joined May,2024</span>
				</div>
			</div>
		</div>
	</div>

	<!-- INCLUDE PAGES FOOTER -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>