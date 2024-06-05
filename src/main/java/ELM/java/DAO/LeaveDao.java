package ELM.java.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ELM.java.Model.ApplyLeave;
import ELM.java.Model.Users;


public class LeaveDao {
    private Connection connection;
    private String query;
	private PreparedStatement ps;
	private ResultSet rs;

    public LeaveDao(Connection connection) {
        this.connection = connection;
    }

    public boolean addLeaveRequest(ApplyLeave leave) {
        String sql = "INSERT INTO apply_leaves(u_id, start_date, end_date,type_of_leave, reason, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, leave.getId());
            statement.setDate(2, leave.getStartDate());
            statement.setDate(3, leave.getEndDate());
            statement.setString(4, leave.getType());
            statement.setString(5, leave.getReason());
            statement.setString(6, leave.getStatus());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

//    // Other methods for leave management
    //DYNAMICALLY DATA FETCH INTO THE viewLeave.jsp PAGE
    public List<ApplyLeave> userLeaveHistory(int id) {
    	List<ApplyLeave> list = new ArrayList<ApplyLeave>();
    	
    	try {
    		query=" select * from apply_leaves where u_id=? order by apply_leaves.l_id desc;";
    		ps=connection.prepareStatement(query);		
    		ps.setInt(1, id);
    		rs=ps.executeQuery();
    		while(rs.next()) {
    			ApplyLeave al=new ApplyLeave();
    			UserDao uDao=new UserDao();
    			int uId=rs.getInt("u_id");
    			
    			al.setL_id(rs.getInt("l_id"));
    			al.setId(uId);
    			al.setStartDate(rs.getDate("start_date"));
    			al.setEndDate(rs.getDate("end_date"));
    			al.setType(rs.getString("type_of_leave"));
    			al.setReason(rs.getString("reason"));
    			al.setStatus(rs.getString("status"));
    			list.add(al);
    		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return list;
    }
    
    //DECLINE LEAVE FORM THE viewLeave.jsp PAGE
    public void declineLeave(int id) {
		try {
			query="delete from apply_leaves where l_id=?";
			ps=this.connection.prepareStatement(query);
			ps.setInt(1, id);
			ps.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
    
    //DYNAMICALLY DATA FETCH INTO THE admin_LeaveAuthorize.jsp PAGE Where all the users leave history is viewed(ADMIN PAGE)
    public List<ApplyLeave> getAllLeaveRequests(){
    	List<ApplyLeave> leaveList = new ArrayList<>();
    	try {
    		query="SELECT * FROM apply_leaves";
    		ps=this.connection.prepareStatement(query);
    		rs=ps.executeQuery();
    		
    		while(rs.next()) {
    			ApplyLeave al=new ApplyLeave();
    			UserDao uDao=new UserDao();
    			int uId=rs.getInt("u_id");
    			
    			al.setL_id(rs.getInt("l_id"));
    			al.setId(uId);
    			al.setStartDate(rs.getDate("start_date"));
    			al.setEndDate(rs.getDate("end_date"));
    			al.setType(rs.getString("type_of_leave"));
    			al.setReason(rs.getString("reason"));
    			al.setStatus(rs.getString("status"));
    			leaveList.add(al);
    			
    			
    		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return leaveList;
    }
    
//    STATUS UPDATE Approved(ADMIN PAGE)
    public void updateStatusApproved(int l_id, String status) {
    	try {
    		query="UPDATE apply_leaves SET status = ? WHERE l_id = ?";
    		ps=this.connection.prepareStatement(query);
    		ps.setString(1, status);
    		ps.setInt(2, l_id);
    		ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    }
//  STATUS UPDATE declined(ADMIN PAGE)
    public void updateStatusDeclined(int l_id, String status) {
    	try {
    		query="UPDATE apply_leaves SET status = ? WHERE l_id = ?";
    		ps=this.connection.prepareStatement(query);
    		ps.setString(1, status);
    		ps.setInt(2, l_id);
    		ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    }
//    COUNT TYPES OF LEAVES FOR PERTICULAR USER

    public List<ApplyLeave> getLeavesByUserId(int userId) {
        List<ApplyLeave> leaves = new ArrayList<>();
        query = "SELECT * FROM apply_leaves WHERE u_id = ? AND status = 'Approved'";
        
        try {
        ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
		UserDao uda=new UserDao();
                while (rs.next()) {
                    ApplyLeave leave = new ApplyLeave();
                    leave.setL_id(rs.getInt("l_id"));
                    leave.setId(rs.getInt("u_id"));
                    leave.setStartDate(rs.getDate("start_date"));
                    leave.setEndDate(rs.getDate("end_date"));
                    leave.setType(rs.getString("type_of_leave"));
                    leave.setReason(rs.getString("reason"));
                    leave.setStatus(rs.getString("status"));

                    leaves.add(leave);
                }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return leaves;
    }

//  LEAVE CALANDER
    public List<ApplyLeave> getAllApprovedLeaves() {
        List<ApplyLeave> leaves = new ArrayList<>();
        query = "SELECT * FROM apply_leaves WHERE status = 'Approved'";
        
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                ApplyLeave leave = new ApplyLeave();
                leave.setL_id(rs.getInt("l_id"));
                leave.setId(rs.getInt("u_id"));
                leave.setStartDate(rs.getDate("start_date"));
                leave.setEndDate(rs.getDate("end_date"));
                leave.setType(rs.getString("type_of_leave"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                
                leaves.add(leave);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return leaves;
    }

}