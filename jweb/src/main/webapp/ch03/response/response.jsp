<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 객체</title>
</head>
<body>
	<p>이 페이지는 5초 마다 새로고침 됩니다.</p>
	<%
		response.setIntHeader("Refresh", 5);
	%>
	<p><%= new Date() %>
</body>
</html>