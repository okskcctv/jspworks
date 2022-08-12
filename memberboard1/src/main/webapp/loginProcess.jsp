<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application" />
<%
	String memberId = request.getParameter("memberId");
	String passwd = request.getParameter("passwd");
	
	boolean result = memberDAO.checkLogin(memberId, passwd);
	
	if(result){
		session.setAttribute("sessionId", memberId); // 세션 발급
		response.sendRedirect("./main.jsp");
	}else{
%>
<script>
	alert("아이디나 비밀번호를 확인해주세요");
	history.go(-1);
</script>
<%
	}
%>