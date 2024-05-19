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

import ELM.java.DAO.UserDao;
import ELM.java.Model.Users;

@WebServlet("/admin-update-servlet")
public class Admin_UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("admin_EmployeeList.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("userId"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String role = request.getParameter("rule");
		String department = request.getParameter("department");

		Users user = new Users(id, name, email, role, department);
		UserDao userDao = new UserDao();
		boolean rowUpdated = userDao.updateUser(user);

		if (rowUpdated) {
			response.sendRedirect("admin_EmployeeList.jsp");
		} else {
			response.sendRedirect("admin_update.jsp");
		}

	}
}