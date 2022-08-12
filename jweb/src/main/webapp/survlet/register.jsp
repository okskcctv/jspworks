<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../register" method="post">
		<p>
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="id">
		</p>
		<p>
			<label for="pwd">비밀번호 : </label>
			<input type="password" id="pwd" name="pwd">
		</p>
		<p>
			<label for="subject">과목</label>
			<input type="checkbox" id="subject" name="subject" value="java" checked>java
			<input type="checkbox" id="subject" name="subject" value="jsp">jsp
			<input type="checkbox" id="subject" name="subject" value="spring">spring
			<input type="checkbox" id="subject" name="subject" value="android">android	
		</p>
		<p><input type="submit" value="신청하기"></p>
		<p><input type="reset" value="다시입력"></p>
	</form>
</body>
</html>