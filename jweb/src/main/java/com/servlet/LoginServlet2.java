package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login2")
public class LoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		// 웹 브라우저로 응답을 html형식으로 설정
		
		PrintWriter out = response.getWriter();
		// 브라우저에 출력할 out 객체 생성
		
		String id = request.getParameter("userid");
		String pwd = request.getParameter("passwd");
		String phone = request.getParameter("phone");
		
		String data = "<html><body>";
			   data += "<p>아이디 : " + id;
			   data += "<p>비밀번호 : " + pwd;
			   data += "<p>전화번호 : " + phone;
			   data += "</body></html>";
			   
		out.println(data);
	}

}
