<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="ReviewUpdateC" method="post">
<table id="tbl_detail" border="1">
	
				<tr>
					<td colspan="2" align="center" class="d_tb1"> <h1>수정페이지</h1> </td>
				</tr>
				<tr>
					<td class="d_td1">글번호 </td>
					<td class="d_td2">${review.no }</td>
				</tr>
				<tr>
					<td class="d_td1">글 제목</td>
					<td class="d_td2"> <input name="title" placeholder="${param.title }"> </td>
				</tr>
				
				<tr>
					<td class="d_td1">내용</td>
					<td class="d_td2"> <input name="txt" placeholder="${param.txt }"> </td>
				</tr>
				<tr>
					
					<td class="d_td1">등록일 </td>
					<td class="d_td2">${review.date}</td>
				</tr>
				<tr>
					
					<td colspan="2" class="d_td3"> 
					<a href="Menu4">목록으로</a> 
					<span onclick="history.go(-2)">목록으로(js)</span> 
					<button name="no" value="${param.no }">수정</button> 
					 </td>
				</tr>
			</table>
			</form>

</body>
</html>