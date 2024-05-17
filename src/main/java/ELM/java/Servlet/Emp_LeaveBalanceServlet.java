package ELM.java.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.swing.plaf.InternalFrameUI;

import ELM.java.Connection.DbCon;
import ELM.java.DAO.LeaveDao;
import ELM.java.DAO.UserDao;
import ELM.java.Model.ApplyLeave;

@WebServlet("/leave-count")
public class Emp_LeaveBalanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()) {
			String id=request.getParameter("id");
			
			 LeaveDao leaveDao = new LeaveDao(DbCon.getConnection());
			  List<ApplyLeave> leaves = leaveDao.getLeavesByUserId(Integer.parseInt(id));
			  
			  	int totalLeaves = 100;
	            int sickLeaves = 0;
	            int vacationLeaves = 0;
	            int otherLeaves = 0;
	            
	            for (ApplyLeave leave : leaves) {
	            	long duration = leave.getEndDate().getTime()-leave.getStartDate().getTime();
	            	int days=(int) TimeUnit.DAYS.convert(duration, TimeUnit.MILLISECONDS);
	            	
	            	switch (leave.getType()) {
					case "Sick Leave": 
							sickLeaves=sickLeaves+days;
							break;
					case "Vacation Leave":
						vacationLeaves=vacationLeaves+days;
						break;			
					default:
						otherLeaves=otherLeaves+days;
						break;
					}
	            }
	            int remainingLeaves = totalLeaves - (sickLeaves + vacationLeaves + otherLeaves);
	            
	            request.setAttribute("totalLeaves", totalLeaves);
	            request.setAttribute("remainingLeaves", remainingLeaves);
	            request.setAttribute("sickLeaves", sickLeaves);
	            request.setAttribute("vacationLeaves", vacationLeaves);
	            request.setAttribute("otherLeaves", otherLeaves);
	            
	            RequestDispatcher dispatcher = request.getRequestDispatcher("emp_BalanceLeave.jsp");
	            dispatcher.forward(request, response);
			/*
			 * if(id!=null) { LeaveDao orderDao=new LeaveDao(DbCon.getConnection());
			 * orderDao.declineLeave(Integer.parseInt(id)); }
			 */
//          response.sendRedirect("calander.jsp");
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
