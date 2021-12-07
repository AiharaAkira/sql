<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>수정 페이지</h1>
	<form action="MovieUpdateC" method="post" enctype="multipart/form-data">
	
		<table id="mTbl2">
	<tr>
		<td  rowspan="4" id="m_td2">
		 <input type="file" name="img"> <br></td>
	</tr> 
	<tr>
		<td>제목:</td><td class="m_td1"> <input name="title" placeholder="${param.title}"> <br></td>
	</tr>
	<tr>
		<td>배우:</td> <td class="m_td1"> <input name="actor" placeholder="${param.actor}"> <br></td>
	</tr>
	<tr>
		<td>스토리:</td><td class="m_td1"> <textarea name="story" placeholder="${param.story}"></textarea> <br></td>
	</tr>
	<tr>
	<td colspan="2"> 
	<button name="no" value="${param.num }"> 수정</button>
	</td>
	</tr>
</table>

	</form>

</body>
</html>