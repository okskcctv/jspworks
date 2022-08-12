<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	String num = request.getParameter("num");
	abDAO.deleteUser(num);
	session.invalidate();	// 모든 세션 삭제
%>
<script>
	var msg = "삭제가 완료되었습니다 로그인창으로 돌아갑니다.";
	var url = "./loginForm.jsp";
	alert(msg);
	location.href = url;
</script>