<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/metadata.jsp"%>
</head>
<body>
	<%@ include file="/include/nav.jsp"%>
	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">

						<c:forEach var="board" items="${boards}">
							<!-- 블로그 글 시작 -->
							<article class="blog_style1">
								<div class="blog_img">
									<img class="img-fluid" src="${board.previewImg}" alt="" style="width: 100%; max-height: 269.347px;">
								</div>
								<div class="blog_text">
									<div class="blog_text_inner">
										<div class="cat">
											<a class="cat_btn" href="#">${board.user.username}</a> <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> ${board.createDate}</a> <a href="#"><i class="fa fa-comments-o"
												aria-hidden="true"></i> ${board.readCount}</a>
										</div>
										<a href="#" style= "word-break:break-all;"><h4>${board.title}</h4></a>
										<div
											style="display: -webkit-box; -webkit-box-orient: vertical; text-align: left; overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; height: 2.4em; -webkit-line-clamp: 2; margin-bottom: 20px; word-break: break-all">${board.content }</div>
										<%-- <p>${board.content}</p> --%>

										<c:choose>
											<c:when test="${sessionScope.user.admit ==1 }">
												<a class="blog_btn" href="/blog/board?cmd=detail&id=${board.id }">Read More</a>
											</c:when>
											<c:otherwise>
												<button type="button" class="blog_btn" onClick="alert('인증되지 않은 사용자는 확인할 수 없습니다.')">Read More</button>
											</c:otherwise>
										</c:choose>


									</div>
								</div>
							</article>
							<!-- 블로그 글 끝 -->
						</c:forEach>


						<!-- 이까지삭제 -->
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">


								<c:if test="${param.page > 1 }">
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page-1 }&search=${search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> <span
												class="lnr lnr-chevron-left"></span>
										</span>
									</a></li>
								</c:if>


								<!-- 페이징 -->

								<!--  페이지 네이션 -->
								<%-- <c:if test="${!empty count}">
									<c:if test="${param.page == 1 }">

										<c:forEach var="i" begin="0" end="4" step="1">
											<c:if test="${count/3 > param.page}">
												<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+i}" class="page-link">${param.page+i}</a></li>
											</c:if>
										</c:forEach>
									</c:if>
								</c:if>
								
								<c:if test="${!empty count}">
									<c:if test="${param.page == 2 }">

										<c:forEach var="i" begin="0" end="4" step="1">
											<c:if test="${count/3 > param.page}">
												<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+i-1}" class="page-link">${param.page+i-1}</a></li>
											</c:if>
										</c:forEach>
									</c:if>
								</c:if>
								
								<c:if test="${!empty count}">
									<c:if test="${param.page >2 &&  param.page <count}">

										<c:forEach var="i" begin="0" end="4" step="1">
											<c:if test="${count - (param.page-2)*3 > -2}">
												<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+i-2}" class="page-link">${param.page+i-2}</a></li>
											</c:if>
										</c:forEach>
									</c:if>
								</c:if> --%>

								<%-- <c:if test="${param.page == 1 }">
									<c:if test="${count/3 >0 }">
										<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page }" class="page-link">${param.page }</a></li>
									</c:if>
									<c:if test="${count/3 >1 }">
										<li class="page-item "><a href="/blog/board?cmd=list&page=${param.page+1}" class="page-link">${param.page + 1}</a></li>
									</c:if>
									<c:if test="${count/3 >2 }">
										<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+2}" class="page-link">${param.page +2}</a></li>
									</c:if>
									<c:if test="${count/3 >3 }">
										<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+3}" class="page-link">${param.page +3}</a></li>
									</c:if>
									<c:if test="${count/3 >4 }">
										<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+4}" class="page-link">${param.page +4}</a></li>
									</c:if>
								</c:if> --%>

								<%-- <c:if test="${param.page == 2 }">
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page-1}" class="page-link">${param.page - 1 }</a></li>
									<li class="page-item "><a href="/blog/board?cmd=list&page=${param.page}" class="page-link">${param.page}</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+1}" class="page-link">${param.page +1}</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+2}" class="page-link">${param.page +2}</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+3}" class="page-link">${param.page +3}</a></li>
								</c:if>

								<c:if test="${param.page > 2 }">
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page-2}" class="page-link">${param.page - 2 }</a></li>
									<li class="page-item "><a href="/blog/board?cmd=list&page=${param.page-1}" class="page-link">${param.page -1}</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page}" class="page-link">${param.page }</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+1}" class="page-link">${param.page +1}</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+2}" class="page-link">${param.page +2}</a></li>
								</c:if> --%>



								<%
									if (request.getAttribute("count") != null) {
										int count = (int) request.getAttribute("count");
										System.out.println("어트리뷰트로 받아온 카운트 값 >>" + count);

										for (int i = 0; i <= count / 3; i++) {
								%>
								<li class="page-item"><a href="/blog/board?cmd=list&page=<%=i+1 %>" class="page-link"><%=i+1 %></a></li>
								<%
									}
									}
								%> 



								<c:if test="${param.page*3 <= count}">
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+1 }" class="page-link" aria-label="Next"> <span aria-hidden="true"> <span class="lnr lnr-chevron-right"></span>
										</span>
									</a></li>
								</c:if>
								
								
								
								
							</ul>
						</nav>
					</div>
				</div>
				
				<!-- 검색하기 -->
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
							<form action="/blog/board?cmd=list&page=1" method="POST">
								<input type="text" name="search" class="form-control" placeholder="Search Posts"> <span class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="lnr lnr-magnifier"></i>
									</button>
								</span>
								</form>
								
							</div>
							<!-- /input-group -->
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Popular Posts</h3>

							<c:forEach var="board" items="${hotBoards }">
								<div class="media post_item">
									<img src="${board.previewImg }" width='100px' height='80px' alt="post">
									<div class="media-body">
										<a href="/blog/board?cmd=detail&id=${board.id }"><h3>${board.title}</h3></a>
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
	<%@ include file="/include/footer.jsp"%>
</body>
</html>