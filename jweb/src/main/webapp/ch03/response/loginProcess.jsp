<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("passwd");
	
	if(id.equals("admin") && pwd.equals("1234")){
		// out.println("로그인을 성공했습니다.");
		response.sendRedirect("loginSuccess.jsp");
	}
	else{
		// out.println("로그인을 실패했습니다.");
		response.sendRedirect("loginFail.jsp");
	}
%>