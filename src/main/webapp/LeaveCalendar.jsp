<%@page import="ELM.java.Connection.DbCon"%>
<%@page import="ELM.java.Model.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@ page import="jakarta.servlet.http.*"%>
<%@ page import="jakarta.servlet.*"%>
<%@ page import="java.io.*"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");
List<ApplyLeave> allLeaves = null;
allLeaves = (List<ApplyLeave>) request.getAttribute("allLeaves");
if (auth != null) {
    request.setAttribute("auth", auth);
    allLeaves = new LeaveDao(DbCon.getConnection()).getLeavesByUserId(auth.getId());
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

<!-- SWEET ALERT CSS CDN -->
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link rel="stylesheet" href="includes/style.css"></link>

<!-- CALENDAR -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
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
    padding: 2rem 2rem;;
}

#side_bar {
    width: 20vw;
    background-color: #c0c0c0;
    position: fixed;
    height: 100%; /* Full height of the viewport */
    overflow: auto;
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

.sub-container {
    width: 80vw;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 40vh;
}

.box {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.9);
    text-align: center;
    margin: 10px;
    width: 172px;
    height: 20vh;
}

.box h3 {
    margin-top: 0;
    color: #333333;
}

.box p {
    font-size: 24px;
    font-weight: bold;
    color: green;
}

#calendar {
    width: 80%;
    margin: 5vh auto;
    background-color: #10151B;
}
/* Decrease the size of the date boxes */
.fc-daygrid-day-frame {
    padding: 1px !important; /* Adjust the padding as needed */
}
.fc-daygrid-day-number {
    font-size: 25px !important; /* Adjust the font size as needed */
    color: white;
}
.fc-daygrid-event {
    font-size: 20px !important; /* Adjust the event font size as needed */
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title', // This centers the title
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        events: [
            <%       
                for (ApplyLeave leave : allLeaves) {
                    String title = leave.getType() + " - " + leave.getReason();
                    String start = leave.getStartDate().toString();
                    String end = leave.getEndDate().toString();
                    String color = "blue";  // Default color for leave
                    if (leave.getType().equals("Sick Leave")) {
                        color = "red";
                    } else if (leave.getType().equals("Vacation Leave")) {
                        color = "green";
                    }
            %>
            {
                title: "<%= title %>",
                start: "<%= start %>",
                end: "<%= end %>",
                color: "<%= color %>"
            },
            <% } %>
        ]
    });
    calendar.render();
});
</script>
</head>

<body>
    <%@include file="includes/navbar.jsp"%>

    <div id="container">
        <div id="side_bar">
            <ul class="sidePanel">
                <li class="menu_head"
                    style="font-size: 30px; margin: 2rem 0; font-weight: 900; padding-left: 2rem;">Controls</li>
                <li><a href="employee.jsp">About Employee</a></li>
                <li><a href="employeeUpdate.jsp?id=<%=auth.getId()%>">Update Employee</a></li>
                <li><a href="leave.jsp">Apply Leave</a></li>
                <li><a href="viewLeave.jsp">View Leave History</a></li>
                <li><a href="emp_BalanceLeave.jsp">View Balance Leave</a></li>
                <li><a href="LeaveCalendar.jsp">Calender</a></li>
            </ul>
        </div>

        <div id="content_panel" >
            <h1 style="text-align: center; font-size: 50px; margin-top: 5vh; margin-bottom: 5vh;">Employee Leave Calendar</h1>
            <a href="emp-leave-calendar?id=<%=auth.getId()%>" class="btn btn-dark" style="padding: 1.7rem 1.7rem; display: none;">view Calendar</a>
            <div id='calendar'></div>
        </div>
    </div>
    <div id="footer">
        <div>
            <p>ELM: Employee Leave Management</p>
            <p>Created By: Tirtha Sahu</p>
        </div>
    </div>

    <%@include file="includes/footer.jsp"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
</body>

</html>
