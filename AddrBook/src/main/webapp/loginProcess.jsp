<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./resources/css/addrBook.css">
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application" />
<%
	String email = request.getParameter("email");
	boolean result = abDAO.checkLogin(email);
	
	if(result){
		session.setAttribute("sessionId", email);	// 세션 발급(이름 - sessionId)
	}else{
		out.println("<script>");
		out.println("alert('이메일이 일치하지 않습니다.')");
		out.println("history.go(-1)");
		out.println("</script>");
	}
%>
<script>
	document.addEventListener("keydown", function(event) {
	    if (event.key === 'Enter') {
			var url = "./addrList.jsp";
			location.href = url;
	    }
	});
</script>
<body>
	<div id="container">
		<h2><%=session.getAttribute("sessionId") %>으로 로그인되었습니다.</h2>
		<p><a href="./addrList.jsp">[목록 보기]</a></p>
	</div>
</body>