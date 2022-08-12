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
<jsp:useBean id="calc" class="com.bean.Calculator" />
<jsp:setProperty property="num1" name="calc"/>
<jsp:setProperty property="num2" name="calc"/>
<jsp:setProperty property="op" name="calc"/>
	<div id="container">
		<h2>계산기</h2>
		<hr>
		<%
			if(calc.getOp().equals("/") && calc.getNum2() == 0){
				out.println("0으로 나눌 수 없습니다.");
			}
			else{
				calc.calculate();
			}
		%>
		
		<p>계산 결과 : <%= calc.getResult() %>
		<hr>
	</div>
</body>
</html>