<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	document.addEventListener("keydown", function(event){
		if(event.key == "Backspace"){
			history.go(-1);
		}
	});
</script>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	String name = request.getParameter("name");
%>
<p>아이디: <%=id %>
<p>비밀번호: <%=pw %>
<p>이 름: <%=name %>