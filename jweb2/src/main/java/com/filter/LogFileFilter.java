package com.filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class LogFileFilter implements Filter{
	
	PrintWriter writer;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String filename = filterConfig.getInitParameter("filename");
		if(filename == null)
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		String clientAddr = request.getRemoteAddr();	// IP 주소
		writer.printf("클라이언트 IP 주소: %s %n", clientAddr);
		
		String contentType = response.getContentType();	// 컨텐츠 유형
		writer.printf("문서의 컨텐츠 유형: %s \n", contentType);
		
		writer.printf("현재 일시: %s %n", getCurrentTime());	// 현재 날짜와 시간(메소드 호출)
		
		chain.doFilter(request, response);	// 필터 실행
	}
	
	private Object getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyy:MM:dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());	// 현재 시간 설정
		return formatter.format(calendar.getTime());
	}

	@Override
	public void destroy() {
		writer.close();
	}
}
