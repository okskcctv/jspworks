<%@ page import="com.bean.Calculator2" %>
<%@ page import="java.lang.Exception" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<link rel="stylesheet" href="../resources/css/calc.css">
</head>
<body>
	<div id="container">
		<h2>계산기</h2>
		<hr>
		<%
		Calculator2 calc = new Calculator2();
		try{
			String n1 = request.getParameter("num1");
			String n2 = request.getParameter("num2");
			if(n1.equals("") || n2.equals("")){
				out.println("값을 입력해 주세요.");
				out.println("<p><a href=calculator.jsp>돌아가기</a>");
			}
			else{
				double num1 = Double.parseDouble(n1);
				double num2 = Double.parseDouble(n2);
				String op = request.getParameter("op");
				
				calc.setNum1(num1);
				calc.setNum2(num2);
				calc.setOp(op);
				if(calc.getOp().equals("/") && calc.getNum2() == 0){
					out.println("0으로 나눌수 없습니다.");
					out.println("<p><a href=calculator.jsp>돌아가기</a>");
				}else{
					calc.calculate();
					out.println("<p>계산 결과 : " + calc.getResult());
				}
			}
		}catch(Exception e){
			out.println("숫자를 입력해 주세요");
			out.println("<p><a href=calculator.jsp>돌아가기</a>");
		}
		%>
		<hr>
	</div>
</body>
</html>