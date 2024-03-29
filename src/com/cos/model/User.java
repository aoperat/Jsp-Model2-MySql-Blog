package com.cos.model;

import java.sql.Timestamp;

public class User {

	private int id;
	//private String userProfile; // 이미지 경로(파일 업로드)
	private String username;
	private String password;
	private String email;
	private Timestamp createDate;
	private String address;
	private int admit;
	private String userProfile;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int id, String username, String password, String email, Timestamp createDate, String address, int admit,
			String userProfile) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.createDate = createDate;
		this.address = address;
		this.admit = admit;
		this.userProfile = userProfile;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAdmit() {
		return admit;
	}

	public void setAdmit(int admit) {
		this.admit = admit;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	
}