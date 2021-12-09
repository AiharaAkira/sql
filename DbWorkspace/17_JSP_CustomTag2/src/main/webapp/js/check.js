function call(){
	//값
	let input = document.getElementById('i1');
	if(isEmpty(input) || isNotNumber(input)){
		alert('숫자를 입력하세요');
		
		input.value= "";
		input.focus();
		
		return false;
	}
return true;
}