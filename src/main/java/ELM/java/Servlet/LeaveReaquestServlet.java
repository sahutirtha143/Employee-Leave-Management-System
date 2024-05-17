package ELM.java.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;

import ELM.java.DAO.LeaveDao;
import ELM.java.Model.ApplyLeave;
import ELM.java.Model.Users;

@WebServlet("/ApplyLeaveServlet")
public class LeaveReaquestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private LeaveDao leaveDao;

	    @Override
	    public void init() throws ServletException {
	        super.init();
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/employeelm", "root", "2112");
	            leaveDao = new LeaveDao(connection);
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }
	    }
	

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
            response.sendRedirect("leave.jsp");
            
    }
	    
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int userId = Integer.parseInt(request.getParameter("userId")); // Assuming you have userId parameter in your JSP
	        Date startDate = Date.valueOf(request.getParameter("startDate"));
	        Date endDate = Date.valueOf(request.getParameter("endDate"));
	        String type=request.getParameter("type");
	        String reason = request.getParameter("reason");

	        ApplyLeave leave = new ApplyLeave();
	        leave.setId(userId);
	        leave.setStartDate(startDate);
	        leave.setEndDate(endDate);
	        leave.setType(type);
	        leave.setReason(reason);
	        leave.setStatus("Pending");

	        if (leaveDao.addLeaveRequest(leave)) {
	            response.sendRedirect("leave.jsp?success=true");
	        } else {
	            response.sendRedirect("leave.jsp?success=false");
	        }
	    }
}
