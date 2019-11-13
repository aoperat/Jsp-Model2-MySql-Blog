<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/include/metadata.jsp"%>
<body>
<%@ include file="/include/nav.jsp"%>

<!--================Contact Area =================-->
<section class="contact_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="row contact_form" action="/blog/user?cmd=join" method="POST" onsubmit="return validateCheck()">
					<div class="col-md-10">
						<div class="form-group">
							<input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요." required="required" maxlength="20">
						</div>
						<span id="username_input" style="font-size:10px; color:red"></span>
					</div>

					<div class="col-md-2">
						<div class="form-group float-right">
							<a style="cursor: pointer;" class="blog_btn" onClick="usernameCheck()">중복확인</a>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요." required="required" maxlength="20">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="동일한 비밀번호를 입력하세요." required="required" maxlength="20">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="email" class="form-control" name="email" placeholder="이메일을 입력하세요." required="required" maxlength="40">
						</div>
					</div>
					<!-- 도로명 주소 시작 -->

					<div class="col-md-10">
						<div class="form-group">
							<input type="text" class="form-control" id="roadFullAddr" name="address" placeholder="도로명 주소가 자동 입력됩니다." readonly>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group float-right">
							<a style="cursor: pointer;" class="blog_btn" onClick="goPopup()">주소찾기</a>
						</div>
					</div>
					<!-- 도로명 주소 끝 -->

					<div class="col-md-12 text-right">
						<button type="submit" value="submit" class="btn submit_btn">Join</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!--================Contact Area =================-->
<br />
<br />
<%@ include file="/include/footer.jsp" %>
</body>
</html>