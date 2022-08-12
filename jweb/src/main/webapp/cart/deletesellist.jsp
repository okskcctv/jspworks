<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> productList = (ArrayList)session.getAttribute("productList");
	String select = request.getParameter("select");
	boolean find = false;
	if(productList.size() == 0 || productList == null){
%>
<jsp:forward page="./selproduct.jsp"/>
<%
	}
	else{
		for(int i=0; i<productList.size(); i++){
			if(select.equals(productList.get(i))){
				productList.remove(i);
%>
<jsp:forward page="./checkout.jsp"/>
<%
				find = true;
				break;
			}
		}
		if(find == false){
%>
<script>
	var msg = "삭제할 항목이 없습니다.";
	var url = "./checkout.jsp";
	alert(msg);
	location.href = url;
</script>
<%
		}
	}
%>