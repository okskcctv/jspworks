<%@ page import="com.dao.AddrBook" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	String num = request.getParameter("num");
	if(session.getAttribute("sessionId") == null){
%>
<script>
	var msg = "로그인 후 이용해 주세요. 로그인창으로 돌아갑니다.";
	var url = "./loginForm.jsp";
	alert(msg);
	location.href = url;
</script>
<%
	}
	if(num == null || num.equals("")){
%>
<script>
	var msg = "사용자 정보가 없습니다. 로그인창으로 돌아갑니다.";
	var url = "./loginForm.jsp";
	alert(msg);
	location.href = url;
</script>
<%
	}
	else{
		AddrBook addrBook = abDAO.getAbByUserNum(num);	// dao에서 메소드 호출
		if(addrBook == null){
			%>
			<script>
				var msg = "사용자 정보가 없습니다. 로그인창으로 돌아갑니다.";
				var url = "./loginForm.jsp";
				alert(msg);
				location.href = url;
			</script>
			<%
		}
		else{
			%>
			<script>
				var msg = "정말로 삭제하시겠습니까?";
				var url = "./addrDelete_process.jsp?num=<%=num %>";
				if(confirm(msg) == true){
					location.href = url;
				}
				else{
					alert("목록으로 돌아갑니다.");
					location.href = "./addrList.jsp";
				}
			</script>
<%
		}	// else문 닫음
	}		// 바깥 else문 닫음
%>