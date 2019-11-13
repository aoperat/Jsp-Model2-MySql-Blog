<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

	let replyJS = {
		id : null,
		boardId : 5,
		userId : 3,
		content : "글이 참 좋습니다.",
		createDate : null
	}

	
	
	function send(){
		//replyJS를 -> json으로 변환 JSON.stringify()
		var replyString = JSON.stringify(replyJS);
		
		fetch("http://localhost:8080/blog/test/reply", {
			method : "POST",
			body: replyString //json, String, object, number 보낼수 있음.
		}).then(function(data) {
			
			return data.text();
			
		}).then(function(data) {
			alert(data);
		});
	}
		//ajax -> /blog/test5-> POST -> application/json, utf-8 
	
	</script>

</head>
<body>
<button onClick="send()">전송</button>
</body>
</html>