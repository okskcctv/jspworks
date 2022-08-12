<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
<link rel="stylesheet" href="./resources/css/common.css">
<script src="./resources/js/script.js"></script>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>나의 정보</h1>
		</div>
		<div>
			<form action="/updateMember.do" method="post" name="updateForm">
				<table class="tbl">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="memberId" value="<c:out value='${member.memberId}'/>" readonly="readonly"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="passwd" value="<c:out value='${member.passwd}'/>"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="passwd_confirm" value="<c:out value='${member.passwd}'/>"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" value="<c:out value='${member.name}'/>"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="gender" value="남" <c:if test="${member.gender eq '남'}"> checked </c:if>>남
							<input type="radio" name="gender" value="여" <c:if test="${member.gender eq '여'}"> checked </c:if>>여
						</td>
					</tr>
					<tr>
						<td>가입일</td>
						<td><input type="text" name="joinDate" value="<c:out value='${member.joinDate}'/>" readonly="readonly"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="수정" onclick="checkMember()">
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>