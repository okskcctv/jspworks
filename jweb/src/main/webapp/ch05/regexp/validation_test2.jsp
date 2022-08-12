<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script>
	document.addEventListener("keydown", function(event){
		if(event.key == "Enter"){
			checkMember();
		}
		if(event.key == "ArrowUp"){
			history.go(0);	// 새로고침
		}
	});
	function checkMember(){
		let form = document.Member;
		let id = form.id.value;
		let pw = form.passwd.value;
		let name = form.name.value;
		
		let regExpId = /^[a-zA-Z0-9]/;
		let regExpPw1 = /[a-zA-Z0-9]/;
		let regExpPw2 = /[~!@#$%^&*()?]/;
		
		if(id == ""){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return false;
		}
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해주세요.");
			form.id.select();
			return false;
		}
		if(pw == ""){
			alert("비밀번호를 입력해주세요.");
			form.passwd.focus();
			return false;
		}
		if(pw.length < 8 || pw.length > 12 || !regExpPw1.test(pw) || !regExpPw2.test(pw)){
			alert("비밀번호는 영문자, 숫자, 특수문자 포함 8~12자 사이의 길이입니다.");
			form.passwd.select();
			return false;
		}
		if(pw.search(id) != -1){
			alert("비밀번호는 아이디를 포함할 수 없습니다.");
			form.passwd.focus();
			return false;
		}
		if(name == ""){
			alert("이름을 입력해주세요.");
			form.name.focus();
			return false;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="test_process.jsp" method="post" name="Member">
		<p>아이디: <input type="text" name="id">
		<p>비밀번호: <input type="password" name="passwd">
		<p>이름: <input type="text" name="name">
		<p><button type="button" onclick="checkMember()">가입하기</button>
	</form>
</body>
</html>