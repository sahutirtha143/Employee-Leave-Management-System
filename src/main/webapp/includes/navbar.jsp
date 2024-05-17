<header>
	<div class="header">
		<a href="home.jsp" class="logo"><img
			style="height: 100px; width: 100px;" src="images/logo/logo3.png"
			alt="logo"></a>

		<div class="header-right" style="display: flex; align-items: center;">

			<a href="home.jsp">Home</a>
			<%
			if (auth != null) {
			%>
			<a href="user.jsp">Profile</a>
			<a href="employee.jsp">About Employee</a>

			<%
			} else {
			%>
			<div class="subnav">
				<button class="subnavbtn">
					Register<i class="#"></i>
				</button>
				<div class="subnav-content">
					<li><a href="registration.jsp">SignUp</a></li>
					<li><a href="login.jsp">SignIn </a></li>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</header>