package ELM.java.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import ELM.java.DAO.UserDao;

@WebServlet("/admin-user-creation")
public class Admin_UserCreationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("admin_UserCreation.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("name");
		 String email=request.getParameter("email");
		 String rule=request.getParameter("rule");
		 String department=request.getParameter("department");
		 String password=request.getParameter("pass");
		 String conPassword=request.getParameter("con_pass");
		 int leave_day=Integer.parseInt(request.getParameter("leave-day"));
		 
		 RequestDispatcher rd = null;
		 
		// Assuming you have a DAO class for database operations
	        UserDao userDAO = new UserDao();
	        boolean success =userDAO.adminCreateUser(name, email, rule, department, password, conPassword, leave_day);
	        
	        if (success) {
	        	request.setAttribute("status", "sucess");
	        	rd = request.getRequestDispatcher("admin_UserCreation.jsp");
	        } else {
	        	request.setAttribute("status", "failed");
	        }
	        rd.forward(request, response);
	}

}
