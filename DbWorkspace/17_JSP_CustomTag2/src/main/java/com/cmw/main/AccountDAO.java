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
			//�α��� ����
			request.setAttribute("loginPage", "login/login.jsp");
		}else {
			
			//�α��� ����
			request.setAttribute("loginPage", "login/loginOK.jsp");
		}
		
	}

	public static void login(HttpServletRequest request) {
		//1.��
				String userId = request.getParameter("id");
				String userPw = request.getParameter("pw");
				
				// 2. DB�� ��(���� ���� �ȵ�.) - �������� ó��
				
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
						//���̵� ������ pw�˻�
						String dbPW = rs.getString("l_pw");
						
						if(userPw.equals(dbPW)) {
							//�� ������ - ��
							Account a = new Account();
							a.setId(rs.getString("l_id"));
							a.setPw(rs.getString("l_pw"));
							a.setName(rs.getString("l_name"));
							
							HttpSession hs = request.getSession();
							hs.setAttribute("accountInfo", a);
							hs.setMaxInactiveInterval(10);
							
							//request.setAttribute("a", a);
							System.out.println("�α��μ���");
						}else {
							System.out.println("��й�ȣ����");
						}
					}else {
						System.out.println("�α��μ������������ʴ� ȸ��");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBManager.close(con, pstmt, rs);
				}
	}

	public static void logOut(HttpServletRequest request) {

		
		//�α׾ƿ��ϴ� ��
		//������ ������
		//���ʿ� ������� ���� ������, ������ �ð��� ���� �Ǿ�����.
		//�ʱ�ȭ�ϴ� �޼��嵵 �ֱ��� 
		HttpSession hs = request.getSession();
		hs.setAttribute("accountInfo", null);
		
		
	
		request.setAttribute("loginPage", "login/login.jsp");
		
	}

}
