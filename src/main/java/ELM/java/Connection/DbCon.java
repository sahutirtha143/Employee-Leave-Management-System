package ELM.java.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection con=null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if(con==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/employeelm?useSSL=false","root","2112");
			System.out.println("connected with mysql");
		}
		return con;
		
	}

}
