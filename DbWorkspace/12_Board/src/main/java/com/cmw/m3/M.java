package com.cmw.m3;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class M {

	public static Movie getval(HttpServletRequest request) {
		
		try {
			String path = request.getSession().getServletContext().getRealPath("img");
			MultipartRequest mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());
			
			String name = mr.getParameter("name");
			String actor = mr.getParameter("actor");
			String img = mr.getFilesystemName("img");
			String story = mr.getParameter("story");
			System.out.println(name);
			System.out.println(actor);
			System.out.println(img);
			System.out.println(story);
			Movie m = new Movie("0", name, actor, img, story);
			return m;
		} catch (Exception e) {
		return null;
		}
		
		
	}

}
