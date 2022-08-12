<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 세션 유지
	ArrayList<String> productList = (ArrayList)session.getAttribute("productList");
	
	if(productList == null){
		productList = new ArrayList<>();
		session.setAttribute("productList", productList);
	}
	
	String product = request.getParameter("product");
	
	productList.add(product);
	
%>
<script>
	alert("<%=product %> 가(이) 추가되었습니다.");
	history.go(-1);	// 뒤로가기
</script>