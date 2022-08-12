<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록 보기</title>
<style>
	h2{text-align: center;}
	table{text-align: center; margin: 0 auto;}
</style>
</head>
<body>
	<%
		String driverClass = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?Useunicode=true&serverTimezone=Asia/Seoul";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			String sql = "SELECT * FROM user ORDER BY uid";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			out.println("<h2>회원 목록 보기</h2>");
			out.println("<table border=1 width=300 style=border-collapse:collapse>");
			out.println("<tr><td>uid</td><td>비밀번호</td><td>이름</td></tr>");
			while(rs.next()){
				out.println("<tr><td>" + rs.getInt("uid") + "</td>");
				out.println("<td>" + rs.getString("pwd") + "</td>");
				out.println("<td>" + rs.getString("name") + "</td></tr>");
			}
			out.println("</table>");
		} catch (Exception e){
			out.println(e.getMessage());
		} finally{
			if(rs != null){
				rs.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>