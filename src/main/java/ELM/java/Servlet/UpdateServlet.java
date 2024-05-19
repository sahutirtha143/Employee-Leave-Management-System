package ELM.java.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ELM.java.Connection.DbCon;
import ELM.java.DAO.LeaveDao;
import ELM.java.DAO.UserDao;
import ELM.java.Model.Users;

@WebServlet("/update-servlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("employeeUpdate.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int id = Integer.parseInt(request.getParameter("userId"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String role = request.getParameter("rule");
		String department = request.getParameter("department");

		UserDao userDao = new UserDao();
		Users user = new Users(id, name, email, role, department);
		boolean isUpdated = userDao.updateUser(user);

		if (isUpdated) {
			response.sendRedirect("employeeUpdate.jsp?success=true");
		} else {
			response.sendRedirect("employeeUpdate.jsp?success=false");
		}
		
		
		/*
		 * int userId = Integer.parseInt(request.getParameter("userId")); String name =
		 * request.getParameter("name"); String email = request.getParameter("email");
		 * String role=request.getParameter("rule"); String
		 * department=request.getParameter("department");
		 * 
		 * Connection con; PreparedStatement pst; try {
		 * Class.forName("com.mysql.cj.jdbc.Driver"); con=DriverManager.getConnection(
		 * "jdbc:mysql://localhost:3307/employeelm?useSSL=false","root","2112");
		 * pst=con.
		 * prepareStatement("UPDATE users SET name=?, email=?,rule=?,department=? where id=?"
		 * ); pst.setString(1, name); pst.setString(2, email); pst.setString(3, role);
		 * pst.setString(4, department); pst.setInt(5, userId); pst.executeUpdate();
		 * response.sendRedirect("employee.jsp");
		 * 
		 * 
		 * 
		 * } catch (Exception e) { // TODO: handle exception e.printStackTrace(); }
		 */
	}

}
