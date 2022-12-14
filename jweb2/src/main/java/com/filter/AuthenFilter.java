package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화...");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 한글 인코딩 - 필터 처리
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");	// 반환 데이터 유형
		
		PrintWriter writer = response.getWriter();
		
		String name = request.getParameter("name");
		String message = "";
		
		// 입력값이 없을 경우 필터 처리
		if(name == null || name.equals("")) {
			message = "입력된 name 값은 null입니다.";
			writer.print(message);
			return;	// if문 안에서 사용하여 프로그램 정상 종료
		}
		
		chain.doFilter(request, response);	// 필터 실행
	}

	@Override
	public void destroy() {
		System.out.println("Filter01 해제");
	}
}
