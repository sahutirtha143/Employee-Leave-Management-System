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

@WebServlet("/admin-update-servlet")
public class Admin_UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("admin_EmployeeList.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int userId = Integer.parseInt(request.getParameter("userId"));
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String role=request.getParameter("rule");
	        String department=request.getParameter("department");
//	        String password = request.getParameter("password");
//	        String conpassword = request.getParameter("conpassword");
	        
	        Connection con;
	        PreparedStatement pst;

//	        Users user = new Users();
//	        user.setId(userId);
//	        user.setName(name);
//	        user.setEmail(email);
//	        user.setRule(rule);
//	        user.setDepartment(department);
//	        user.setPassword(password);
//	        user.setConPassword(conpassword);
	        
			/*
			 * UserDao userDao=new UserDao(); try { if (userDao.updateUser(user)) {
			 * response.sendRedirect("employeeUpdate.jsp?success=true"); } else {
			 * response.sendRedirect("employeeUpdate.jsp?success=false"); } } catch
			 * (SQLException e) { // TODO Auto-generated catch block e.printStackTrace();
			 * System.out.println("Error1"+e.getMessage()); } catch (IOException e) { //
			 * TODO Auto-generated catch block e.printStackTrace();
			 * System.out.println("Error2"+e.getMessage());
			 * 
			 * }
			 */
	        try {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3307/employeelm?useSSL=false","root","2112");
				 pst=con.prepareStatement("UPDATE users SET name=?, email=?,rule=?,department=? where id=?");
				 pst.setString(1, name);
				 pst.setString(2, email);
				 pst.setString(3, role);
				 pst.setString(4, department);
				 pst.setInt(5, userId);
				 pst.executeUpdate();
				 response.sendRedirect("admin_EmployeeList.jsp");
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	}

}
