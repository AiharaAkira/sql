<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="Menu3" method="post" enctype="multipart/form-data" >

<table id="mTbl" >
	<tr>
		<td>영화제목</td>
		<td> <input name="name"> </td>
	</tr>
	
	<tr>
		<td>영화배우</td>
		<td> <input name="actor"> </td>
	</tr>
	
	<tr>
		<td>영화사진</td>
		<td> <input type="file" name="img"> </td>
	</tr>
	
	<tr>
		<td>영화줄거리</td>
		<td> <textarea name="story"></textarea> </td>
	</tr>
	
	<tr>
		<td colspan="2"> <button>등록</button> </td>
		
	</tr>
</table>

</form>






<c:forEach var="m" items="${movies }">
<table id="mTbl2">
	<tr>
		<td  rowspan="4" id="m_td2"><img src="img/${m.img }" id="movieImg"><br><br></td>
	</tr>
	<tr>
		<td>제목:</td><td class="m_td1"> ${m.title }<br></td>
	</tr>
	<tr>
		<td>배우:</td> <td class="m_td1"> ${m.actor }<br><br></td>
	</tr>
	<tr>
		<td>스토리:</td><td class="m_td1"> ${m.story }<br></td>
	</tr>
	<tr>
	<td> <button onclick="location.href='MovieUpdateC?num=${m.no}&title=${m.title}&actor=${m.actor}&story=${m.story}&img=${m.img}&m=${m}'"> 수정</button>
	<button onclick="updateMovie('${m.title}', '${m.actor}', '${m.story}', '${m.no}')"> 수정(JS)</button>
	<button onclick="deleteMovie(${m.no})"> 삭제</button></td>
	</tr>
</table>




</c:forEach>
	

</body>
</html>