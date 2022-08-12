<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산</title>
</head>
	<jsp:useBean id="calc" class="bean.CalcBean"/>
	<!-- calc는 CalcBean 클래스의 객체(인트턴스)와 같다. -->
<body>
	<%
		int num = calc.calculate(4);
		out.println("4의 3제곱 : " + num);
	%>
</body>
</html>