<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table id="tbl_detail" border="1">
	
				<tr>
					<td colspan="2" align="center" class="d_tb1"> <h1>상세페이지</h1> </td>
				</tr>
				<tr>
					<td class="d_td1">글번호 </td>
					<td class="d_td2">${review.no }</td>
				</tr>
				<tr>
					<td class="d_td1">글 제목</td>
					<td class="d_td2">${review.title }</td>
				</tr>
				
				<tr>
					<td class="d_td1">내용</td>
					<td class="d_td2">${review.txt }</td>
				</tr>
				<tr>
					
					<td class="d_td1">등록일 </td>
					<td class="d_td2">${review.date }</td>
				</tr>
				<tr>
					
					<td colspan="2" class="d_td3"> 
					<a href="Menu4">목록으로</a> 
					<span onclick="history.back()">목록으로(js)</span> 
					<button onclick="location.href='ReviewUpdateC?no=${review.no}'">수정</button> 
					 <button onclick="reviewDel(${review.no });">삭제</button> 
					 </td>
				</tr>
			</table>
	
</body>
</html>