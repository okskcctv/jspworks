<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>db 연동</title>
</head>
<body>
	<%
		String driverClass = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?Useunicode=true&serverTimezone=Asia/Seoul";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			out.println("Mysql DB 연결 성공!!");
		} catch (Exception e){
			out.println("DB 연결에 실패했습니다.<br>");
			out.println(e.getMessage());
		} finally{
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>