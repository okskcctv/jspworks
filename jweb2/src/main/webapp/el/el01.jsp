<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어 실습</title>
</head>
<body>
	<h3>문자, 숫자 데이터 표현</h3>
	${300}<br>
	${"감사합니다."}<br>
	${10+1}<br>
	${300+"10"}<br>
	
	<h3>산술 연산자</h3>
	\${7 + 4} : ${7 + 4}<br>
	\${7 - 4} : ${7 - 4}<br>
	\${7 * 4} : ${7 * 4}<br>
	\${7 / 4} : ${7 / 4}<br>
	\${7 % 4} : ${7 % 4}<br>
</body>
</html>