<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/common.css">
</head>
<body>
	<nav>
	<c:if test="${sessionId eq null}">
		<ul>
			<li><a href="/main.jsp">Home</a></li>
			<li><a href="/login.do">로그인</a></li>
			<li><a href="/memberForm.do">회원가입</a></li>
			<li><a href="/memberList.do">회원목록</a></li>
		</ul>
	</c:if>
	<c:if test="${sessionId ne null}">
		<ul>
			<li><a href="/main.jsp">Home</a></li>
			<li><a href="/boardList.do">게시판</a></li>
			<li><a href="/memberView.do">나의 정보</a></li>
			<li><a href="/logout.do">(<c:out value="${sessionId}" />님) 로그아웃</a></li>
		</ul>
	</c:if>
	</nav>
</body>
</html>