<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 객체를 이용한 이름 등록하기</title>
</head>
<body>
	<form action="process.jsp" method="post">
		<label for="name">이름 : </label>
		<input type="text" id="name" name="name">
		<input type="submit" value="등록">
	</form>
</body>
</html>