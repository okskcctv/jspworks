<%@ page import="com.dao.AddrBook" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	abDAO.reform();
%>
<script>
	var msg = "재정렬이 완료되었습니다";
	var url = "./addrList.jsp";
	alert(msg);
	location.href = url;
</script>
<%
%>