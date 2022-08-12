<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	img{width: 500px;}
</style>
<%
	request.setCharacterEncoding("UTF-8");

	String realFolder = "C:\\dev\\jspworks\\jweb2\\src\\main\\webapp\\upload";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024,
			"UTF-8", new DefaultFileRenamePolicy());	// 5MB 한도
			
	// 요청 파라미터 name과 value 속성 가져오기
	Enumeration<String> params = multi.getParameterNames();	// 이름 객체 생성
	while(params.hasMoreElements()){			// 요청 파라미터 중 파일 이름이 있다면 반복
		String name = params.nextElement();		// 파일 이름 가져오기
		String value = multi.getParameter(name);	// 이름으로 값 가져오기
		out.println(name + "=" + value + "<br>");
	}
	out.println("=================================<br>");
	
	// 요청 파라미터 name(file name은 제외) 속성 가져오기
	Enumeration<String> files = multi.getFileNames();
	while(files.hasMoreElements()){
		String name = files.nextElement();
		String fileName = multi.getFilesystemName(name);	// 서버에 업로드된 파일 가져오기
		String original = multi.getOriginalFileName(name);	// 전송된 파일이 서버에 저장되기 전의 파일이름
		String type = multi.getContentType(name);			// 파일의 콘텐츠 유형 가져오기
		File file = multi.getFile(name);					// 전송된 파일 가져오기
		
		out.println("요청 파라미터 이름: " + name + "<br>");
		out.println("저장 파일 이름: " + fileName + "<br>");
		out.println("실제 파일 이름: " + original + "<br>");
		out.println("파일 컨텐츠 유형: "+ type + "<br>");
		
		if(file !=null){
			out.println("파일 크기: " + file.length() + "B");
		}
%>
<p>이미지 보기</p>
<p><img src="../upload/<%=fileName %>">
<% } %> <!-- while문 닫기 -->