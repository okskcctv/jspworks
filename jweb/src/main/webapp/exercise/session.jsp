<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="session_process.jsp">
		<p>
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="id">
		</p>
		<p>
			<label for="pw">비밀번호 : </label>
			<input type="password" id="pw" name="pw">
		</p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>