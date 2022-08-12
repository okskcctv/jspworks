<%@ page import="com.dao.AddrBook" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<link rel="stylesheet" href="../resources/css/addrBook.css">
</head>
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
%>
<body>
	<div id="container">
		<h2>상세 보기</h2>
		<hr>
		<table id="tbl_view">
			<tr>
				<td>이름</td><td><%=addrBook.getUsername() %></td>
			</tr>
			<tr>
				<td>전화번호</td><td><%=addrBook.getTel() %></td>
			</tr>
			<tr>
				<td>이메일</td><td><%=addrBook.getEmail() %></td>
			</tr>
			<tr>
				<td>성별</td><td><%=addrBook.getGender() %></td>
			</tr>
		</table>
		<a href="./addrEdit.jsp?username=<%=addrBook.getUsername() %>">
		수정하기</a>
		<p><a href="./addrList.jsp">목록보기</a>
	</div>
</body>
<% } %>
</html>