<%@ page import="com.dao.AddrBook" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	String uname = request.getParameter("username");	// username 속성 값 가져오기
	
	if(uname == null || uname.equals("")){
%>
<script>
	var msg = "사용자 정보가 없습니다. 등록창으로 돌아갑니다.";
	var url = "./addrForm.jsp";
	alert(msg);
	location.href = url;
</script>
<%
	}
	else{
		AddrBook addrBook = abDAO.getAbByUserName(uname);	// dao에서 메소드 호출
		
		String editusername = request.getParameter("editusername");
		String edittel = request.getParameter("edittel");
		String editemail = request.getParameter("editemail");
		String editgender = request.getParameter("editgender");
		
		if(!editusername.equals("") && editusername != null)
			addrBook.setUsername(editusername);
		if(!edittel.equals("") && edittel != null)
			addrBook.setTel(edittel);
		if(!editemail.equals("") && editemail != null)
			addrBook.setEmail(editemail);
		if(!editgender.equals("") && editgender != null)
			addrBook.setGender(editgender);
%>
<script>
	var msg = "수정이 완료되었습니다.";
	var url = "./addrList.jsp";
	alert(msg);
	location.href = url;
</script>
<% } %>