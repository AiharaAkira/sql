package com.mz.main;

import javax.servlet.http.HttpServletRequest;

public class M {

	// �α���
	public static void login(HttpServletRequest request) {
		
		// �α��� �ϱ� ���ؼ�
		// ����ڰ� �Է��� id, pw
		// �װ� db�� �� �ִ� �� ��
		// �� ������ ok
		
		// 1. ��
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		// 2. DB�� ��   (���� ���� �ȵ�.) - �������� ó��
		
		String dbID = "mz";
		String dbPW = "1004";
		
		
		if(userId.equals(dbID)) {
			// ���̵� ������ pw�˻�
			if(userPw.equals(dbPW)) {
				request.setAttribute("r", "�α��� ����!");
			} else {
				request.setAttribute("r", "��й�ȣ ����!");
			}
		} else {
			request.setAttribute("r", "�������� �ʴ� ȸ�� �Դϴ�");
		}
		
		
		
		
		
		
		
		
		
	}

}
