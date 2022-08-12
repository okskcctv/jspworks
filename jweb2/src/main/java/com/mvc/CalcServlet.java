package com.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = 0;
		if(req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
		}
		
		String result = "";
		if(num % 2 == 0) {
			result = "짝수";
		}else {
			result = "홀수";
		}
		
		// model - data 저장
		req.setAttribute("result", result);
		
		// 포워딩 - jsp페이지로 보내줌
		RequestDispatcher dispatcher = req.getRequestDispatcher("/mvc/calc.jsp");
		dispatcher.forward(req, resp);
	}
}
