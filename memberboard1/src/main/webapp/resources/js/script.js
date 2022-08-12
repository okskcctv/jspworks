// memberForm 스크립트
function login(){
	let form = document.regForm;
	let id = form.memberId.value;
	let pw = form.passwd.value;
	let pwc = form.passwd_confirm.value;
	let name = form.name.value;
	
	let regExpId = /^[a-zA-Z0-9]*$/;
	let regExpPw1 = /[a-zA-Z0-9]/;
	let regExpPw2 = /[-_~!@#$%^&*()+?]/;
	let regExpPw3 = /[ㄱ-ㅎㅏ-ㅣ가-힣]/;
	
	if(id == ""){
		alert("아이디를 입력해 주세요.");
		form.memberId.focus();
		return false;
	}
	if(id.length < 4 || id.length > 12 || !regExpId.test(id)){
		alert("아이디는 4~12자 사이의 영문 및 숫자입니다.");
		form.memberId.select();
		return false;
	}
	if(pw == ""){
		alert("비밀번호를 입력해 주세요.");
		form.passwd.focus();
		return false;
	}
	if(pw.length < 8 || pw.length > 12 || !regExpPw1.test(pw) || !regExpPw2.test(pw)
			|| regExpPw3.test(pw)){
		alert("비밀번호는 8~12자 사이의 영문 및 숫자와 특수문자 입니다.");
		form.passwd.select();
		return false;
	}
	if(pw != pwc){
		alert("비밀번호확인이 일치하지 않습니다.");
		form.passwd_confirm.select();
		return false;
	}
	if(name == ""){
		alert("이름을 입력해 주세요.");
		form.name.focus();
		return false;
	}
	form.submit();
}

function Idcheck(){
	let form = document.regForm;
	let id = form.memberId.value;
	var a = document.createElement('a');	// 가상의 a객체 생성
	a.target="hid";							// a 타겟 설정
	a.href="./Idcheck.jsp?memberId=" + id;	// a 링크 설정
	a.click();								// a 클릭
}

// memberView 스크립트
function checkMember(){
	let form = document.updateForm;
	let pw = form.passwd.value;
	let pwc = form.passwd_confirm.value;
	let name = form.name.value;
	
	if(pw == ""){
		alert("비밀번호를 입력해 주세요.");
		form.passwd.focus();
		return false;
	}
	if(pw.length < 8 || pw.length > 12){
		alert("비밀번호는 8~12자 사이의 영문 및 숫자와 특수문자 입니다.");
		form.passwd.select();
		return false;
	}
	if(pw != pwc){
		alert("비밀번호확인이 일치하지 않습니다.");
		form.passwd_confirm.select();
		return false;
	}
	if(name == ""){
		alert("이름을 입력해 주세요.");
		form.name.focus();
		return false;
	}
	
	form.submit();
}