package com.cos.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.model.Comment;
import com.google.gson.Gson;

@WebServlet("/test")
public class AjaxTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public AjaxTest() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		/* response.setCharacterEncoding("UTF-8"); */
		response.setContentType("text/json; charset=UTF-8"); //MINE 타입
		//setContentType에서 명시하는 text 뒤의 plain 또는 json은 명시를 하는것이지 보내는 타입이 아니다.
		
		//요청 데이터 처리
		//replyJsonString (1)
		BufferedReader in = request.getReader();
		
		String replyJsonString = in.readLine();
		System.out.println("요청 데이터 : " + replyJsonString);
		
		
		  Gson gson = new Gson();
		  
		  Comment reply = gson.fromJson(replyJsonString, Comment.class);
		  
		  System.out.println(reply.getId());
		  System.out.println(reply.getBoardId());
		  System.out.println(reply.getUserId());
		  System.out.println(reply.getContent());
		  System.out.println(reply.getCreateDate());
		  
		  
		String jsonData = "{\"name\" : \"손흥민\", \"sal\" : 100}";
		PrintWriter out = response.getWriter();
		out.println(jsonData);
		out.flush(); // 버퍼 비움
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
