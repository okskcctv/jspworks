/**
 * 데이터 길이 확인
 */
 
document.addEventListener("keydown", function(event) {
    if (event.key === 'Enter') {
        checkForm();
    }
});

function checkForm(){
	let form = document.loginForm;
	let id = form.id.value;
	let pwd = form.pwd.value;
	
	if(id.length < 4 || id.length > 12){
		alert("아이디는 4자에서 12자 사이입니다.");
		form.id.focus();
		return false;
	}
	else if(false){
		
	}
	else{
		form.submit();
	}
}