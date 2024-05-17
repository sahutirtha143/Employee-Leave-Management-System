
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ELM.java.Model.*"%>
<%@page import="java.util.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@page import="ELM.java.Connection.*"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");
 List<ApplyLeave> allLeaves=null; 
 allLeaves = (List<ApplyLeave>) request.getAttribute("allLeaves");
if (auth != null) {
	request.setAttribute("auth", auth);
	/* leave=new LeaveDao(DbCon.getConnection()).getLeavesByUserId(auth.getId()); */ 
	allLeaves=new LeaveDao(DbCon.getConnection()).getLeavesByUserId(auth.getId());
}
/* else{
	response.sendRedirect("login.jsp");
} */
%>
<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Employee Leave Calendar</title>
    <%@include file="includes/header.jsp"%>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
        
    
<style>
  #calendar {
            width: 80%;
            margin: 5vh auto;
            /* margin-bottom: 5vh; */
        }
    /* Decrease the size of the date boxes */
    .fc-daygrid-day-frame {
      padding: 1px !important;  /* Adjust the padding as needed */
    }
    .fc-daygrid-day-number {
        font-size: 25px !important; /* Adjust the font size as needed */
    }
    .fc-daygrid-event {
        font-size: 20px !important; /* Adjust the event font size as needed */
    }
</style>

     <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
         /*    calendarEl.style.width = '80%';
            calendarEl.style.marginBottom = '15vh'; 
            calendarEl.style.margin = '0 auto';  */
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

 <h1 style="text-align: center; font-size: 50px; margin-top: 5vh; margin-bottom: 5vh;">Employee Leave Calendar</h1>
<a href="emp-leave-calendar?id=<%=auth.getId()%>" class="btn btn-dark" style="padding: 1.7rem 1.7rem; display: none;">view Calander</a>                     
    <div id='calendar'></div>
    <div id="footer"
		style="background-color: black; width: 100%; height:16vh;">
		<div style="width: 90%; margin: auto auto; display:flex; justify-content: space-between; padding-top: 5vh;">
			<p style="font-size: 15px;">ELM: Employee Leave Management</p>
			<p style="font-size: 15px;">Created By: Tirtha Sahu</p>
			</div>
		</div>
    	<%@include file="includes/footer.jsp"%>
</body>
</html>

