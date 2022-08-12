<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 예제</title>
</head>
<body>
	<%
		int num = 11;
	
		if(num % 2 == 0){
			out.println("짝수");
		} else{
			out.println("홀수");
		}
	%>
	<c:set var="num" value="11" />
	<c:if test="${num%2==0}">
		<br>${num}은 짝수 입니다.
	</c:if>
	<c:if test="${num%2==1}">
		<br>${num}은 홀수 입니다.
	</c:if>
</body>
</html>