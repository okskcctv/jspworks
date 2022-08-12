<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 패턴</title>
</head>
<%
	pageContext.setAttribute("fruit", "apple");
%>
<body>
	${names[1]}<br>
	
	<p>==================</p>
	<c:forEach var="name" items="${names}" >
		${name}<br>
	</c:forEach>
	<p>==================</p>
	
	${lotto[0]}<br>
	${lotto[1]}<br>
	${lotto[2]}<br>
	
	<p>==================</p>
	<c:forEach var="lotto" items="${lotto}" >
		${lotto}<br>
	</c:forEach>
	<p>==================</p>
	
	${cars.brand}<br>
	${cars.cc}<br>
	
	${fruit}<br>
	${param.n}<br>
	${empty param.n ? '값이 비어있습니다.' : param.n}<br>
	${header.accept}<br>
</body>
</html>