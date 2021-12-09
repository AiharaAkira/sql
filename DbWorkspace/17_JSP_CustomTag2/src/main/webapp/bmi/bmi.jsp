<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Ma+Shan+Zheng&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
</head>
<body id="bg">
<script type="text/javascript">
	//공백
	function noBlank(input) {
		return !input.value;
	}

	//이상
	function lessThan(input, length) {
		return input.value.length < length;
	}

	function onlyNumber(input) {
		let ok = "1234567890";

		for (let i = 0; i < input.value.length; i++) {
			if (ok.indexOf(input.value[i]) == -1) {
				return true;

			}
		}
	}

	function call() {
		let input1 = document.getElementById('input1');
		let input2 = document.getElementById('input2');
		let input3 = document.getElementById('input3');

		if (noBlank(input1) || lessThan(input1, 2)) {
			alert('이름 오류');
			input1.value = "";
			input1.focus();
			return false;
		}

		if (lessThan(input2, 3) || onlyNumber(input2)) {
			alert('키 오류');
			input2.value = "";
			input2.focus();
			return false;
		}

		if (onlyNumber(input3)) {
			alert('체중은 숫자만 입력해주세요');
			input3.value = "";
			input3.focus();
			return false;
		}

		return true;
	}
</script>
<div id="all">
	<form id="outline" action="BMIController" method="post"
		enctype="multipart/form-data" onsubmit="return call();">
		<table id="form">
			<tr>
				<td colspan="2" id="title">BMI검사</td>
			</tr>
			<tr>
				<td class="tdText">이름</td>
				<td><input placeholder="필수, 2글자 이상" id="input1" class="input"
					name="name"></td>
			</tr>
			<tr>
				<td class="tdText">키</td>
				<td><input type="number" placeholder="3자리이상, 숫자만" id="input2"
					class="input" name="height"></td>
			</tr>
			<tr>
				<td class="tdText">체중</td>
				<td><input type="number" placeholder="숫자만" id="input3"
					class="input" type="text" name="weight"></td>
			</tr>

			<tr>
				<td class="tdText">사진</td>
				<td><input type="file" name="photo"></td>
			</tr>


			<tr>
				<td colspan="2"><button id="btn">계산하기</button></td>
			</tr>

		</table>
	</form>
</div>
</body>
</html>