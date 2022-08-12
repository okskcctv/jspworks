<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 프로그램</title>
<style>
	#container{width: 800px; margin: 0 auto; text-align: center;}
	
	table{width: 400px; margin: 0 auto;}
	table, th, td{border: 1px solid #ccc; border-collapse: collapse;}
	table th, td{height: 40px;}
	table input{height: 25px;}
</style>
</head>
<body>
	<div id="container">
		<h2>회원 가입</h2>
		<hr>
		<form action="member_process_el.jsp" method="post">
			<table id="tbl">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td>이 름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="확인">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>