<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	document.addEventListener("keydown", function(event) {
	    if (event.key === 'Enter') {
	        checkForm();
	    }
	    if (event.key === 'ArrowUp') {
	        history.go(0);
	    }
	});
	/* 아이디 체크 : 영문 소문자만 입력 */
	/* 비밀번호 체크 :  숫자만 입력*/
	function checkForm(){
		let form = document.loginForm;	// 폼 이름
		let userid = form.id.value;		// 유저 아이디
		let userpw = form.pwd.value;	// 유저 비밀번호
		
		let a = /^[a-z]*$/
		
		if(userid == ""){
			alert("아이디를 입력해 주세요.");
			form.id.focus();	// 커서 아이디에 위치
			return false;
		}
		if(!a.test(userid)){
			alert("아이디는 영어 소문자만 입력 가능합니다.");
			form.id.focus();
			return false;
		}
		/* for(var i=0; i<userid.length; i++){
			var ch = userid.charAt(i);
			
			if((ch < 'a' || ch > 'z')){
				// (ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')
				// 논리식 오류 사실상 (ch < 'a' || ch > 'z') 만 있는거나 다름없음
				// ch > 'A' || ch < 'Z' 에서 or 이기 때문에 전 범위임
				// (ch < 'a' || ch > 'z') && (ch > 'A' && ch < 'Z') || (ch > '0' && ch < '9')
				// 위의 식이 숫자, 대문자를 제외하는 논리식 이외 특수문자 등은 가능함
				alert("아이디는 영어 소문자만 입력 가능합니다.");
				form.id.focus();
				return false;
			}
		} */
		
		if(userpw == ""){
			alert("비밀번호를 입력해 주세요.");
			form.pwd.focus();
			return false;
		}
		if(isNaN(userpw)){
			alert("비밀번호는 숫자만 입력 가능합니다.");
			document.getElementById("pwd").value = "";
			form.pwd.focus();
			return false;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<form action="../validation/loginProcess2.jsp" method="post" name="loginForm">
		<p>
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="id">
		</p>
		<p>
			<label for="pwd">비밀번호 : </label>
			<input type="password" id="pwd" name="pwd">
		</p>
		<p><button type="button" onclick="checkForm()">전송</button></p>
	</form>
</body>
</html>