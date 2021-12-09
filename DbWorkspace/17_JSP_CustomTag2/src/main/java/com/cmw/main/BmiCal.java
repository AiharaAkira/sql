package com.cmw.main;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BmiCal {

	public static void cal(HttpServletRequest request) {

		try {
			// 파일경로
			String path = request.getSession().getServletContext().getRealPath("img");

			MultipartRequest mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());

			// 파일 업로드
			String photo = mr.getFilesystemName("photo");
			String name = mr.getParameter("name");
			double height = Double.parseDouble(mr.getParameter("height"));

			if (height < 10) {
				height = height * 100;
			}

			double weight = Double.parseDouble(mr.getParameter("weight"));
			double bmi = (weight / ((height * 0.01) * (height * 0.01)));

			String heightR = String.format("%.1f", height);
			String weightR = String.format("%.1f", weight);
			String bmiR = String.format("%.2f", bmi);
			String result = null;

			if (bmi >= 25) {
				result = "비만";
			} else if (bmi >= 23) {
				result = "과체중";
			} else if (bmi >= 18.5) {
				result = "정상";
			} else {
				result = "저체중";
			}
			Status s = new Status(photo, name, heightR, weightR, bmiR, result);
			request.setAttribute("s", s);

		} catch (Exception e) {
		}

	}

}
