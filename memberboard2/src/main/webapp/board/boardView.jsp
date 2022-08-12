<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<link rel="stylesheet" href="../resources/css/common.css">
<script src="../resources/js/script.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>게시글 조회</h1>
		</div>
		<div>
			<form action="/updateBoard.do?bnum=${board.bnum}" method="post" name="writeForm">
				<table class="tbl_view">
				<c:set var="sessionId" value="${sessionId}" />
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" class="w_title"
							placeholder="글 제목" required
							<c:if test="${board.memberId != sessionId }">readonly</c:if>
							value="${board.title}"></td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td><input type="text" name="memberId" readonly value="${board.memberId}"></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><c:out value="${board.hit }" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="20" cols="60" name="content"
							placeholder="글 내용" required
							<c:if test="${board.memberId != sessionId}">readonly</c:if>
							>${board.content}</textarea></td>
					</tr>
				</table>
				<div class="writeBtn">
					<a href="/boardList.do"><input type="button" value="목록"></a>
					<c:if test="${board.memberId eq sessionId }">
						<input type="submit" value="수정">
						<a href="/deleteBoard.do?bnum=${board.bnum}"
						onclick="return confirm('정말로 삭제하시겠습니까?')">
						<input type="button" value="삭제"></a>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>