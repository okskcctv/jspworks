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
		<h2>수정 하기</h2>
		<hr>
		<p>수정을 원하지 않는 항목은 비워주세요.
		<form action="addrEditprocess.jsp?username=<%=uname %>" method="post">
			<table id="tbl_view">
				<tr>
					<td>이름</td><td><%=addrBook.getUsername() %></td>
					<td><input type="text" name="editusername" maxlength=20 size=20></td>
				</tr>
				<tr>
					<td>전화번호</td><td><%=addrBook.getTel() %></td>
					<td><input type="text" name="edittel" maxlength=20 size=20></td>
				</tr>
				<tr>
					<td>이메일</td><td><%=addrBook.getEmail() %></td>
					<td><input type="text" name="editemail" maxlength=20 size=20></td>
				</tr>
				<tr>
					<td>성별</td><td><%=addrBook.getGender() %></td>
					<td>
						<select name="editgender">
							<option <% if(addrBook.getGender().equals("남")){ %>selected<% } %>>남</option>
							<option <% if(addrBook.getGender().equals("여")){ %>selected<% } %>>여</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="submit" value="수정">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		<p><a href="./addrList.jsp">목록보기</a>
	</div>
</body>
<% } %>
</html>