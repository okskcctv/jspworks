<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 추가</title>
<link rel="stylesheet" href="../resources/css/addrBook.css">
</head>
<jsp:useBean id="addrBook" class="com.dao.AddrBook" />
<jsp:setProperty property="username" name="addrBook" />
<jsp:setProperty property="tel" name="addrBook" />
<jsp:setProperty property="email" name="addrBook" />
<jsp:setProperty property="gender" name="addrBook" />
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application" />
<!-- application은 전체에 걸쳐서 공유 -->
<% if(addrBook.getUsername() == null || addrBook.getUsername().equals("")){%>
<script>
	var msg = "이름을 입력해주세요. 등록창으로 돌아갑니다.";
	var url = "./addrForm.jsp";
	alert(msg);
	location.href = url;
</script>
<%-- <jsp:forward page="./addrForm.jsp"/> --%>
<% } else{ abDAO.add(addrBook); // dao의 add() 메서드 호출%>
<body>
	<div id="container">
		<h2>등록 내용</h2>
		<hr>
		<p>이름: <%=addrBook.getUsername() %>
		<p>전화번호: <%=addrBook.getTel() %>
		<p>이메일: <%=addrBook.getEmail() %>
		<p>성별: <%=addrBook.getGender() %>
		<hr>
		<a href="addrList.jsp">목록 보기</a>
	</div>
</body>
<% } %>
</html>