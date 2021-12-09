<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height: auto; width: 98%; border:5px solid black; margin:5px 5px; text-align:center; color:green; font-weight:bold; font-size:25px;"> 
		<div id="title" style="height: auto; width: 96%; border:5px solid black; margin:5px auto; background-color:green; font-size:30px; color:white; ">단위변환</div>
		
		<form action="UnitController" style="text-align:center" onsubmit="return call();" method="post">
		변환할 값: <br> 
		<input id="i1" type="text" name="uInput" style="width:75%"><br> 
		단위:	<br> 
		<select name="unit" style="width:75%">
		<option value="cm">cm->inch</option>
		<option value="m">m2->평</option>
		<option value="f">℉->℃</option>
		<option value="km">km/h->mi/h</option>
		</select><br>
		<button style="background-color:green; color:white; margin: 5px 5px;" >변환</button>
		</form>
		
	</div>
</body>
</html>