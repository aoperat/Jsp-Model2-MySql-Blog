package com.cos.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.action.reply.ReplyFactory;

@WebServlet("/api/reply")
public class ReplyRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyRestController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 들어오는 모든 문자를 UTF-8 로 인코딩
		request.setCharacterEncoding("UTF-8");
		//2. cmd(command) 처리
		String cmd = request.getParameter("cmd");
		//3. cmd 검증
		
		response.setCharacterEncoding("UTF-8");
		if(cmd == null || cmd.equals("")) {
			return;
		}
			Action action = ReplyFactory.getAction(cmd);
			
		//5. 익스큐트 실행
		if(action != null) {
			action.execute(request, response);
		}
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
