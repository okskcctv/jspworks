<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String shipping_cartId = "";		// 주문 번호
	String shipping_shippingDate = "";	// 배송 일자
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i];
			String name = cookie.getName();
			if(name.equals("Shipping_cartId")){
				shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
			}
			if(name.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
		<p> 주문은 <%=shipping_shippingDate %>에 배송될 예정입니다.
		<p> 주문번호: <%=shipping_cartId %>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
	</div>
</body>
</html>
<%
	// 모든 세션 삭제
	session.invalidate();

	// 모든 쿠키 삭제
	for(int i=0; i<cookies.length; i++){
		Cookie cookie = cookies[i];
		String name = cookie.getName();
		if(name.equals("Shipping_cartId"))
			cookie.setMaxAge(0);
		if(name.equals("Shipping_name"))
			cookie.setMaxAge(0);
		if(name.equals("Shipping_shippingDate"))
			cookie.setMaxAge(0);
		if(name.equals("Shipping_country"))
			cookie.setMaxAge(0);
		if(name.equals("Shipping_zipCode"))
			cookie.setMaxAge(0);
		if(name.equals("Shipping_addressName"))
			cookie.setMaxAge(0);
		
		response.addCookie(cookie);
	}
%>