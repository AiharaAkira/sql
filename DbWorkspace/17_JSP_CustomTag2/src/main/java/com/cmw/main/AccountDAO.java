package com.cmw.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AccountDAO {
	
	public static void loginCheck(HttpServletRequest request) {
		//hs
		HttpSession hs = request.getSession();
		Account a = (Account) hs.getAttribute("accountInfo");
		
		if(a == null) {
			//로그인 실패
			request.setAttribute("loginPage", "login/login.jsp");
		}else {
			
			//로그인 성공
			request.setAttribute("loginPage", "login/loginOK.jsp");
		}
		
	}

	public static void login(HttpServletRequest request) {
		//1.값
				String userId = request.getParameter("id");
				String userPw = request.getParameter("pw");
				
				// 2. DB랑 비교(아직 개발 안됨.) - 가데이터 처리
				
				//c
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					con = DBManager.connection();
					String sql = "select * from login_test3 where l_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, userId);
					rs = pstmt.executeQuery();
					
					
					if(rs.next()) {
						//아이디가 맞으면 pw검사
						String dbPW = rs.getString("l_pw");
						
						if(userPw.equals(dbPW)) {
							//값 여러개 - 빈
							Account a = new Account();
							a.setId(rs.getString("l_id"));
							a.setPw(rs.getString("l_pw"));
							a.setName(rs.getString("l_name"));
							
							HttpSession hs = request.getSession();
							hs.setAttribute("accountInfo", a);
							hs.setMaxInactiveInterval(10);
							
							//request.setAttribute("a", a);
							System.out.println("로그인성공");
						}else {
							System.out.println("비밀번호오류");
						}
					}else {
						System.out.println("로그인성공존재하지않는 회원");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBManager.close(con, pstmt, rs);
				}
	}

	public static void logOut(HttpServletRequest request) {

		
		//로그아웃하는 일
		//세션을 죽이자
		//애초에 만들어진 적이 없을때, 설정한 시간이 만료 되었을때.
		//초기화하는 메서드도 있긴함 
		HttpSession hs = request.getSession();
		hs.setAttribute("accountInfo", null);
		
		
	
		request.setAttribute("loginPage", "login/login.jsp");
		
	}

}
