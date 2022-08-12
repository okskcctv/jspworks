<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> productList = (ArrayList)session.getAttribute("productList");
	
	if(productList.size() == 0 || productList == null){
%>
<script>
	var msg = "추가된 상품이 없습니다. 상품 추가 창으로 돌아갑니다.";
	var url = "./selproduct.jsp";
	alert(msg);
	location.href = url;
</script>
<%
	}
	else{
		productList.remove(0);
	}
%>
<script>
	var url = "./checkout.jsp";
	location.href = url;
</script>