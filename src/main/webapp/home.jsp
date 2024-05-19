<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="ELM.java.Model.*"%>
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
<title>Insert title here</title>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<!-- <link rel="stylesheet" href="includes/style.css"> -->

<%@include file="includes/header.jsp"%>

<style>
body, html {
	overflow-x: hidden;
}

.home-page, .carousel-inner img {
	width: 100%;
	height: auto;
}

.home-heading {
	position: absolute;
	top: 15%;
	left: 35.5%;
	transform: translate(-50%, -50%);
	/* text-align: left; */
}

.home-heading h1 {
	font-size: 50px;
	color: black;
	font-weight: 700;
}
#footer {
	background-color: black;
	width: 100%;
	height: 16vh;
	/*  position: fixed;
    bottom: 0; */
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
	margin-top: 3vh;
	font-size: 15px;
	color: white;
}

.form-title {
	width: 100%;
	text-align: center;
	font-size: 50px;
	margin-top: 6vh;
}
</style>

</head>
<body style="width: 100%;">
	<%@include file="includes/navbar.jsp"%>

	<section class="home-page">
		<div id="homePageCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#homePageCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#homePageCarousel" data-slide-to="1"></li>
				<li data-target="#homePageCarousel" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/home/home10.png" alt="Image 1"
						class="d-block w-100">
					<div class="home-heading">
						<h1>
							<!-- <span>ELM </span> 
							<span>Employee Leave Management System</span> -->
							<div>ELM </div>
							<div style="color: green;">Employee Leave Management System</div>
						</h1>
						
					</div>
				
					<div class="carousel-caption">
						<h3>Home Image 1</h3>
						<!-- <p>Description for Image 1</p>  -->
					</div>
				</div>
				<div class="carousel-item">
					<img src="images/home/home15.jpg" alt="Image 2"
						class="d-block w-100">
					<div class="carousel-caption">
						<h3>Home Image 2</h3>
						<!-- <p>Description for Image 2</p> -->
					</div>
				</div>
				<div class="carousel-item">
					<img src="images/home/home20.jpg" alt="Image 3"
						class="d-block w-100">
					<div class="carousel-caption">
						<h3>Home Image 3</h3>
					<!-- 	<p>Description for Image 3</p> -->
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#homePageCarousel"
				data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#homePageCarousel"
				data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</section>

	<section class="about-info-box sec-padding" id="home">
		<div class="thm-container">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<div class="sec-title">
						<h2>
							<span>What is ELM</span>
						</h2>
						<ul class="bulleted-list">
							<li><i class="fa fa-arrow-circle-right"></i>Employee leave
								management is a system designed to streamline and automate the
								process of managing employee leave requests within an
								organization. It facilitates efficient tracking, approval, and
								monitoring of employee leave, ensuring smooth operation and
								compliance with company policies.</li>
						</ul>
						<h2>
							<span>What does ELM means?</span>
						</h2>
						<ul class="bulleted-list">
							<li><i class="fa fa-arrow-circle-right"></i> ELM - Employee
								Leave Management</li>
							<li><i class="fa fa-arrow-circle-right"></i>The Employee Leave Management System is basically an online
							platform for managing and tracking employee leave requests and
							balances</li>
						</ul>
						<h2>
							<span>Reasons to Use ELM</span>
						</h2>
						<ul class="bulleted-list">
							<li><i class="fa fa-arrow-circle-right"></i>Efficient
								resource allocation, compliance assurance, and enhanced
								employee experience.</li>
							<li><i class="fa fa-arrow-circle-right"></i> Streamlined
								leave tracking promotes efficient resource allocation, ensures
								compliance, and enhances employee satisfaction.</li>
							<li><i class="fa fa-arrow-circle-right"></i> Automated leave
								management optimizes resource allocation, ensures compliance,
								and boosts employee satisfaction.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="footer">
		<div>
			<p>ELM: Employee Leave Management</p>
			<p>Created By: Tirtha Sahu</p>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>

	<!-- jQuery, Popper.js, and Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
