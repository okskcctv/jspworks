package com.session;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sess1")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// getSession() 을 호출하여 세션이 없으면 새로 생성하고, 세션이 있으면 기존 세션을 가져온다.
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(10);
		out.println("세션 아이디:" + session.getId() + "<br>");
		out.println("최초 세션 생성 시각:" + new Date(session.getCreationTime()) + "<br>");
		out.println("최초 세션 접근 시각:" + new Date(session.getLastAccessedTime()) + "<br>");
		out.println("세션 유효 시간:" + session.getMaxInactiveInterval() + "<br>");
		if(session.isNew()) {	// 최초 생성된 세션인지 판별함.
			out.print("새 세션이 만들어졌습니다.");
		}
		session.invalidate();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
