package ELM.java.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import ELM.java.DAO.UserDao;
import ELM.java.Model.ApplyLeave;
import ELM.java.Model.Users;

@WebServlet("/go-to-view-user-list")
public class Admin_UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Users auth = (Users) request.getSession().getAttribute("auth");
		ArrayList<Users> user_list = (ArrayList<Users>) request.getSession().getAttribute("user-list");
		
		String role = request.getParameter("rule");
		
		System.out.println("Role : " + role);
		
	
		try {

			if (user_list != null && auth != null) {
				for (Users u : user_list) {
					
					Users users = new Users();
					users.setId(u.getId());
					users.setEmail(u.getEmail());
					users.setRole(u.getRole());
					users.setDepartment(u.getDepartment());
					users.setLeaveDay(u.getLeaveDay());
					UserDao udao = new UserDao();
					List<Users> listUser = udao.selectAllUsers(users);
				}
				response.sendRedirect("adminLogin.jsp");
			} else {
				if (auth != null) {
					response.sendRedirect("login.jsp");
				} else {
					response.sendRedirect("registration.jsp");
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
