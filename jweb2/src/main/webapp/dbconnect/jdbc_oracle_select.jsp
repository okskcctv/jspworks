<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록 보기</title>
</head>
<body>
	<%
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "c##jweb";
		String password = "54321";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			
			String sql = "SELECT * FROM t_student ORDER BY stdId";
			out.println("<h2>학생 명단</h2>");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			out.println("<table border=1 width=200 style=border-collapse:collapse>");
			out.println("<tr><td>학번</td><td>이름</td></tr>");
			while(rs.next()){
				out.println("<tr><td>" + rs.getInt("stdId") + "</td>");
				out.println("<td>" + rs.getString("stdName") + "</td></tr>");
			}
			out.println("</table>");
		} catch (Exception e){
			e.printStackTrace();
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