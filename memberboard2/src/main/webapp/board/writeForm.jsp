<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="../resources/css/common.css">
<script src="../resources/js/script.js"></script>
</head>
<body>
	<iframe name="hid" style="display:none"></iframe>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>글쓰기</h1>
		</div>
		<div>
			<form action="/writeBoard.do" method="post" name="writeForm">
				<table class="tbl_write">
					<tr>
						<td><input type="text" name="title" class="w_title"
							placeholder="글 제목" required></td>
					</tr>
					<tr>
						<td><textarea rows="20" cols="60" name="content"
							placeholder="글 내용" required></textarea></td>
					</tr>
				</table>
				<div class="writeBtn">
					<input type="submit" value="글쓰기">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>