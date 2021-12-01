package com.cmw.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

public class M {

	public static void call(HttpServletRequest request) {

		String name = request.getParameter("n");
		String age = request.getParameter("a");

		System.out.println(name);
		System.out.println(age);

	}

	public static void reg(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String sql = "insert into nameage values(?, ?)";
			
			con = DBManager.connection();
			System.out.println("연결성공");

			pstmt = con.prepareStatement(sql);
			// 값 얻기
			pstmt.setString(1, request.getParameter("n"));
			pstmt.setString(2, request.getParameter("a"));
			
			
			//실행
			if (pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "success!");

			} else {
				request.setAttribute("r", "error!");

			}
		} catch (Exception e) {
			request.setAttribute("r", "db server error");

		} finally {
			try {
				DBManager.close(con, pstmt, null);
			} catch (Exception e2) {
			}

		}

	}

}
