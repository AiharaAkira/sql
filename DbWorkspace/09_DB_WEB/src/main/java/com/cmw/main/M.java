package com.cmw.main;

import javax.servlet.http.HttpServletRequest;

public class M {
	
	public static Member getVal(HttpServletRequest request) {
		String name = request.getParameter("n");
		int age = Integer.parseInt( request.getParameter("a"));
		
		//bean
		Member m = new Member(0, name, age);
		return m;
	}
	
}
