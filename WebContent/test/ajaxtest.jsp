<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Ajax 테스트</h1>
	<hr />


	<div id="demo">1</div>
	<button type="button" onclick="loadDoc()">Change Count</button>


	<script>
		var reply = {
			id : null,
			boardId : 1,
			userId : 3,
			content : 'input 태그에 적힌 값을 들고 온다',
			createDate : null
		}

		
		console.log(reply)
		var replyString = JSON.stringify(reply);
		console.log(replyString);

		
		
		function loadDoc() {
			var xhttp = new XMLHttpRequest();
			//콜백함수 xhttp.send() 된 뒤 요청받은 서버에서 응답이 정상으로 처리되면 콜백됨
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {

					var jsonData = JSON.parse(this.responseText); //JavaScript Object 로 변경
					console.log(jsonData)
					document.querySelector("#demo").innerHTML = jsonData.name //inner HTML outer HTML 차이는?
							+ " " + jsonData.sal;
				}
			};
			
			
			xhttp.open("POST", "http://localhost:8080/blog/test", true);
			xhttp.setRequestHeader("Content-type", "application/json")
			xhttp.send(replyString);
		}
	</script>

</body>
</html>