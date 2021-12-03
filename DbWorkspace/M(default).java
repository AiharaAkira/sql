package com.mz.main;

import javax.servlet.http.HttpServletRequest;

public class M {

	// 로그인
	public static void login(HttpServletRequest request) {
		
		// 로그인 하기 위해선
		// 사용자가 입력한 id, pw
		// 그걸 db에 들어가 있는 값 비교
		// 다 맞으면 ok
		
		// 1. 값
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		// 2. DB랑 비교   (아직 개발 안됨.) - 가데이터 처리
		
		String dbID = "mz";
		String dbPW = "1004";
		
		
		if(userId.equals(dbID)) {
			// 아이디가 맞으면 pw검사
			if(userPw.equals(dbPW)) {
				request.setAttribute("r", "로그인 성공!");
			} else {
				request.setAttribute("r", "비밀번호 오류!");
			}
		} else {
			request.setAttribute("r", "존재하지 않는 회원 입니다");
		}
		
		
		
		
		
		
		
		
		
	}

}
