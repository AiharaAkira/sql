package com.cmw.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//DAO(Data Access Object)
//db관련 작업은 여기다 정의
public class DAO_Member {

	public static ArrayList<Member> showAll() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBManager.connection();
			System.out.println("연결성공");
			
			String sql = "select*from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<Member> members = new ArrayList<Member>();
			Member m = null;
			
			while(rs.next()) {
				m = new Member();
				m.setNo(1);
				m.setName(rs.getString("m_name"));
				m.setAge(rs.getInt("m_age"));
				members.add(m);
				
			}
			return members;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}
	
}
