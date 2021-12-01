package com.cmw.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class M2 {

	public static void call(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String sql = "insert into nameage values(?, ?)";
			String sql2 = "select * from nameage";
			
			con = DriverManager.getConnection(url, "cmw", "cmw");
			System.out.println("연결성공");

			pstmt = con.prepareStatement(sql2);
			
			//전체 조회
			rs = pstmt.executeQuery();
			
			ArrayList<Human> humans = new ArrayList<Human>();
			while(rs.next()) {
				
				String name = rs.getString("n_name");
				String age = rs.getNString("n_age");
				
				humans.add(new Human(name, age));
				System.out.println(name);
				System.out.println(age);
				System.out.println("___________________");
				
			}
			request.setAttribute("humans", humans);
			//실행
			
				request.setAttribute("r", "success!");

			
		} catch (Exception e) {
			request.setAttribute("r", "db server error");

		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e2) {
			}
	}

	}}
