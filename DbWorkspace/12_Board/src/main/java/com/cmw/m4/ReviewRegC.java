package com.cmw.m4;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cmw.m3.M;
import com.cmw.m3.MovieDAO;

@WebServlet("/ReviewRegC")
public class ReviewRegC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("contentPage", "jsp/m4_reg.jsp");	
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//���
		ReviewDAO.getInsert(request);
	//��ȸ
		ReviewDAO.getAllReview(request);
		request.setAttribute("contentPage", "jsp/m4.jsp");	
		request.getRequestDispatcher("index.jsp").forward(request, response);	
		
	
	}

}
