<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산하기</title>
<link rel="stylesheet" href="../resources/css/cart.css">
</head>
<body>
	<div id="container">
		<h2>계산하기</h2>
		<p><%=session.getAttribute("userName") %>님이 선택한 상품 목록</p>
		<hr>
		<%
			// 세션 유지
			ArrayList<String> productList = (ArrayList)session.getAttribute("productList");
			String username = (String)session.getAttribute("userName");
			if(session.getAttribute("userName") == null || session.getAttribute("userName") == ""){
				response.sendRedirect("./loginform.jsp");
			}
			// 상품 목록
			if(productList == null || productList.size() == 0){
		%>
		<script>
			var msg = "추가된 상품이 없습니다. 상품 추가 창으로 돌아갑니다.";
			var url = "./selproduct.jsp?username=<%=username %>";
			alert(msg);
			location.href = url;
		</script>
		<%-- <jsp:forward page="./selproduct.jsp"/> --%>
		<%
			}
			else{
	 			for(String product : productList)
					out.println(product + "<br>");
			}
		%>
		<p><a href="./deletelist.jsp?username=<%=username %>"><button type="button">목록삭제</button></a>
		<form action="./deletesellist.jsp">
			<p>목록에서 지울 상품을 입력해 주세요.
			<p><input type="text" id="select" name="select">
			<p><input type="submit" value="선택삭제">
		</form>
		<p><a href="./purchase.jsp?username=<%=username %>"><button type="button">계산완료</button></a>
		<p><a href="./logoutprocess.jsp"><button type="button">로그아웃</button></a>
	</div>
</body>
</html>