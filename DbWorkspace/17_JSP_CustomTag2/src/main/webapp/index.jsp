<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel=stylesheet href="css/index.css">
<link rel=stylesheet href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Ma+Shan+Zheng&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
</head>
</head>
<body>

	<table style="margin: 0 auto;">
		<tr style="text-align: right;">
			<td >
					<jsp:include page="${loginPage}"></jsp:include>
			</td>
		</tr>
	</table>

	<table id="site">
		<tr>
			<td id="title"><a href="HC">AKIRA SITE</a></td>
		</tr>
		<tr>
			<td id="menu">
			<a href="AController">A</a> 
			<a href="BController">b</a> 
			<a href="UnitController">Unit</a> 
			<a href="BMIController">BMI</a>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="${contentPage}"></jsp:include>
			</td>
		</tr>
	</table>

</body>
</html>