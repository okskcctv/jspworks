<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<script>
	document.addEventListener("keydown", function(event) {
	    if (event.key === 'Enter') {
	        checkMember();
	    }
	    if (event.key === 'ArrowUp'){
	    	history.go(0);
	    }
	});
	function checkMember(){
		// 폼 변수 할당
		let form = document.Member;
		// 입력 양식 값 변수 할당
		let id = form.id.value;
		let passwd = form.passwd.value;
		let name = form.name.value;
		let phone = form.phone1.value + "-" + form.phone2.value +
			"-" + form.phone3.value;
		let email = form.email.value;
		
		// 정규 표현식 변수 할당
		let regExpId = /^[a-zA-Zㄱ-ㅎ가-힣]/;	// 첫글자에 숫자, 특문 제외
		let regExpFullId = /[a-zA-Z]([-_]?[0-9a-zA-Z])*$/;	// 이후 -_ 제외한 특문 불가능, 영어만
		let regExpPasswd = /^[0-9]*$/;		// 숫자만 가능
		let regExpName = /^[가-힣]*$/;		// 한글만 가능
		let regExpPhone = /\d{2,3}-\d{3,4}-\d{4}/;	// 숫자 2, 3개 - 3, 4개 - 4개
		let regExpEmail //= /^[0-9a-zA-Z]*@[0-9a-zA-Z]*\.[a-zA-Z]{2,3}$/;
			= /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*\@[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		// 유효성 검사
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해야 합니다.");
			form.id.select();
			return false;
		}
		if(!regExpFullId.test(id)){
			alert("세상은 뜻대로 흘러가지 않는 법이지.");
			form.id.select();
			return false;
		}
		if(passwd == "" || !regExpPasswd.test(passwd)){
			alert("비밀번호는 숫자만 입력 가능합니다.");
			form.passwd.select();
			return false;
		}
		if(name == "" || !regExpName.test(name)){
			alert("이름은 한글만 입력 가능합니다.");
			form.name.select();
			return false;
		}
		if(!regExpPhone.test(phone)){
			alert("전화번호를 올바르게 입력해야 합니다.");
			form.phone1.focus();
			return false;
		}
		if(!regExpEmail.test(email)){
			alert("이메일을 올바르게 입력해야 합니다.");
			form.email.select();
			return false;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="validation_process.jsp" method="post" name="Member">
		<p>아이디: <input type="text" name="id">
		<p>비밀번호: <input type="password" name="passwd">
		<p>이 름: <input type="text" name="name">
		<p>연락처: <select name="phone1">
			<option value="010">010</option>
			<option value="02">02</option>
			<option value="031">031</option>
			<option value="041">041</option>
		</select> - <input type="text" maxlength="4" size="4" name="phone2">
		 - <input type="text" maxlength="4" size="4" name="phone3">
		<p>이메일: <input type="text" name="email">
		<p><button type="button" onclick="checkMember()">가입하기</button>
	</form>
</body>
</html>