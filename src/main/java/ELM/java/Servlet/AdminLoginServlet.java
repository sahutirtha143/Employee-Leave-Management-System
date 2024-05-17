package ELM.java.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import ELM.java.DAO.UserDao;
import ELM.java.Model.Users;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("adminLogin.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String role = request.getParameter("rule");
		System.out.println("Role : " + role);
		String email = request.getParameter("useremail");
		String password = request.getParameter("userpassword");
		
		UserDao udao = new UserDao();
		Users user = udao.userLogin(email, password);

		String str1 = user.getRole();
		String str2="Manager";
		try {
		if(user!=null) {
		if (role != null) {
			
			if (role.equals("Manager") && str1.equals("Manager")) {
				System.out.println("Go to the admin login page: " + role);
				out.print("user login sucessfully");
				System.out.println("Login in sucessfully");
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("admin.jsp");
			} else {
				System.out.println("Mismatch between selected role and user's role in the database"+ str1);
				out.print("Mismatch between selected role and user's role in the database");
			}
		} else {	
			out.print("user singnup failed");
		}
		}else {
			System.out.println("Login unsucessfully");
		}

		

			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
