package com.cmw.m4;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.cmw.m3.Movie;

public class R {

	public static Review getval(HttpServletRequest request) {
		
		String title = request.getParameter("title");
		String txt = request.getParameter("txt");
		Date date = new Date();
		Review r = new Review(0, title, txt, date);
		return r;
	}

}
