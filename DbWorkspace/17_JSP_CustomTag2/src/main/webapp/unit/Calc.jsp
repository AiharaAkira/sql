<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	public double inchCal(double cm){
		return Math.floor(cm * 0.393701*10)/10.0 ;
	}
	public double widthCal(double m){
		return Math.floor((m * 0.3025)*10)/10.0;
	}
	public double cCal(double f){
		return Math.ceil(((f -32)*5/9)*10)/10.0;
	}
	public double kmCal(double km){
		return Math.floor((km * 0.621371)*10)/10.0;
	}
	%>
	
	<%
	double uInput = Double.parseDouble(request.getParameter("uInput"));
	String unit = request.getParameter("unit");
	%>
	<!--  ⏬ -->
	
		
		
		
		<%if(unit.equals("cm")){
			%>
		<div style="height: auto; width: 98%; border:5px solid black; margin:5px 5px; text-align:center; color:orange; font-weight:bold; font-size:25px;"> 
		<div id="title" style="height: auto; width: 96%; border:5px solid black; margin:5px auto; background-color:orange; font-size:30px; color:white; ">변환결과</div>
		<div id="result" style="width: 96%; font-size:30px; color:orange;">
			<%=uInput%> cm
			<br><br><br>
			⏬⏬⏬
			<br><br><br>
			<%= inchCal(uInput) %> inch
			</div>
			</div>
		<% }%>
		
		<%if(unit.equals("m")){
			%>
		<div style="height: auto; width: 98%; border:5px solid black; margin:5px 5px; text-align:center; color:red; font-weight:bold; font-size:25px;"> 
		<div id="title" style="height: auto; width: 96%; border:5px solid black; margin:5px auto; background-color:red; font-size:30px; color:white; ">변환결과</div>
		<div id="result" style="width: 96%; font-size:30px; color:red;">
			<%=uInput%> m2
			<br><br><br>
			⏬⏬⏬
			<br><br><br>
			<%= widthCal(uInput) %> 평
			</div>
			</div>
		<% }%>
		
		<%if(unit.equals("f")){
			%>
		<div style="height: auto; width: 98%; border:5px solid black; margin:5px 5px; text-align:center; color:blue; font-weight:bold; font-size:25px;"> 
		<div id="title" style="height: auto; width: 96%; border:5px solid black; margin:5px auto; background-color:blue; font-size:30px; color:white; ">변환결과</div>
		<div id="result" style="width: 96%; font-size:30px; color:blue;">
			<%=uInput%> ℉
			<br><br><br>
			⏬⏬⏬
			<br><br><br>
			<%= cCal(uInput) %> ℃
			</div>
			</div>
		<% }%>
		
		
		<%if(unit.equals("km")){
			%>
		<div style="height: auto; width: 98%; border:5px solid black; margin:5px 5px; text-align:center; color:green; font-weight:bold; font-size:25px;"> 
		<div id="title" style="height: auto; width: 96%; border:5px solid black; margin:5px auto; background-color:green; font-size:30px; color:white; ">변환결과</div>
		<div id="result" style="width: 96%; font-size:30px; color:green;">
			<%=uInput%> km/h
			<br><br><br>
			⏬⏬⏬
			<br><br><br>
			<%= kmCal(uInput) %> mi/h
			</div>
			</div>
		<% }%>
		
		
		
		
	
</body>
</html>