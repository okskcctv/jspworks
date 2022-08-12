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
	/* request.setCharacterEncoding("utf-8"); */
	String name = request.getParameter("name");
%>
<p>입력된 name 값: <%=name %>