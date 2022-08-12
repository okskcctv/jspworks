<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 정보</title>
<link rel="stylesheet" href="./resources/css/common.css">
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>게시판 정보</h1>
		</div>
		<div class="msg">
			<c:choose>
				<c:when test="${msg eq 'write' }">
					<h2>게시글이 등록되었습니다.</h2>
				</c:when>
				<c:when test="${msg eq 'write_error' }">
					<h2>로그인 후 이용해주세요.</h2>
				</c:when>
				<c:when test="${msg eq 'update' }">
					<h2>수정이 완료되었습니다.</h2>
				</c:when>
				<c:when test="${msg eq 'delete' }">
					<h2>삭제가 완료되었습니다.</h2>
				</c:when>
			</c:choose>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>