package com.cmw.main;

import javax.servlet.http.HttpServletRequest;

public class Danwi {

	public static void cal(HttpServletRequest request) {
		
		String color="red";
		
		String danwi1="";
		String danwi2="";
		double uInput = Double.parseDouble(request.getParameter("uInput"));
		String unit = request.getParameter("unit");
		double result = (uInput* 0.393701);
		
		if(unit.equals("cm")){
			color="red";
			result = (uInput* 0.393701);
			danwi1="cm";
			danwi2="inch";
		}else if(unit.equals("m")){
			color="blue";
			result = (uInput* 0.3025);
			danwi1="m2";
			danwi2="Æò";
		}else if(unit.equals("f")){
			color="yellow";
			result = ((uInput-32)*5/9);
			danwi1="F";
			danwi2="C";
		}else if(unit.equals("km")){
			color="green";
			result = (uInput* 0.621371);
			danwi1="km/h";
			danwi2="mi/h";
		}
		String result2 = String.format("%.1f", result);
		
		Reward r = new Reward(color, danwi1, danwi2, uInput, result2);
		request.setAttribute("r", r);
		
	}

}
