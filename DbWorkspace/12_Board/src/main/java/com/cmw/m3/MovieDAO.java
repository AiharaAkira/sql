package com.cmw.m3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.cmw.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MovieDAO {
	
	


	public static void getAllmovie(HttpServletRequest request) {
	
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from movie_test";
		try {
			
			con = DBManager.connection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<Movie> movies = new ArrayList<Movie>();
			
			while(rs.next()) {
				//bean
				String no = rs.getString("m_no");
			String title =	rs.getString("m_title");
			String actor =	rs.getString("m_actor");
			String img = rs.getString("m_img");
			String story =	rs.getString("m_story");
			
			
			movies.add(new Movie(no, title, actor, img, story));
			
			}
			
			request.setAttribute("movies", movies);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static String insertMovie(Movie m) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			
			con = DBManager.connection();
			String sql = "insert into movie_test values (movie_test_seq.nextval, ?, ?, ?, ?)";
			
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getTitle());
			pstmt.setString(2, m.getActor());
			pstmt.setString(3, m.getImg());
			pstmt.setString(4,m.getStory());
			
			
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("등록성공");
				return " 등록성공";
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return " 등록실패";
			
		}finally {
			DBManager.close(con, pstmt, null);
		}
		return null;
 		
		
	}

	public static void deleteMovie(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			
			con = DBManager.connection();
			String sql = "delete movie_test where m_no = ?";
			
			
			
			pstmt = con.prepareStatement(sql);
			
			int no = Integer.parseInt(request.getParameter("no"));
			pstmt.setInt(1, no);
			
			
			
			
			if(pstmt.executeUpdate() == 1) {
				request.setAttribute("d", "삭제성공");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("d", "삭제실패");
			
		}finally {
			DBManager.close(con, pstmt, null);
		}
		
		
		
	}

	public static void updateMovie(HttpServletRequest request) {
		
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update movie_test set m_title=?, m_actor=?, m_story=?, m_img=? where m_no=?";
		try {
			con = DBManager.connection();
			pstmt = con.prepareStatement(sql);
			
			String path = request.getSession().getServletContext().getRealPath("img");
			MultipartRequest mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());
			
			String title = mr.getParameter("title");
			String actor = mr.getParameter("actor");
			String img = mr.getFilesystemName("img");
			String story = mr.getParameter("story");
			pstmt.setString(1, title);
			pstmt.setString(2, actor);
			pstmt.setString(3, story);
			pstmt.setString(4, img);
			System.out.println( img);
			
			pstmt.setString(5, mr.getParameter("no"));
			System.out.println( mr.getParameter("no"));
		
			if(pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "수정성공");
			}else {
				
				request.setAttribute("r", "수정실패");
			}
		}catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("r", "db서버 문제");
		}finally {
			
			DBManager.close(con, pstmt, null);
			
		}
	}

	public static void updateMovieGet(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update movie_test set m_title=?, m_actor=?, m_story=? where m_no=?";
		try {
			con = DBManager.connection();
			pstmt = con.prepareStatement(sql);
			
			
			String title = request.getParameter("title");
			String actor = request.getParameter("actor");
			String story = request.getParameter("story");
			pstmt.setString(1, title);
			pstmt.setString(2, actor);
			pstmt.setString(3, story);
			pstmt.setString(4, request.getParameter("no"));
		
			if(pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "수정성공");
			}else {
				
				request.setAttribute("r", "수정실패");
			}
		}catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("r", "db서버 문제");
		}finally {
			
			DBManager.close(con, pstmt, null);
			
		}
		
	}

	

}
