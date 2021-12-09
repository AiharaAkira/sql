package com.cmw.main;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BmiCal {

	public static void cal(HttpServletRequest request) {

		try {
			// ���ϰ��
			String path = request.getSession().getServletContext().getRealPath("img");

			MultipartRequest mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());

			// ���� ���ε�
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
				result = "��";
			} else if (bmi >= 23) {
				result = "��ü��";
			} else if (bmi >= 18.5) {
				result = "����";
			} else {
				result = "��ü��";
			}
			Status s = new Status(photo, name, heightR, weightR, bmiR, result);
			request.setAttribute("s", s);

		} catch (Exception e) {
		}

	}

}
