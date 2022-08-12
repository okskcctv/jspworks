<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello~ World</title>
</head>
<body>
	<h2>안녕~ JSP</h2>
	<hr>
	<!-- HTML 주석 -->
	<%-- JSP 주석 <%= %>는 Expression 태그 --%>
	<p>현재 날짜와 시간은 <%=LocalDateTime.now() %>입니다. </p>
</body>
</html>