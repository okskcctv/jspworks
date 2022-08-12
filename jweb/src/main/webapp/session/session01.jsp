<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="session02.jsp" method="post">
		<p>
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="userid" required>
		</p>
		<p>
			<label for="pwd">비밀번호 : </label>
			<input type="password" id="pwd" name="passwd" required>
		</p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>