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
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="main_blog_details">
						<a href="#"><h4 style="word-break: break-all;">${board.title}</h4></a>
						<div class="user_details">
							<div class="float-left">
								<c:if test="${board.userId eq sessionScope.user.id}">
									<a href="/blog/board?cmd=updateForm&id=${board.id}">update</a>
									<a href="/blog/board?cmd=delete&id=${board.id}">delete</a>
								</c:if>
							</div>
							<div class="float-right">
								<div class="media">
									<div class="media-body">
										<h5>${board.user.username}</h5>
										<p>${board.createDate}</p>
									</div>
									<div class="d-flex">
										<img width="50px" height="50px" style="border-radius: 50%" src="${board.user.userProfile }" alt="">
									</div>
								</div>
							</div>
						</div>
						<!-- 본문 시작 -->
						<div style="word-break: break-all;">${board.content}</div>
						<!-- 본문 끝 -->
						<hr />
					</div>

					<!-- 댓글 시작 -->
					<div class="comments-area" id="comments-area">
						<!-- prepend -->
						<c:forEach var="comment" items="${comments}">
							<!-- 댓글 아이템 시작 -->
							<br />
							<div class="comment-list" id="comment-id-${comment.id}">
								<!-- ID 동적으로 만들기 -->
								<div class="reply-btn">
									<c:if test="${comment.userId eq sessionScope.user.id}">
										<button onClick="commentDelete(${comment.id})" class="btn-reply text-uppercase" style="display: inline-block; float: right; margin-right: 10px;">삭제</button>
									</c:if>
									<button id="showreply${comment.id}" onClick="replyListShow(${comment.id},'${sessionScope.user.username }')" class="btn-reply text-uppercase" value="a"
										style="display: inline-block; float: right; margin-right: 10px;">보기</button>
									<button id="replyForm${comment.id}" onClick="replyWriteShow(${comment.id})" class="btn-reply text-uppercase" value="a" style="display: inline-block; float: right; margin-right: 10px;">쓰기</button>
								</div>
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img width="50px" height="50px" style="border-radius: 50%" src="${comment.user.userProfile}" alt="">
										</div>
										<div class="desc">
											<h5>
												<a href="#">${comment.user.username}</a>
											</h5>
											<p class="date">${comment.createDate}</p>
											<p class="comment" style='word-break: break-all;'>${comment.content}</p>
										</div>
									</div>
								</div>
							</div>

							<!-- 대댓글 시작 ================================ -->
							<div class="forreply" id="forreply-${comment.id}"></div>
							<!-- =================================대댓글 끝 -->
						</c:forEach>
						<!-- 댓글 아이템 끝 -->
					</div>
					<!-- after -->
					<!-- 댓글 끝 -->

					<!-- 댓글 쓰기 시작 -->
					<div class="comment-form" style="margin-top: 0px;">
						<h4 style="margin-bottom: 20px">Leave a Comment</h4>
						<form id="comment-submit">
							<input type="hidden" name="userId" value="${sessionScope.user.id}" /> <input type="hidden" name="boardId" value="${board.id}" />
							<div class="form-group">
								<textarea id="content" style="height: 60px" class="form-control mb-10" rows="2" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
									required=""></textarea>
							</div>
							<button type="button" onClick="commentWrite()" class="primary-btn submit_btn">Post Comment</button>
						</form>
					</div>
					<!-- 댓글 쓰기 끝 -->
				</div>

				<div class="col-lg-2"></div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp"%>

	<script>

	
	function commentItemForm(id, username, content, createDate, profile){
	    var commentItem = "<div class='comment-list' id='comment-id-"+id+"'> ";
	    commentItem += "<div class='single-comment justify-content-between d-flex'> ";
	    commentItem += "<div class='user justify-content-between d-flex'> ";
	    commentItem += "<div class='thumb'> <img width='50px' height='50px' style='border-radius: 50%' src='"+profile+"' alt=''> </div> ";
	    commentItem += "<div class='desc'><h5><a href='#'>"+username+"</a></h5> ";
	    commentItem += "<p class='date'>"+createDate+"</p><p class='comment' style='word-break: break-all;'>"+content+"</p></div></div> ";
	    commentItem += "<div class='reply-btn'>";
	    commentItem += "<button onClick='replyForm("+id+")' class='btn-reply text-uppercase' style='display:inline-block; float:left; margin-right:10px;'>쓰기</button>";
	    commentItem += "<button onClick='replyListShow("+id+")' class='btn-reply text-uppercase'  style='display:inline-block; float:left; margin-right:10px;'>보기</button>";
	    commentItem += "<button onClick='commentDelete("+id+")' class='btn-reply text-uppercase' style='display:inline-block; float:left; margin-right:10px;'>삭제</button>";
	    commentItem +="</div></div></div>"
	    console.log(commentItem);
	    return commentItem;
	}
	

	function replyItemFormMine(id, username, content, createDate, profile){
		
		/* <div class ='reply_status'> */
		
		var replyItem = "<div class='comment-list left-padding' id='reply-id-"+id+"'>";
		replyItem+= "<div class='single-comment justify-content-between d-flex'>";
		replyItem+= "<div class='user justify-content-between d-flex'>";
		replyItem+= "<div class='thumb'><img width='50px' height='50px' style='border-radius: 50%' src='"+profile+"' alt=''></div>";
		replyItem+= "<div class='desc'><h5><a href='#'>"+username+"</a></h5>";
		replyItem+= "<p class='date'>"+createDate+"</p>";
		replyItem+= "<p class='comment'>"+content+"</p>";
		replyItem+= "</div></div><div class='reply-btn'><button onClick='replyDelete("+id+")' class='btn-reply text-uppercase'>삭제</button>";
		replyItem+= "</div></div></div>";
		
		return replyItem;
	}
	
function replyItemForm(id, username, content, createDate, profile){
		
		/* <div class ='reply_status'> */
		
		var replyItem = "<div class='comment-list left-padding' id='reply-id-"+id+"'>";
		replyItem+= "<div class='single-comment justify-content-between d-flex'>";
		replyItem+= "<div class='user justify-content-between d-flex'>";
		replyItem+= "<div class='thumb'><img width='50px' height='50px' style='border-radius: 50%' src='"+profile+"' alt=''></div>";
		replyItem+= "<div class='desc'><h5><a href='#'>"+username+"</a></h5>";
		replyItem+= "<p class='date'>"+createDate+"</p>";
		replyItem+= "<p class='comment'>"+content+"</p>";
		
		return replyItem;
	}
	
	
	//reply 보기 - ajax
	function replyListShow(comment_id,username) {
		//comment_id 로 reply 전부다 select 해서 가져오기
				
		if($("#showreply"+comment_id).val() == 'a'){
		$.ajax({
			method: "POST",
			url: "/blog/api/reply?cmd=list",
			data: comment_id +"",
			contentType: "text/plain; charset=utf-8",
			dataType: "json",
			success: function(replys){ //javascript object
							
			for(reply of replys){ 
					//잘 받았으면 화면에 표시하면 됨.
					
					if(username == reply.user.username){
					var reply_et = replyItemFormMine(reply.id, reply.user.username, reply.content, reply.createDate, reply.user.userProfile);
					$("#forreply-"+comment_id).append(reply_et);
					}else{
						var reply_et = replyItemForm(reply.id, reply.user.username, reply.content, reply.createDate, reply.user.userProfile);
						$("#forreply-"+comment_id).append(reply_et);
					}
					
					
					
					}
			$("#showreply"+comment_id).val('b');
			
			},
			error: function(xhr){
				console.log(xhr);
			}
			
		});
		}else{
			$("#showreply"+comment_id).val('a');
			
			$("#forreply-"+comment_id).empty();
		}
	}
	
	
	//reply 쓰기
	function replyWrite(comment_id){
		
		var reply_submit_string = $("#reply-submit-"+comment_id).serialize();
		replyListShow()
		$.ajax({
			method: "POST",
			url: "/blog/api/reply?cmd=write",
			data: reply_submit_string,
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			
			success: function(reply){
				//화면에 적용
				
				var reply_et = replyItemForm(reply.id, reply.user.username, reply.content, reply.createDate, reply.user.userProfile);
					$("#comment-id-"+reply.commentId).after(reply_et);
					$("#reply-form-"+comment_id).remove();				
			},
			error: function(xhr){
				console.log(xhr.status);
				console.log(xhr);
			}
			
		});
		
	}
	
	//reply 삭제
	function replyDelete(reply_id){
		$.ajax({
			method: "POST",
			url: "/blog/api/reply?cmd=delete",
			data: reply_id+"",
			contentType: "text/plain; charset=utf-8",
			success: function(result){
				if(result === "ok"){
					//해당 엘레멘트 삭제
					$("#reply-id-"+reply_id).remove();
				}
			},
			error: function(xhr){
				console.log(xhr);
			}
		});
	}
	
	
	
	//comment 쓰기
	function commentWrite(){
		var comment_submit_string = $("#comment-submit").serialize();
		$.ajax({
			method: "POST",
			url: "/blog/api/comment?cmd=write",
			data: comment_submit_string,
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			
			success: function(comment){
				//화면에 적용
				var comment_et = commentItemForm(comment.id, comment.user.username, comment.content, comment.createDate, comment.user.userProfile);
				$("#comments-area").prepend(comment_et);
				//입력폼 초기화하기
				$("#content").val("");
				
			},
			error: function(xhr){
				console.log(xhr.status);
				console.log(xhr);
			}
			
		});
		
	}
	
	
	//comment 삭제
	function commentDelete(comment_id){ //자바스크립트는 하이픈 사용 불가
		$.ajax({
			method: "POST",
			url: "/blog/api/comment?cmd=delete",
			data: comment_id+"",
			contentType: "text/plain; charset=utf-8", //MIME 타입
			success: function(result){
				console.log(result);
				//해당 엘레멘트(DOM)을 찾아서 remove() 해주면 됨.
				if(result === "ok"){
					$("#comment-id-"+comment_id).remove();
				}
				
				$("#reply-id-"+reply_id).remove();
				
			},
			error: function(xhr){
				console.log(xhr.status);
			}
		});
	}

	//reply Form 만들기  - 화면에 로딩!!

	//reply Form 만들기  - 화면에 로딩!!
	function replyWriteShow(comment_id) {
		
		if($("#replyForm"+comment_id).val() == 'a'){
		
		var comment_form_inner = "<h4 style='margin-bottom:20px'>Leave a Reply</h4><form id='reply-submit-"+comment_id+"'><input type='hidden' name='commentId' value='"+comment_id+"' /><input type='hidden' name='userId' value='${sessionScope.user.id}' /><div class='form-group'><textarea style='height:60px' class='form-control mb-10' rows='2' name='content' placeholder='Messege' required=''></textarea></div><button type='button' onClick='replyWrite("+comment_id+")' class='primary-btn submit_btn'>Post Comment</button></form>";

		var reply_form = document.createElement("div"); //div 빈 박스 생성
		reply_form.id = "reply-form-"+comment_id;
		reply_form.className = "comment-form"; //div에 클래스 이름을 주고
		reply_form.style = "margin-top:0px"; //div에 style을 준다.

		reply_form.innerHTML = comment_form_inner;
		console.log(reply_form);

		$("#comment-id-"+comment_id).append(reply_form); //after와 append, before와 prepend 
		$("#replyForm"+comment_id).val('b');
	}else{
		
		$("#replyForm"+comment_id).val('a');
		$("#reply-form-"+comment_id).remove();
	}
		
	}
	
	
</script>
</body>
</html>