<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application"/>
<%
	request.setCharacterEncoding("utf-8");

	String sessionId = (String)session.getAttribute("sessionId");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	
	Board board = new Board();
	
	board.setTitle(title);
	board.setContent(content);
	board.setBnum(bnum);
	
	boardDAO.updateBoard(board);
%>
<script>
	alert("수정이 완료되었습니다.");
	location.href = "./boardList.jsp";
</script>