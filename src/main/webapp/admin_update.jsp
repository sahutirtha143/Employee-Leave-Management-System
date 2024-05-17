
<%@page import="ELM.java.Model.*"%>
<%@page import="java.util.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@page import="ELM.java.Connection.*"%>
<%@page import="java.sql.*"%>

<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

/*  ArrayList<ApplyLeave> leave_List = (ArrayList<ApplyLeave>) session.getAttribute("leave-list"); 
LeaveDao ld = new LeaveDao(DbCon.getConnection());*/
ApplyLeave leave = new ApplyLeave();

/* List<ApplyLeave> leaves = ld.addLeaveRequest(leave); */
String ID = request.getParameter("id");
Integer empId = Integer.parseInt(ID);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/employeelm?useSSL=false", "root", "2112");
Statement stm = con.createStatement();
String sql = "select * from users where id='" + empId + "'";
ResultSet rs = stm.executeQuery(sql);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Employee Leave Page</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">

    <!-- SWEET ALERT CSS CDN -->
    <link rel="stylesheet" href="alert/dist/sweetalert.css">

    <style>
        .form-group{
            padding-right: 2rem;
        }
 /*        .zmdi{
width:35vw;
} */
    </style>
</head>

<body style="min-height: 100vh; position: fixed;">

    <!-- <input type="hidden" id="status" value="<%= request.getAttribute("status") %>"> -->

    <div class="main">

        <!-- Sign up form -->
        <section class="signup" style="">
            <div class="container" style="height: 72vh; width:50vw; margin-left: 25VW;">
            <%
			String success = request.getParameter("success");
			if (success != null) {
				if (success.equals("true")) {
					out.println("<p style='color:green;'>User updated successfully!</p>");
				} else {
					out.println("<p style='color:red;'>Failed to update user. Please try again.</p>");
				}
			}
			%>
                <div class="signup-content" style="margin-top:5vh ; margin-left: 1.6rem;">
                    <div class="signup-form" style="width:35vw;">
                        <h2 class="form-title" style="width: 50vw; margin-bottom: 3vh;">Update Employee</h2>
    
                        <form method="post" action="admin-update-servlet" class="register-form"
                            id="register-form" style="width:35vw;" >
                         <%
						while (rs.next()) {
						%>
                            <!-- <div class="main1"
                                style="display: flex; justify-content: space-around; width: 100%;">
                                <div class="main2" style=""> -->
                            <div class="form-group" style="display: none;">
                                <label for="name"><i class="zmdi zmdi-accounts-list"></i></label>
                                <input type="hidden" name="userId" id="name"
                                    value="<%=rs.getInt("id")%>" placeholder="Enter ID" />
                            </div>
                            <div class="form-group" style="">
                                <label for="name"><i class="zmdi zmdi-accounts-list"></i></label>
                                <input type="text" name="name" id="name"
                                    value="<%=rs.getString("name")%>" placeholder="Enter Name" />
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-accounts-list"></i></label>
                                <input type="text" name="email" id="email"
                                    value="<%=rs.getString("email")%>" placeholder="Enter Email" />
                            </div>
    
                            <div class="form-group">
                                <label for="" style="padding-right: 2rem;"><i
                                    class="zmdi zmdi-caret-down-circle"></i></label> <select name="rule"
                                    style="width:33vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
                                    <option value="">Select Rule</option>
                                    <option value="Employee">Employee</option>
                                    <option value="Manager">Manager</option>
    
                                </select>
                            </div>
    
                            <!-- <!-- </div>
                                <div class="main3"> -->
                            <div class="form-group">
                                <label for="" style=""><i
                                    class="zmdi zmdi-caret-down-circle"></i></label> <select
                                    name="department"
                                    style="width:33vw; height: 5vh; padding-left: 1.5rem; border: none; border-bottom: 1px solid #999">
                                    <option value="">Select Department</option>
                                    <option value="HR">Human Resources</option>
                                    <option value="IT">Information Technology</option>
                                    <option value="FIN">Finance</option>
                                    <option value="ENG">Engineering</option>
                                </select>
                            </div>
    
                        <%
						}
						%>
    
                            <div class="form-group form-button" style="margin-bottom: 2rem;">
                                <!-- 								<div class="form-group form-button"
                                        style="position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%);"> -->
                                <input type="submit" name="signup" id="signup"
                                    class="form-submit" value="Update" />
                            </div>
                            <!-- 	</div>
                            </div> -->
                        </form>
                    </div>
                </div>
    
            </div>
        </section>


    </div>
    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <!-- 	
	
	//SWEET ALERT BY JS
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	if(status == "sucess"){
		swal("Congrats","Account created sucessfully","sucess");
	}
	
	</script> -->




</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>