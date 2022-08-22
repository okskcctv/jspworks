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
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" />
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	// 현재 페이지
	int currentPage = Integer.parseInt(pageNum);
	
	// 페이지당 게시글 수
	int pageSize = 10;
	
	/*
	1 ~ 10
		1 page
	11 ~ 20
		2 page
	21 ~ 30
		3 page
	*/
	int startRow = (currentPage-1) * pageSize + 1;
	
	// 총 개수
	int total = boardDAO.getBoardCount();
%>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="tilte">
			<h1>게시글 목록</h1>
		</div>
		<div>
			<% int endPage = (int)Math.ceil((double)total / pageSize); %>
				총 게시글 수 : <%=total %>
			<table class="tbl_list">
				<thead>
					<tr>
						<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>상세보기</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(int i=0; i<boardDAO.getListAll(startRow, pageSize).size(); i++){
						Board board = boardDAO.getListAll(startRow, pageSize).get(i);
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
			<div style="margin-top: 10px; text-align: center">
				<% if(1 < currentPage-1){ %>
					<a href="boardList.jsp?pageNum=<%=currentPage-1 %>">이전</a>
				<% }else{ %>
					<a href="boardList.jsp?pageNum=1">이전</a>
				<% } %>
				<% for(int i=1; i<=endPage; i++){ %>
				<% if(currentPage == i){ %>
					<a href="boardList.jsp?pageNum=<%=i %>"><b><%=i %></b></a>
					<% }else{ %>
					<a href="boardList.jsp?pageNum=<%=i %>"><%=i %></a>
					<% } %>
				<% } %>
				<% if(endPage > currentPage+1){ %>
					<a href="boardList.jsp?pageNum=<%=currentPage+1 %>">다음</a>
				<% }else{ %>
					<a href="boardList.jsp?pageNum=<%=endPage %>">다음</a>
				<% } %>
			</div>
			<div class="writeBtn">
				<a href="./writeForm.jsp">
				<button type="button">글쓰기</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>