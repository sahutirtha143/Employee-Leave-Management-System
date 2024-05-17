package ELM.java.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import ELM.java.Connection.DbCon;
import ELM.java.DAO.LeaveDao;

@WebServlet("/updateStatusDeclined")
public class Admin_StatusDeclinedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("admin_LeaveAuthorize.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int l_id = Integer.parseInt(request.getParameter("l_id"));
        String status = "Declined";
		
		try {
			
				LeaveDao ldao=new LeaveDao(DbCon.getConnection());
				ldao.updateStatusDeclined(l_id, status);
				
				response.sendRedirect("admin_LeaveAuthorize.jsp");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
