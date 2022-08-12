<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<link rel="stylesheet" href="../resources/css/common.css">
<script src="../resources/js/script.js"></script>
</head>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application"/>
<%
	int bnum = 0;
	if(request.getParameter("bnum") != null){
		bnum = Integer.parseInt(request.getParameter("bnum"));
	}
	String sessionId = (String)session.getAttribute("sessionId");
	if(sessionId == null){
		sessionId = "";
	}
	if(bnum == 0){
		response.sendRedirect("./boardList.jsp");
	}else{
		Board board = boardDAO.getBoard(bnum);
%>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>게시글 조회</h1>
		</div>
		<div>
			<form action="./updateProcess.jsp?bnum=<%=bnum %>" method="post" name="writeForm">
				<table class="tbl_write">
					<tr>
						<td><input type="text" name="title" class="w_title"
							placeholder="글 제목" required
							<%if(!sessionId.equals(board.getMemberId())){ %> readonly <% } %>
							value="<%=board.getTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea rows="20" cols="60" name="content"
							placeholder="글 내용" required
							<%if(!sessionId.equals(board.getMemberId())){ %> readonly <% } %>
							><%=board.getContent() %></textarea></td>
					</tr>
				</table>
				<div class="writeBtn">
					<a href="./boardList.jsp"><input type="button" value="목록"></a>
				<%if(sessionId.equals(board.getMemberId())){ %>
					<input type="submit" value="수정">
					<a href="./deleteProcess.jsp?bnum=<%=bnum %>"><input type="button" value="삭제"></a>
				<% } %>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
<% } %>
</body>
</html>