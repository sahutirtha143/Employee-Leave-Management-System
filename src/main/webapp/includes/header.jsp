<style>
.header {
	width: 100%;
	height: 12vh;
	display: flex;
	justify-content: space-between;
	align-items:center;
	background-color: black;
	padding: 10px 30px;
	/* z-index: 100;
	position: fixed;
	top: 0;
	left: 0; */
	overflow: hidden;
}

.header a {
	float: left;
	color: white;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

.header a.logo {
	font-size: 55px;
	font-weight: bold;
	
}

.header a.logo:hover {
	background-color:black;
}

.header a:hover {
	background-color: rgb(86, 246, 11);
	color: black;
}

.header a.active {
	background-color: dodgerblue;
	color: white;
}

.header-right {
	float: right;
	display: flex;
}

.subnav {
	float: left;
	overflow: hidden;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

.subnav .subnavbtn {
	border: none;
	outline: none;
	color: white;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

.subnav-content {
	display: none;
	position: absolute;
	background-color: black;
	z-index: 1;
}

.subnav-content a {
	float: left;
	color: white;
	text-decoration: none;
}

.subnav-content a:hover {
	background-color: rgb(6, 240, 26);
	color: black;
}

.subnav:hover .subnav-content {
	display: block;
}
</style>

<meta name="viewport" content="width=device-width , initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- viewport meta -->
<meta name="FARMPRO" content="All You Need for Agronomy">

<!-- styles -->
<!-- helpers -->
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
<!-- fontawesome css -->
<link rel="stylesheet"
	href="plugins/font-awesome/css/font-awesome.min.css">
<!-- strock gap icons -->
<link rel="stylesheet" href="plugins/Stroke-Gap-Icons-Webfont/style.css">
<!-- revolution slider css -->
<link rel="stylesheet" href="plugins/revolution/css/settings.css">
<link rel="stylesheet" href="plugins/revolution/css/layers.css">
<link rel="stylesheet" href="plugins/revolution/css/navigation.css">
<!-- flaticon css -->
<link rel="stylesheet" href="plugins/flaticon/flaticon.css">
<!-- jQuery ui css -->
<link href="plugins/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<!-- owl carousel css -->
<link rel="stylesheet"
	href="plugins/owl.carousel-2/assets/owl.carousel.css">
<link rel="stylesheet"
	href="plugins/owl.carousel-2/assets/owl.theme.default.min.css">
<!-- animate css -->
<link rel="stylesheet" href="plugins/animate.min.css">
<!-- fancybox -->
<link rel="stylesheet"
	href="plugins/fancyapps-fancyBox/source/jquery.fancybox.css">
<link rel="icon" href="images/aynaLogo.png" type="image/gif"
	sizes="16x16">


<!-- master stylesheet -->
<link rel="stylesheet" href="css1/style.css">
<!-- responsive stylesheet -->
<link rel="stylesheet" href="css1/responsive.css">



