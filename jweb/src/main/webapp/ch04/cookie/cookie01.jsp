<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 로그인</title>
</head>
<body>
	<form action="cookieProcess.jsp" method="post">
		<p>
			<label for="userid">아이디 : </label>
			<input type="text" id="userid" name="userid" required>
		</p>
		<p>
			<label for="passwd">비밀번호 : </label>
			<input type="password" id="passwd" name="passwd" required>
		</p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>