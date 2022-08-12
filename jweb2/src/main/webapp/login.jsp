<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Security</title>
</head>
<body>
	<form name="loginForm" action="j_security_check">
		<p>아 이 디: <input type="text" name="j_username">
		<p>패스워드: <input type="password" name="j_password">
		<p><input type="submit" value="로그인"></p>
	</form>
</body>
</html>