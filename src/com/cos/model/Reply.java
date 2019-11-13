package com.cos.model;

import java.sql.Timestamp;

public class Reply {

	private ResponseData responseData = new ResponseData();
	
	private int id;
	private int userId;
	private int commentId;
	private String content;
	private Timestamp createDate;
	private User user = new User();

	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(ResponseData responseData, int id, int userId, int commentId, String content, Timestamp createDate,
			User user) {
		super();
		this.responseData = responseData;
		this.id = id;
		this.userId = userId;
		this.commentId = commentId;
		this.content = content;
		this.createDate = createDate;
		this.user = user;
	}

	public ResponseData getResponseData() {
		return responseData;
	}

	public void setResponseData(ResponseData responseData) {
		this.responseData = responseData;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	
}

	
