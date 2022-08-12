<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<%
	if(session.getAttribute("sessionId") == null){
%>
<script>
	alert("로그인 후 이용가능합니다.");
	location.href = "../loginMember.jsp";
</script>
<% }else{ %>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="tilte">
			<h1>게시글 목록</h1>
		</div>
		<div>
			<table class="tbl_list">
			<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" />
				<thead>
					<tr>
						<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>상세보기</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(int i=0; i<boardDAO.getListAll().size(); i++){
						Board board = boardDAO.getListAll().get(i);
				%>
					<tr>
						<td><%=board.getBnum() %></td>
						<td><%=board.getTitle() %></td>
						<td><%=board.getMemberId() %></td>
						<td><%=board.getRegDate() %></td>
						<td><a href="./boardView.jsp?bnum=<%=board.getBnum() %>"><button type="button">보기</button></a></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<div class="writeBtn">
				<a href="./writeForm.jsp">
				<button type="button">글쓰기</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	<% } %>
</body>
</html>