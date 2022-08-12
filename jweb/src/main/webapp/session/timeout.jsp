<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>--세션 유효 시간 변경 전(30분)--</h3>
<% 
	int time = session.getMaxInactiveInterval() / 60;

	out.println("<p>" + session.getMaxInactiveInterval() + "초</p>");
	out.println("<p>" + time + "분</p>");
%>
<h3>--세션 유효 시간 변경 후(3분)--</h3>
<% 
	session.setMaxInactiveInterval(3*60);

	time = session.getMaxInactiveInterval() / 60;

	out.println("<p>" + session.getMaxInactiveInterval() + "초</p>");
	out.println("<p>" + time + "분</p>");
%>