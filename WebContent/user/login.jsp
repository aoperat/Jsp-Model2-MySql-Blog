<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/metadata.jsp"%>
</head>
<body>
<%@ include file="/include/nav.jsp"%>

<section class="contact_area">
	<div class="container">

		<div class="row">

			<div class="col-lg-12">
				<form class="row contact_form" action="/blog/user?cmd=login"
					method="post" id="contactForm">
					<div class="col-md-12">
						<div class="form-group">

							<c:choose>
								<c:when test="${empty cookie.username.value }">
								<input type="text" class="form-control" id="username"
								name="username" placeholder="아이디를 입력하세요.">
								</c:when>
								<c:otherwise>
								<input type="text" class="form-control" id="username"
								name="username" placeholder="아이디를 입력하세요." value = "${cookie.username.value }">
								</c:otherwise>
							</c:choose>

							
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="비밀번호를 입력하세요.">
						</div>
					</div>

					<div class="col-md-12 text-right">
						<label><input type="checkbox" name="rememberMe"
							id="rememberMe" /> Remember me</label>
					</div>

					<div class="col-md-12 text-right">
						<button type="submit" value="submit" class="btn submit_btn">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<br />
<br />
<%@ include file="/include/footer.jsp"%>

</body>
</html>