package com.dbcp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/dbcp")
public class DBCPTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection conn = null;	// Connection 객체 선언
	DataSource ds = null;	// DataSource 객체 선언
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");	// 객체 참조(url)
			ds = (DataSource)envContext.lookup("jdbc/oracle");	// java:/comp/env/jdbc/oracle
			
			conn = ds.getConnection();
			System.out.println("DB 연결 성공");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h3>DB 커넥션 풀 연결 성공!!</h3>");
			out.println("</body></html>");
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
