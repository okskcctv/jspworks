package com.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userid = request.getParameter("id");
		String passwd = request.getParameter("pwd");
		String[] subject = request.getParameterValues("subject");
		
		System.out.println("아이디 : " + userid);
		System.out.println("비밀번호 : " + passwd);
		for(String subj : subject) {
			System.out.println("선택한 과목 : " + subj);
		}
		
		response.sendRedirect("survlet/register.jsp");
	}
}
