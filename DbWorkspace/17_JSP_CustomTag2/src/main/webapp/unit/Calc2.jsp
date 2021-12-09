
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<!--  ⏬ -->
	
		
		<div style="height: auto; width: 98%; border:5px solid black; margin:5px 5px; text-align:center; color:${r.color}; font-weight:bold; font-size:25px;"> 
		<div id="title" style="height: auto; width: 96%; border:5px solid black; margin:5px auto; background-color:${r.color}; font-size:30px; color:white; ">변환결과</div>
		<div id="result" style="width: 96%; font-size:30px; color:${r.color};">
			${r.uInput} ${r.danwi1} 
			<br><br><br>
			⏬⏬⏬
			<br><br><br>
			${r.result} ${r.danwi2} 
			</div>
			</div>
		
		
</body>
</html>