<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트 컴에 저장된 쿠키를 가져온다.
	Cookie[] cookies = request.getCookies();

	// 쿠기 삭제
	for(int i=0; i<cookies.length; i++){
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
		// 서버쪽에서 클라이언트로 삭제된 쿠키정보를 응답.
	}
	
	response.sendRedirect("cookie02.jsp");
	// cookie02 페이지로 강제 이동
%>