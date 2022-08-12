<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산 처리</title>
<script>
	document.addEventListener("keydown", function(event){
		if(event.key == "Backspace")
			history.go(-1);
	});
</script>
</head>
<body>
	<%
		String num = request.getParameter("number");
	
		if(Double.parseDouble(num)%2==0){
			out.println("짝수입니다.");
		} else{
			out.println("홀수입니다.");
		}
	%>
	<c:set var="num" value="${param.number}" />
	<c:if test="${num%2==0}">
		<br><c:out value="${num}" />은 짝수입니다.
	</c:if>
	<c:if test="${num%2==1}">
		<br><c:out value="${num}" />은 홀수입니다.
	</c:if>
</body>
</html>