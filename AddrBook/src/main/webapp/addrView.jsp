<%@ page import="com.dao.AddrBook" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<link rel="stylesheet" href="./resources/css/addrBook.css">
<script>
	document.addEventListener("keydown", function(event) {
	    if (event.key === 'Backspace') {
	    	var url = "./addrList.jsp";
			location.href = url;
	    }
	});
</script>
</head>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	String num = request.getParameter("num");	// num 속성 값 가져오기
	if(session.getAttribute("sessionId") == null){
%>
<script>
	var msg = "로그인 후 이용해 주세요. 로그인창으로 돌아갑니다.";
	var url = "./loginForm.jsp";
	alert(msg);
	location.href = url;
</script>
<%
	}
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
%>
<body>
	<div id="container">
		<h2>상세 보기</h2>
		<hr>
		<table id="tbl_view">
			<tr>
				<td>번호</td><td><%=addrBook.getNum() %></td>
			</tr>
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
			<tr>
				<td>가입일</td><td><%=addrBook.getJoinDate() %></td>
			</tr>
		</table>
		<% if(session.getAttribute("sessionId").equals(addrBook.getEmail())){ %>
		<p><a href="./addrEdit.jsp?num=<%=num %>">[수정하기]</a>
		<p><a href="./addrDelete.jsp?num=<%=num %>">[삭제하기]</a>
		<% } %>
		<p><a href="./addrList.jsp">[목록보기]</a>
	</div>
</body>
<% } %>
</html>