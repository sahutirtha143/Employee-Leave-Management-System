package ELM.java.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import ELM.java.Connection.DbCon;
import ELM.java.DAO.LeaveDao;
import ELM.java.Model.ApplyLeave;
import ELM.java.Model.Users;

@WebServlet("/admin-leave-authorize")
public class Admin_LeaveAutorizeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//	try {
//		 LeaveDao lDao=new LeaveDao(DbCon.getConnection());
//		 List<ApplyLeave> allLeaveRequest=lDao.getAllLeaveRequests();
//		 
//		 request.setAttribute("allLeaveRequest", allLeaveRequest);
//		 request.getRequestDispatcher("admin_leaveAuthorize.JSP").forward(request, response);
		try (PrintWriter out = response.getWriter()) {
			// USER AUTHENTICATION
			Users auth = (Users) request.getSession().getAttribute("auth");
			// RETRIVE ALL leave List
			ArrayList<ApplyLeave> leave_list = (ArrayList<ApplyLeave>) request.getSession().getAttribute("leave-list");
			
			if (leave_list != null && auth != null) {
				for (ApplyLeave al : leave_list) {
					ApplyLeave applyleave=new ApplyLeave();
					applyleave.setL_id(al.getL_id());
					applyleave.setId(auth.getId());
					applyleave.setStartDate(al.getStartDate());
					applyleave.setEndDate(al.getEndDate());
					applyleave.setType(al.getType());
					applyleave.setReason(al.getReason());
					applyleave.setStatus(al.getStatus());
					
					LeaveDao lDao=new LeaveDao(DbCon.getConnection());
					List<ApplyLeave> allLeaveList=lDao.getAllLeaveRequests();	
				}
				response.sendRedirect("admin_LeaveAuthorize.jsp");
			}else {
				if (auth == null) {
					response.sendRedirect("login.jsp");
				} else {
					response.sendRedirect("admin.jsp");
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
