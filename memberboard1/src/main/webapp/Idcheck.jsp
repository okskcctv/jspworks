<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application" />
<%
	String id = request.getParameter("memberId");
	if(!memberDAO.IdCheck(id)){
%>
	<script>
		alert("이미 사용중인 아이디 입니다.");
	</script>
<%
	}
%>