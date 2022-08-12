<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
<script>
	document.addEventListener("keydown", function(event) {
	    if (event.key === 'Enter') {
	        checkForm();
	    }
	});
	function checkForm(){
		let form = document.frm;
		let str = form.name.value;
		let regExp = /^[a-zA-Z가-힣]/;
		
		if(!regExp.test(str)){
			alert("이름은 숫자로 시작할 수 없습니다.");
			return false;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<form action="" method="post" name="frm">
		<p>이름: <input type="text" name="name">
		<input type="submit" value="전송" onclick="checkForm()">
	</form>
</body>
</html>