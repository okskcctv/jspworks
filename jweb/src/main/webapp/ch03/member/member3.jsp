<%@ page import="bean.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberBean Tag</title>
</head>
<body>
	<%
		MemberBean member = new MemberBean();
	%>
	<p>아이디 : <%=member.getId() %><br>
	<p>이 름 : <%=member.getName() %>
</body>
</html>