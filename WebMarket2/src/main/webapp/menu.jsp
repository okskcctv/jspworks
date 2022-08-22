<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class = "navbar navbar-expand navbar-dark bg-dark">
	<div class = "container">
		<div class = "navbar-header">
			<a class = "navbar-brand" href="/index.jsp">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item">
							<a href="/member/loginMember.jsp" class="nav-link">로그인</a>
						</li>
						<li class="nav-item">
							<a href="/member/addMember.jsp" class="nav-link">회원 가입</a>
						</li>
					</c:when>
					<c:otherwise>
						<li style="padding-top:7px; color:#eee">[<c:out value="${sessionId}" /> 님]</li>
						<li class="nav-item">
							<a href="/member/logoutMember.jsp" class="nav-link">로그아웃</a>
						</li>
						<li class="nav-item">
							<a href="/member/updateMember.jsp" class="nav-link">회원 수정</a>
						</li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item">
					<a href="/products.jsp" class="nav-link">상품 목록</a>
				</li>
			</ul>
		</div>
	</div>
</nav>