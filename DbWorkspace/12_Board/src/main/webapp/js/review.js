function reviewDel(n){
	
	let ok = confirm('삭제 합니까?');
	
	if(ok){
		location.href='ReviewDeleteC?no=' + n;
	}
	
}