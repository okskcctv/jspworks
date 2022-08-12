<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점수 관리</title>
	<script>
		function checkScore(){
			let form = document.scoreForm;
			let score = form.score.value;
			
			if(score == ""){
				alert("점수를 입력해 주세요.");
				return false;
			}
			else{
				form.submit();
			}
		}
	</script>
</head>
<body>
	<h2>점수를 입력해 주세요</h2>
	<form action="scoreTest.jsp" method="get" name="scoreForm">
		<p>점수 : <input type="text" name="score">
			<input type="button" onclick="checkScore()" value="학점출력"></p>
	</form>
</body>
</html>