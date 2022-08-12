<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	document.addEventListener("keydown", function(event) {
	    if (event.key === 'Backspace') {
	        history.go(-1);
	    }
	});
</script>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<h3>입력에 성공했습니다.</h3>
<p>아이디: <%= id %></p>
<p>비밀번호: <%= pwd %></p>