package com.cos.test;


import org.junit.Test;

import com.cos.model.Comment;
import com.google.gson.Gson;

public class GsonTest {
	
	
	@Test
	private void gsonTest1() {
		
		Comment comment = new Comment();
		comment.setId(1);
		comment.setBoardId(1);
		comment.setUserId(2);
		comment.setContent("댓글입니다.");
		comment.setCreateDate(null);
		comment.getResponseData().setStatus("ok");
		comment.getUser().setUsername("ssar");
		
		Gson gson = new Gson();
		String commentJson = gson.toJson(comment);
		System.out.println(commentJson);
	}
}
