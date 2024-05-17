package ELM.java.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import ELM.java.Connection.DbCon;
import ELM.java.DAO.LeaveDao;
import ELM.java.Model.ApplyLeave;
import ELM.java.Model.Users;

@WebServlet("/go-to-view")
public class ApplyLeaveHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try (PrintWriter out = response.getWriter()) {
			// RETRIVE ALL leave List
			ArrayList<ApplyLeave> leave_list = (ArrayList<ApplyLeave>) request.getSession().getAttribute("leave-list");
			
			// USER AUTHENTICATION
						Users auth = (Users) request.getSession().getAttribute("auth");
						
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
								boolean result=lDao.addLeaveRequest(applyleave);
								
								if (!result)
									break;
							}
//							leave_list.clear();
							response.sendRedirect("viewLeave.jsp");
						}else {
							if (auth == null) {
								response.sendRedirect("login.jsp");
							} else {
								response.sendRedirect("leave.jsp");
							}
						}
						
						
						
			
			
		}catch (Exception e) {
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
