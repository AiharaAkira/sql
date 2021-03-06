package com.cmw.m4;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReviewUpdateC")
public class ReviewUpdateC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			
			ReviewDAO.getReview(request);
		
			request.setAttribute("contentPage", "jsp/update.jsp");	
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ReviewDAO.updateReview(request);
		ReviewDAO.getAllReview(request);
		
		request.setAttribute("contentPage", "jsp/m4.jsp");	
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
