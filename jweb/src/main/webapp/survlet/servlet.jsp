<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿에 요청하기</title>
</head>
<body>
	<form action="../login2" method="post">
		<p>
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="userid" required>
		</p>
		<p>
			<label for="pwd">비밀번호 : </label>
			<input type="password" id="pwd" name="passwd" required>
		</p>
		<p><input type="hidden" name="phone" value="010-7979-3355"></p> 
		<p><input type="submit" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>