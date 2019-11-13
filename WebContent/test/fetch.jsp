<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Fetch API 이해하기</h1>

	<script>
		let num1 = 0;
		let num2 = 0;
		let sum = 0;

		fetch("http://localhost:8080/blog/test2", {
			method : "POST"
		}).then(function(data) {
			console.log("----------data in first Then");
			console.log(data);
			return data.text();
			//retrun data.json();
		}).then(function(data){
			console.log("---------data in second Then");
			console.log(data);
		});
	</script>
</body>
</html>
