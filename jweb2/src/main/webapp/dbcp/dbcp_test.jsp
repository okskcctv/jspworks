<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String email = null;
	email = request.getParameter("email");
	
	
	try {
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");	// 객체 참조(url)
		ds = (DataSource)envContext.lookup("jdbc/oracle");	// java:/comp/env/jdbc/oracle
		
		conn = ds.getConnection();
		if(email != null){
			String sql = "INSERT INTO dbcp_test(name, email) VALUES (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("name"));	// 폼 입력값 받기
			pstmt.setString(2, request.getParameter("email"));
			pstmt.executeUpdate();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

%>
<body>
	<div id="container">
		<h2>이벤트 등록</h2>
		<hr>
		<form action="" method="post">
			<p>이름: <input type="text" name="name" required="required">
			   이메일: <input type="text" name="email" required="required">
			   <input type="submit" value="등록">
		</form>
	</div>
	<hr>
	<p>=== 등록 목록 ===</p>
	<%
		try{
			String sql = "SELECT name, email FROM dbcp_test";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while(rs.next()){
				out.println(i + " : " + rs.getString("name") + ", " + rs.getString("email") + "<br>");
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>