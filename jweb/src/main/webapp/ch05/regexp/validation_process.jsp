<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
document.addEventListener("keydown", function(event) {
    if (event.key === 'Backspace') {
        history.go(-1);
    }
});
</script>
<% request.setCharacterEncoding("utf-8"); %>

<p>아이디 : <%=request.getParameter("id") %>
<p>비밀번호 : <%=request.getParameter("passwd") %>
<p>이 름 : <%=request.getParameter("name") %>
<p>연락처 : <%=request.getParameter("phone1") %>
		  -<%=request.getParameter("phone2") %>
		  -<%=request.getParameter("phone3") %>
<p>이메일 : <%=request.getParameter("email") %>