<%@ page import="com.dao.AddrBook" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	String num = request.getParameter("num");
	if(num == null || num.equals("")){
%>
<script>
	var msg = "사용자 정보가 없습니다. 로그인창으로 돌아갑니다.";
	var url = "./loginForm.jsp";
	alert(msg);
	location.href = url;
</script>
<%
	}
	else{
		AddrBook addrBook = abDAO.getAbByUserNum(num);	// dao에서 메소드 호출
		String username = request.getParameter("editUsername");
		String tel = request.getParameter("editTel");
		String email = request.getParameter("editEmail");
		String gender = request.getParameter("editGender");
		if(!username.equals("")){
			addrBook.setUsername(username);
		}
		if(!tel.equals("")){
			addrBook.setTel(tel);
		}
		if(!email.equals("")){
			addrBook.setEmail(email);
		}
		if(!gender.equals("")){
			addrBook.setGender(gender);
		}
		abDAO.editUser(addrBook);
%>
<script>
	var msg = "수정이 완료되었습니다.";
	var url = "./addrList.jsp";
	alert(msg);
	location.href = url;
</script>
<% } %>