package ELM.java.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

import ELM.java.DAO.LeaveDao;
import ELM.java.Connection.*;
@WebServlet("/decline-leave")
public class DeclineLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()) {
			String id=request.getParameter("id");
			if(id!=null) {
				LeaveDao orderDao=new LeaveDao(DbCon.getConnection());
				orderDao.declineLeave(Integer.parseInt(id));
			}
			response.sendRedirect("viewLeave.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
