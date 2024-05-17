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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import ELM.java.Connection.DbCon;
import ELM.java.DAO.UserDao;
import ELM.java.Model.Users;

@WebServlet("/signUp")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("registration.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		 response.setContentType("text/html");
//		 PrintWriter out=response.getWriter();
//		 
//		 String name = request.getParameter("name");
//		 String email=request.getParameter("email");
//		 String password=request.getParameter("pass");
//		 String conPassword=request.getParameter("con_pass");
//		 String contact=request.getParameter("contact");
//		

//			UserDao udao=new UserDao(DbCon.getConnection());
//			Users employee=new Users();
//			
	
	     String name = request.getParameter("name");
		 String email=request.getParameter("email");
		 String rule=request.getParameter("rule");
		 String department=request.getParameter("department");
		 String password=request.getParameter("pass");
		 String conPassword=request.getParameter("con_pass");
		 RequestDispatcher rd = null;
		 

	        // Assuming you have a DAO class for database operations
	        UserDao userDAO = new UserDao();
	        boolean success = userDAO.registerUser(name, email,rule,department, password, conPassword);
	       
	        if (success) {
	        	request.setAttribute("status", "sucess");
	        	rd = request.getRequestDispatcher("registration.jsp");
	        } else {
	        	request.setAttribute("status", "failed");
	        }
	        rd.forward(request, response);
	}

}
