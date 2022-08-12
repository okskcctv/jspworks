<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.ProductRepository"%>
<%@page import="vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String realFolder="C:/dev/jspworks/WebMarket1/src/main/webapp/upload/";
	int maxSize = 5*1024*1024;	// 최대 업로드 파일 크기: 5MB
	String encType = "utf-8";	// 인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,
	maxSize, encType, new DefaultFileRenamePolicy());

	// 폼 입력값 받아 오기
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);	// 정수형으로 변환
		
		
	long stock;
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);	// long형으로 변환
		
	// 이미지 파일 가져오기
	Enumeration<?> files = multi.getFileNames();	// 파일 가져오기 반복
	String fname = (String)files.nextElement();		// 파일 이름
	String productImage = multi.getFilesystemName(fname);	// 이미지 파일
		
	ProductRepository dao = ProductRepository.getInstance();
		
	Product newProduct = new Product();	// 상품 객체 생성
	
	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setProductImage(productImage);
	
	dao.addProduct(newProduct);	// 상품 추가
	
	response.sendRedirect("products.jsp"); // 상품 목록 페이지로 이동
%>