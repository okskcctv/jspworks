<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어 실습</title>
</head>
<body>
	<h3>비교 연산자</h3>
	\${10==10} : ${10==10}<br>
	\${10 eq 10} : ${10 eq 10}<br>
	
	\${"face"=="face"} : ${"face"=="face"}<br>
	\${"face" eq "face"} : ${"face" eq "face"}<br>
	
	\${10 < 20} : ${10 < 20}<br>
	\${10 lt 20} : ${10 lt 20}<br>
	
	\${10 > 20} : ${10 > 20}<br>
	\${10 gt 20} : ${10 gt 20}<br>
	
	<h3>논리 연산자</h3>
	\${(4==4) && (7==7)} : ${(4==4) && (7==7)}<br>
	\${(4==4) and (7!=7)} : ${(4==4) and (7!=7)}<br>
	
	\${(4!=4) || (7==7)} : ${(4!=4) || (7==7)}<br>
	\${(4==4) or (7!=7)} : ${(4==4) or (7!=7)}<br>
	
	\${!(4==4)} : ${!(4==4)}<br>
	\${not(4==4)} : ${not(4==4)}<br>
</body>
</html>