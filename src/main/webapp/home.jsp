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
<title>Insert title here</title>
 <!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css"> 

 <!-- Main css -->
<link rel="stylesheet" href="css/style.css"> 

<!-- <link rel="stylesheet" href="includes/style.css"> -->

<%@include file="includes/header.jsp" %>

</head>
<body style="width: 100%;">
	<%@include file="includes/navbar.jsp"%>


<section class="rev_slider_wrapper thm-banner-wrapper" id="home" >
		<div id="slider1" class="rev_slider" data-version="5.0" style="min-height: 80vh;">
			<ul>
				<li data-transition="parallaxvertical" data-ease="SlowMo.ease">
					<img src="images/home/home10.png" alt="Crop Background">
					<div class="tp-caption sfb tp-resizeme caption-h1" data-x="left"
						data-hoffset="0" data-y="top" data-voffset="188"
						data-whitespace="nowrap" data-transform_idle="o:1;"
						data-transform_in="o:0" data-transform_out="o:0" data-start="500"
						style="color: black;">ELM</div>
					<div class="tp-caption sfb tp-resizeme caption-p" data-x="left"
						data-hoffset="33" data-y="top" data-voffset="315"
						data-whitespace="nowrap" data-transform_idle="o:1;"
						data-transform_in="o:0" data-transform_out="o:0" data-start="1000"
						style="color: black; font-size: 40px; font-weight: 700;">
						"ELM - <strong style="color: black; font-size: 30px;">Employee
							Leave Management</strong>."
					</div>

				</li>

				<li data-transition="parallaxvertical" data-ease="SlowMo.ease">
					<img src="images/home/home8.jpg" alt="Farms">

					<div class="tp-caption sfl tp-resizeme" data-x="left"
						data-hoffset="0" data-y="top" data-voffset="500"
						data-whitespace="nowrap" data-transform_idle="o:1;"
						data-transform_in="o:0" data-transform_out="o:0" data-start="1500">
					</div>
				</li>
				<li data-transition="parallaxvertical" data-ease="SlowMo.ease">
					<img src="images/home/home7.jpg" alt="crop">

					<div class="tp-caption sfl tp-resizeme" data-x="left"
						data-hoffset="0" data-y="top" data-voffset="500"
						data-whitespace="nowrap" data-transform_idle="o:1;"
						data-transform_in="o:0" data-transform_out="o:0" data-start="1500">
						<!--<a href="about.html" class="thm-btn">About Us <i class="fa fa-arrow-right"></i></a>-->
					</div>
				</li>

				<li data-transition="parallaxvertical" data-ease="SlowMo.ease">
					<img src="images/home/home8.jpg" alt="farms">

					<div class="tp-caption sfl tp-resizeme" data-x="right"
						data-hoffset="460" data-y="top" data-voffset="360"
						data-whitespace="nowrap" data-transform_idle="o:1;"
						data-transform_in="o:0" data-transform_out="o:0" data-start="1500">
						<!--<a href="https://www.vitbhopal.ac.in/" class="thm-btn inverse">VIT Bhopal <i class="fa fa-arrow-right"></i></a>-->
					</div>
				</li>
			</ul>
		</div>
		



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

	<!-- <section class="welcome-services home-one">
		<div class="thm-container">
			<div class="sec-title">
				<h2><span>Features</span></h2>
				<p>All the features that are provided by this website.</p>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="welcome-single-services">
						<div class="img-box">
							<img src="images/welcome-services/18.jpg" alt="weather">
						</div>
						<div class="text-box">
							<div class="content">
								<h3>Weather Report</h3>
								<p>Get all information needed on the weather of your current location or by searching
									for the location.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="welcome-single-services">
						<div class="img-box">
							<img src="images/welcome-services/2.jpg" alt="seed">
						</div>
						<div class="text-box">
							<div class="content">
								<h3>Seed Price & Info</h3>
								<p>Realtime Seed Price along with all the Knowledge you need about different types of
									seeds</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="welcome-single-services">
						<div class="img-box">
							<img src="images/welcome-services/19.png" alt="Govt Schemes">
						</div>
						<div class="text-box">
							<div class="content">
								<h3>Goverment Schemes</h3>
								<p>Latest Government Schemes for maximizing the benefits and minimizing the loss.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="welcome-single-services">
						<div class="img-box">
							<img src="images/welcome-services/3.jpg" alt="Tech">
						</div>
						<div class="text-box">
							<div class="content">
								<h3>Technological Knowledge</h3>
								<p>The knowledge you need to enhance your crop production: Solar Panel, etc.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="welcome-single-services">
						<div class="img-box">
							<img src="images/welcome-services/5.jpg" alt="Internet">
						</div>
						<div class="text-box">
							<div class="content">
								<h3>Low Internet Consumption</h3>
								<p>Even with poor internet connectivity, you can access this website.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="welcome-single-services">
						<div class="img-box">
							<img src="images/welcome-services/7.jpg" alt="Ui Ux">
						</div>
						<div class="text-box">
							<div class="content">
								<h3>Easy to Use</h3>
								<p>Simple visuals are used making it easy to understand.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<footer id="footer" class="sec-padding">
		<div class="thm-container">
			<div class="row">
				<div class="col-md-4 col-sm-6 footer-widget">
					<div class="about-widget">
						<a href="index.html"><img style="height: 150px;" src="images/footer-logo.png" alt="logo" /></a>
						<p>All You Need for Agronomy</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 footer-widget">
					<div class="pl-30">
						<div class="title" style="color: #05f7c2;">
							<h2><span>"If the farmer is rich, then so is the nation."</span></h2>
							<br>
							<p><strong>- Amit Kalantri</strong></p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 footer-widget">
				</div>
			</div>
		</div>
	</footer> -->

	<div id="footerr"
		style="background-color: black; width: 100%; height:16vh;">
		<div style="width: 90%; margin: auto auto; display:flex; justify-content: space-between; padding-top: 5vh;">
			<p style="font-size: 15px;">ELM: Employee Leave Management</p>
			<p style="font-size: 15px;">Created By: Tirtha Sahu</p>
			</div>
		</div>


	
	
<%@include file="includes/footer.jsp" %>
</body>
</html>