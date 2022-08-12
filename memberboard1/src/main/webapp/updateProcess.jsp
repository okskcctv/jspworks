<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.repository.Member" %>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application"/>
<%
	request.setCharacterEncoding("utf-8");

	Member member = new Member();

	member.setMemberId(request.getParameter("memberId"));
	member.setPasswd(request.getParameter("passwd"));
	member.setName(request.getParameter("name"));
	member.setGender(request.getParameter("gender"));
	
	memberDAO.updateMember(member);
%>	
<script>
	alert("수정이 완료되었습니다.");
	location.href = "./memberView.jsp";
</script>