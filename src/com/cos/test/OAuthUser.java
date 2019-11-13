package com.cos.test;

import com.cos.model.User;

public class OAuthUser {

	private int id;
	private String access_token;
	private String refresh_token;
	private String token_type;
	private String expires_in;
	
	private User user = new User();
	
	public OAuthUser() {
		// TODO Auto-generated constructor stub
	}

	public OAuthUser(int id, String access_token, String refresh_token, String token_type, String expires_in,
			User user) {
		super();
		this.id = id;
		this.access_token = access_token;
		this.refresh_token = refresh_token;
		this.token_type = token_type;
		this.expires_in = expires_in;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public String getRefresh_token() {
		return refresh_token;
	}

	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}

	public String getToken_type() {
		return token_type;
	}

	public void setToken_type(String token_type) {
		this.token_type = token_type;
	}

	public String getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(String expires_in) {
		this.expires_in = expires_in;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
	
}
