<%@page import="com.repository.BoardDAO"%>
<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application"/> --%>
<%
	request.setCharacterEncoding("utf-8");

	String memberId = (String)session.getAttribute("sessionId");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setMemberId(memberId);
	
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.insertBoard(board);
	
	response.sendRedirect("./boardList.jsp");
%>