<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<script src="../../resources/js/validation.js"></script>
</head>
<body>
	<form action="loginProcess2.jsp" method="post" name="loginForm">
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