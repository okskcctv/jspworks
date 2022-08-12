package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);	// doPost 호출
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼 데이터 넘겨 받기
		double n1 = Double.parseDouble(request.getParameter("num1"));
		double n2 = Double.parseDouble(request.getParameter("num2"));
		String op = request.getParameter("op");
		
		double result = 0;
		
		switch(op) {
		case "+":
			result = n1 + n2; break;
		case "-":
			result = n1 - n2; break;
		case "*":
			result = n1 * n2; break;
		case "/":
			if(n2 == 0) {
				System.out.println("0으로는 나눌 수 없습니다.");
				break;
			}
			result = n1 / n2; break;
		}
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		out.append("<html><body>")
		   .append("<h2>계산기 서블릿<h2><hr>");
		if(n2 != 0) {
			out.append("계산 결과 : " + result);
		}
		out.append("</body></html>");
	}

}
