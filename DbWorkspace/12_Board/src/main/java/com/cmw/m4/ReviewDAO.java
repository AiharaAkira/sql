package com.cmw.m4;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.cmw.main.DBManager;

public class ReviewDAO {

	public static void getAllReview(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review_test order by r_date desc";
				
				try {
					con = DBManager.connection();
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					Review r = null;
					
					ArrayList<Review> reviews = new ArrayList<Review>();
					while(rs.next()) {
						r = new Review();
						r.setNo(rs.getInt("r_no"));
						r.setTitle(rs.getString("r_title"));
						r.setTxt(rs.getString("r_txt"));
						r.setDate(rs.getDate("r_date"));
						
						reviews.add(r);
						
					}
					request.setAttribute("reviews", reviews);
					
				} catch (Exception e) {

					e.printStackTrace();
				}finally {
					DBManager.close(con, pstmt, rs);
				}
		
	}

	public static void getInsert(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into REVIEW_test values (review_TEST_seq.nextval, ?, ?, sysdate)";
		try {
			request.setCharacterEncoding("utf-8");

			
			
			con = DBManager.connection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("title"));
			pstmt.setString(2, request.getParameter("txt"));
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("등록성공");
			}
			
		} catch (Exception e) {

		e.printStackTrace();
		
		}finally {
			DBManager.close(con, pstmt, null);
		}
		
		
	}

	public static void getReview(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review_test where r_no=?";
				
				try {
					con = DBManager.connection();
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, request.getParameter("no"));
					rs = pstmt.executeQuery();
					
					Review r = null;
					
					if(rs.next()) {
						r = new Review();
						r.setNo(rs.getInt("r_no"));
						r.setTitle(rs.getString("r_title"));
						r.setTxt(rs.getString("r_txt"));
						r.setDate(rs.getDate("r_date"));
						
						
					}
					request.setAttribute("review", r);
					
				} catch (Exception e) {

					e.printStackTrace();
				}finally {
					DBManager.close(con, pstmt, rs);
				}
	}

	public static void updateReview(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		//날짜 컨셉은 date를 설정 하냐, 마냐에 따라 다른가 
		// r_date = sysdate
		String sql = "update REVIEW_test set r_title = ?, r_txt = ?, r_date = sysdate where r_no=?";
		try {
			request.setCharacterEncoding("utf-8");

			con = DBManager.connection();
			pstmt = con.prepareStatement(sql);
			
			String title = request.getParameter("title");
			String txt = request.getParameter("txt");
			String no = request.getParameter("no");
			
			pstmt.setString(1, title);
			pstmt.setString(2, txt);
			pstmt.setString(3, no);
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("수정성공");
			}else {
				System.out.println("수정실패");
			}
			
		} catch (Exception e) {

		e.printStackTrace();
		
		}finally {
			DBManager.close(con, pstmt, null);
		}
		
	}

	public static void delete(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from review_test where r_no = ?";
		 
		
		try {
			con = DBManager.connection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, request.getParameter("no"));
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
			
			
			
		} catch (Exception e) {
			System.out.println("삭제 실패2");
		
		}finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void searchTitle(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review_test where r_title like '%'||?||'%'";
				
				try {
					
					con = DBManager.connection();
					pstmt = con.prepareStatement(sql);
					String title = request.getParameter("searchT");
					pstmt.setString(1, title);
					rs = pstmt.executeQuery();
					
					Review r = null;
					
					ArrayList<Review> reviews = new ArrayList<Review>();
					while(rs.next()) {
						r = new Review();
						r.setNo(rs.getInt("r_no"));
						r.setTitle(rs.getString("r_title"));
						r.setTxt(rs.getString("r_txt"));
						r.setDate(rs.getDate("r_date"));
						
						reviews.add(r);
						
					}
					request.setAttribute("reviews", reviews);
					
				} catch (Exception e) {

					e.printStackTrace();
				}finally {
					DBManager.close(con, pstmt, rs);
				}
		
	}

}
