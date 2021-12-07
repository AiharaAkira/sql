package com.cmw.main;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//db작업 시에는 연결해야됨
public class DBManager {
	public static Connection connection() throws SQLException {
		
			// 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			
			return DriverManager.getConnection(url, "cmw", "cmw");
			
	}
	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) {
				
				rs.close();
			}
		} catch (Exception e) {
		}
		
		try {
			
			pstmt.close();
		} catch (Exception e) {
		}
		try {
			con.close();
			
		} catch (Exception e) {
		}
		
	}
}
