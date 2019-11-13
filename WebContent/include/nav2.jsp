<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!--================Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container box_1620">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="index.html"><img src="/blog/util/img/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav">
							<li class="nav-item active"><a class="nav-link" href="/blog/index.jsp">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="/blog/board/write.jsp">Posting</a></li>
							
							<c:choose>
								<c:when test="${empty sessionScope.user}">
								<li class="nav-item"><a class="nav-link" href="/blog/user/join.jsp">Join</a></li>
									<li class="nav-item"><a class="nav-link" href="/blog/user/login.jsp">Login</a></li>
								</c:when>
								<c:otherwise>
								<li class="nav-item"><a class="nav-link" href="/blog/user/update.jsp">Profile</a></li>
									<li class="nav-item"><a class="nav-link" href="/blog/user?cmd=logout">Logout</a></li>
								</c:otherwise>
							</c:choose>

						</ul>
						<ul class="nav navbar-nav navbar-right header_social ml-auto">
							<li class="nav-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li class="nav-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li class="nav-item"><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li class="nav-item"><a href="#"><i class="fa fa-behance"></i></a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>

	</header>
	<!--================Header Menu Area =================-->