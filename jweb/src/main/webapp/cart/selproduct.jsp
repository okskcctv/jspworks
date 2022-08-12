<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String username = request.getParameter("username");
	session.setAttribute("userName", username);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택</title>
<link rel="stylesheet" href="../resources/css/cart.css">
</head>
<%
	if(session.getAttribute("userName") == null || session.getAttribute("userName") == ""){
		response.sendRedirect("./loginform.jsp");
	}
%>
<body>
	<div id="container">
		<h2>상품 선택</h2>
		<hr>
		<p><%=session.getAttribute("userName") %>님 환영합니다.</p>
		<form action="./productadd.jsp" method="post">
			<select name="product">
				<option>사과</option>
				<option>귤</option>
				<option>토마토</option>
				<option>키위</option>
			</select>
			<input type="submit" value="추가">
		</form>
		<p><input type="button" value="계산하기"
				  onclick="location.href='checkout.jsp'">
	  	<p><a href="./logoutprocess.jsp"><button type="button">로그아웃</button></a>
	</div>
</body>
</html>