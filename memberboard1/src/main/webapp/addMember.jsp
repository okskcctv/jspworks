<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.repository.Member" %>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application" />
<%
	request.setCharacterEncoding("utf-8");

	String memberId = request.getParameter("memberId");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	if(!memberDAO.IdCheck(memberId)){
%>
	<script>
		alert("이미 사용중인 아이디입니다.");
		history.go(-1);
	</script>
<%
	}else{
		Member member = new Member();
		member.setMemberId(memberId);
		member.setPasswd(passwd);
		member.setName(name);
		member.setGender(gender);
		
		memberDAO.addMember(member);
		
		response.sendRedirect("./loginMember.jsp");
	}
%>