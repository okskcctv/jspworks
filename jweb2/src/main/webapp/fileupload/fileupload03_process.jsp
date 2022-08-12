<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	table{width: 300px;}
	table, th, td{
		border: 1px solid #ccc;
		border-collapse: collapse;
		padding: 10px;
	}
	img{width: 300px;}
</style>
<%
	String realFolder = "C:\\dev\\jspworks\\jweb2\\src\\main\\webapp\\upload";

	MultipartRequest multi = new MultipartRequest(request, realFolder,
			5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	// 파일 정보 가져오기(스택 자료구조)
	Enumeration<String> files = multi.getFileNames();
	ArrayList<String> fileNames = new ArrayList<>();
	ArrayList<String> names = new ArrayList<>();
	ArrayList<String> titles = new ArrayList<>();
	
	while(files.hasMoreElements()){
		String name = files.nextElement();
		fileNames.add(multi.getFilesystemName(name));
	}
	
	// 폼 데이터 가져오기
	for(int i=0; i<fileNames.size(); i++){
		names.add(multi.getParameter("name" + i));
		titles.add(multi.getParameter("title" + i));
	}
%>
<table>
	<tr>
		<th>이 름</th>
		<th>제 목</th>
		<th>파 일</th>
	</tr>
<%
	for(int i=0; i<fileNames.size(); i++){
		out.print("<tr><td>" + names.get(i) + "</td>");
		out.print("<td>" + titles.get(i) + "</td>");
		out.print("<td>" + fileNames.get(fileNames.size()-i-1) + "</td></tr>");
	}
%>
</table>
<%
	for(int i=fileNames.size() - 1; i>=0; i--){
%>
<img src="../upload/<%=fileNames.get(i) %>">
<% } %>