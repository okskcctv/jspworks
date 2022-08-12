<%@ page import="com.dao.AddrBook" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 편집</title>
<link rel="stylesheet" href="./resources/css/addrBook.css">
<% 	String num = request.getParameter("num");	// num 속성 값 가져오기 %>
<script>
	document.addEventListener("keydown", function(event) {
		if (event.key === 'Enter'){
			document.edit.submit();
		}
	});
</script>
</head>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
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
		<h2>수정 하기</h2>
		<hr>
		<form action="addrEdit_process.jsp?num=<%=num %>" method="post" name="edit">
			<table id="tbl_view">
				<tr>
					<td>번호</td><td colspan=2><%=addrBook.getNum() %></td>
				</tr>
				<tr>
					<td></td>
					<td>현재정보</td><td>수정할내용</td>
				</tr>
				<tr>
					<td>이름</td><td><%=addrBook.getUsername() %></td>
					<td><input type="text" name="editUsername" maxlength=20 size=20></td>
				</tr>
				<tr>
					<td>전화번호</td><td><%=addrBook.getTel() %></td>
					<td><input type="text" name="editTel" maxlength=20 size=20></td>
				</tr>
				<tr>
					<td>이메일</td><td><%=addrBook.getEmail() %></td>
					<td><input type="text" name="editEmail" maxlength=20 size=20></td>
				</tr>
				<tr>
					<td>성별</td><td><%=addrBook.getGender() %></td>
					<td>
						<select name="editGender">
							<option <%if(addrBook.getGender().equals("남")){ %>selected<% } %>>남</option>
							<option <%if(addrBook.getGender().equals("여")){ %>selected<% } %>>여</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>가입일</td><td><%=addrBook.getJoinDate() %></td>
					<td><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
		<p><a href="./addrView.jsp?num=<%=num %>">[뒤로가기]</a>
		<p><a href="./addrList.jsp">[목록보기]</a>
	</div>
</body>
<% } %>
</html>