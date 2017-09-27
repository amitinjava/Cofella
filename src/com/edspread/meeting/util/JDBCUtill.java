package com.edspread.meeting.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCUtill {

	
public static Connection getConnection() {
		
		Connection con = null;
		String userName = "root";
		String password = "123456";
	    String url = "jdbc:mysql://localhost:3306/meeting";
	 	try {
			Class.forName ("com.mysql.jdbc.Driver").newInstance ();
		 
	    con = DriverManager.getConnection (url, userName, password);
	    System.out.println ("Database connection established");
	    } catch (InstantiationException e) {
			
			e.printStackTrace();
		}
	 	 catch (IllegalAccessException e) {
				
				e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	    return con;
	}
}
