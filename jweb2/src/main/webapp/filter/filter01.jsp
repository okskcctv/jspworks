<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>필터 예제</title>
<script>
	document.addEventListener("keydown", function(event){
		if(event.key == "Enter"){
			document.nameSub.submit();
		}
	});
</script>
</head>
<body>
	<form action="filter01_process.jsp" method="post" name="nameSub">
		<p>이 름 : <input type="text" name="name">
			<input type="submit" value="전송">
	</form>
</body>
</html>