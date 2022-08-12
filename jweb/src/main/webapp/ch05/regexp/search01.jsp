<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트 search() 함수</title>
</head>
<body>
	<!-- search()는 정확히 일치하는 문자열의 위치(index) -->
	<h1>JavaScript Strings</h1>
	<h2>The search() Method</h2>
	
	<p>search() searches a string for a value and returns the position</p>
	
	<p id="demo"></p>
	
	<script>
		let text = "Mr. Blue has a blue house"
		let position = text.search(/blue/i);
		
		document.getElementById("demo").innerHTML = position;
	</script>
</body>
</html>