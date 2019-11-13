<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<%@ include file="/include/nav.jsp"%>


<h1>${param.page}</h1>

<!-- 페이지 지시자 -->

<%-- <%
String username = (String)session.getAttribute("username");
%>
<h2><%=username %></h2> --%>


<!--================Blog Area =================-->
<section class="blog_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog_left_sidebar">

					<c:forEach var="board" items="${boards}">
						<!-- 블로그 글 시작 -->
						<article class="blog_style1">
							<div class="blog_img">
								<img class="img-fluid" src="${board.previewImg}" alt=""  style="width:100%; max-height:269.347px;">
							</div>
							<div class="blog_text">
								<div class="blog_text_inner">
									<div class="cat">
										<a class="cat_btn" href="#">${board.user.username}</a> <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> ${board.createDate}</a> <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>
											${board.readCount}</a>
									</div>
									<a href="#"><h4>${board.title }</h4></a>
									<div style="display: -webkit-box; -webkit-box-orient: vertical;text-align: left; overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; height: 2.4em; -webkit-line-clamp: 2; margin-bottom: 20px; word-break:break-all">${board.content }</div>
									<%-- <p>${board.content}</p> --%>
									<a class="blog_btn" href="/blog/board?cmd=detail&id=${board.id }">Read More</a>
									
								</div>
							</div>
						</article>
						<!-- 블로그 글 끝 -->
					</c:forEach>


					<!-- 이까지삭제 -->
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
						
						
						<c:if test="${param.page > 1 }"><li class="page-item"><a href="/blog/board?cmd=list&page=${param.page-1 }" class="page-link" aria-label="Previous"> <span aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
								</span>
							</a></li></c:if>
							
							
							<!-- 페이징 -->
							
							<!--  페이지 네이션 -->
							<c:if test="${param.page == 1 }">
							 <li class="page-item"><a href="/blog/board?cmd=list&page=${param.page-1 }" class="page-link">${param.page }</a></li>
							<li class="page-item "><a href="#" class="page-link">${param.page + 1}</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page +2}</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page +3}</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page +4}</a></li>
							</c:if>
							
							<c:if test="${param.page == 2 }">
							 <li class="page-item"><a href="#" class="page-link">${param.page - 1 }</a></li>
							<li class="page-item "><a href="#" class="page-link">${param.page}</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page +1}</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page +2}</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page +3}</a></li>
							</c:if>
							
							<c:if test="${param.page > 2 }">
							 <li class="page-item"><a href="#" class="page-link">${param.page - 2 }</a></li>
							<li class="page-item "><a href="#" class="page-link">${param.page -1}</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page }</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page +1}</a></li>
							<li class="page-item"><a href="#" class="page-link">${param.page +2}</a></li>
							</c:if>
							
						
							
							
							<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+1 }" class="page-link" aria-label="Next"> <span aria-hidden="true"> <span class="lnr lnr-chevron-right"></span>
								</span>
							</a></li>
							
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search Posts"> <span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="lnr lnr-magnifier"></i>
								</button>
							</span>
						</div>
						<!-- /input-group -->
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget popular_post_widget">
						<h3 class="widget_title">Popular Posts</h3>
						
						<c:forEach var = "board" items ="${hotBoards }" >
						<div class="media post_item">
							<img src="${board.previewImg }"width='100px' height='80px' alt="post">
							<div class="media-body">
								<a href="/blog/board?cmd=detail&id=${board.id }" ><h3>${board.title}</h3></a>
								<p>${board.createDate }</p>
							</div>
						</div>
						</c:forEach>
						<div class="br"></div>
					</aside>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================Blog Area =================-->
<!--================ start footer Area  =================-->
<%@ include file="/include/footer.jsp"%>

