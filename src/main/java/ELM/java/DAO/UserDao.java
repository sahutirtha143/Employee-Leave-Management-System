package ELM.java.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ELM.java.Model.Users;

public class UserDao {
	/* private Connection connection; */
	/* private String query; */
//	private PreparedStatement ps;
	private ResultSet rs;

	
	/* public UserDao(Connection connection) { this.connection=connection; } */
	

	private String jdbcURL = "jdbc:mysql://localhost:3307/employeelm";
	private String jdbcUsername = "root";
	private String jdbcPassword = "2112";

	private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, rule, department, password, conpassword) VALUES (?, ?, ?, ?,?,?)";
	private static final String SELECT_USER = "select * from users where email=? and password=?";
	private static final String UPDATE_USER="UPDATE users SET name=?, email=?,rule=?,department=? where id=?";
	private static final String DELETE_USER="delete from users where id=?";
	private static final String SELECT_ALL_USERS="select * from users";  //FOR ADMIN PAGE
	private static final String ADMIN_CREATE_USERS_SQL = "INSERT INTO users (name, email, rule, department, password, conpassword,leave_day) VALUES (?, ?, ?, ?,?,?,?)";


	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
//EMPLOYEE SIGNUP
	public boolean registerUser(String name, String email, String rule, String department, String password,
			String conpassword) {
		boolean rowInserted = false;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, rule);
			preparedStatement.setString(4, department);
			preparedStatement.setString(5, password);
			preparedStatement.setString(6, conpassword);

			rowInserted = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowInserted;
	}
	
	//EMPLOYEE SIGNIN
	public Users userLogin(String email, String password) {
		Users us = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER)) {
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			rs = preparedStatement.executeQuery();

			if (rs.next()) {
				us = new Users();
				us.setId(rs.getInt("id"));
				us.setName(rs.getString("name"));
				us.setEmail(rs.getString("email"));
				us.setRole(rs.getString("rule"));
				us.setDepartment(rs.getString("department"));
				

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
			System.out.println(e.getMessage());
		}

		return us;
	}
	
	//EMPLOYEE UPDATE
	public boolean updateUser(Users user) throws SQLException {
		/* boolean rowUpdated; */
		int rowsUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USER)) {
			statement.setString(1,user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getRole());
			statement.setString(4, user.getDepartment());
//			statement.setString(5, user.getPassword());
//			statement.setString(6, user.getConPassword());
			statement.setInt(5, user.getId());
			/* rowUpdated=statement.executeUpdate()>0; */
			rowsUpdated = statement.executeUpdate();
			return rowsUpdated>0; 
		}catch (SQLException e) {
            e.printStackTrace();
		 return false; 
        }
		
	}
	
	//EMPLOYEE DELETE
	 public void deleteUser(int id) {
		 try (Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER)) {
			 preparedStatement.setInt(1, id);
			 preparedStatement.execute();
			 
		 }catch (Exception e) {
				// TODO: handle exception
				e.getStackTrace();
				System.out.println(e.getMessage());
			}
		 
			
		}
	 
	    //DYNAMICALLY ALL EMPLOYEE DATA FETCH INTO THE admin_EmployeeList.jsp PAGE 
	 public List<Users> selectAllUsers(Users user){
		 List<Users> user_list=new ArrayList<Users>();
		 try (Connection connection = getConnection();
					PreparedStatement ps = connection.prepareStatement(SELECT_ALL_USERS)) {
//			 ps.setInt(1, id);
			 rs=ps.executeQuery();
			 
			 while(rs.next()) {
				  user=new Users();
				 user.setId(rs.getInt("id"));
				 user.setEmail(rs.getString("email"));
				 user.setRole(rs.getString("rule"));
				 user.setDepartment(rs.getString("department"));
				 user.setLeaveDay(rs.getInt("Leave_Day"));
				 user_list.add(user);
			 }
			 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 return user_list;
	 }
	 
	//ADMINUSER CREATION
		public boolean adminCreateUser(String name, String email, String rule, String department, String password,
				String conpassword,int leave_day) {
			boolean rowInserted = false;
			try (Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(ADMIN_CREATE_USERS_SQL)) {
				preparedStatement.setString(1, name);
				preparedStatement.setString(2, email);
				preparedStatement.setString(3, rule);
				preparedStatement.setString(4, department);
				preparedStatement.setString(5, password);
				preparedStatement.setString(6, conpassword);
				preparedStatement.setInt(7, leave_day);
				
				rowInserted = preparedStatement.executeUpdate() > 0;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rowInserted;
		}
	

}
