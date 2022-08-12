<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberBean 태그</title>
</head>
<body>
	<jsp:useBean id="member" class="bean.MemberBean" scope="request"/>
	<jsp:setProperty property="id" name="member"/>
	<jsp:setProperty property="name" name="member"/>
	
	<!-- member는 MemberBean 클래스의 객체(인스턴스)와 같다. -->
	<p>아이디 : <%=member.getId() %>
	<p>이 름 : <%=member.getName() %>
</body>
</html>