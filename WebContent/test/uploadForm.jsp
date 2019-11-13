<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadForm</title>

</head>
<body>

	<div id="img__wrap" src=""></div>

		
		
	<form action="/blog/user?cmd=profileUploadAction" method="POST" enctype="multipart/form-data">
		username : <input type="text" name="username" value="${user.username}" /> <br /> 
		image : <input type="file" id="img__input" name="userProfile" /> <br /> 
		<input type="submit" value="확인" />
	</form>

	<script src="/blog/util/js/jquery-3.2.1.min.js"></script>
	<script>
		$("#img__input").on("change", handleImgFile);

		function handleImgFile(e) {
			console.log(e);
			console.log(e.target);
			console.log(e.target.files);
			console.log(e.target.files[0]);

			var f = e.target.files[0];

			if (!f.type.match("image.*")) {
				console.log("이미지 타입입니다.");
				return;
			}

			var reader = new FileReader();

			reader.onload = function(e) {
				console.log(e.target);
				console.log(e.target.result);
				$("#img__wrap").attr("src", e.target.result);
			}

			reader.readAsDataURL(f);
		}
	</script>
</body>
</html>