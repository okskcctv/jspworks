<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	
	if(id.equals("admin") && passwd.equals("0000")){
		/* Cookie(쿠키이름, 쿠키값) */
		Cookie cookieID = new Cookie("userID", id);
		Cookie cookiePW = new Cookie("userPW", passwd);
		
/* 		// response로 생성
		response.addCookie(cookieID);
		response.addCookie(cookiePW); */
		
		// 쿠키 유효기간 설정
		cookieID.setMaxAge(24*60*60); // 유효기간 1일로 설정
		cookiePW.setMaxAge(24*60*60); // 유효기간 1일로 설정
		
		// response로 생성
		response.addCookie(cookieID);
		response.addCookie(cookiePW);
		
		out.println("쿠키 생성이 성공했습니다.");
	}
	else{
		out.println("쿠키 생성이 실패했습니다.");
	}
%>