<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 자료 처리</title>
</head>
<body>
	<form action="process.jsp" method="post">
		<p>
			오렌지<input type="checkbox" name="fruit" value="Orange" checked>
			사과<input type="checkbox" name="fruit" value="Apple">
			바나나<input type="checkbox" name="fruit" value="Banana">
			<input type="submit" value="전송">
	</form>
</body>
</html>