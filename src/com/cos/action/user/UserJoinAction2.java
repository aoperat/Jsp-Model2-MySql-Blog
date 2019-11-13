package com.cos.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.UserDao;
import com.cos.model.User;
import com.cos.util.SHA256;
import com.cos.util.Script;

public class UserJoinAction2 implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//목적 : form 태그에 있는 값을 받아서 DB에 Insert 후 List 페이지로 이동
		
		//[NEED] null 값 처리하기, 유효성 검사
		String username = request.getParameter("username");
		String rawPassword = request.getParameter("password");
		String email = request.getParameter("email");
		String password = SHA256.getEncrypt(rawPassword, "cos");
		String address = request.getParameter("address");
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password); //Encryption (암호화) 필요.
		user.setEmail(email);
		user.setAddress(address);
		
		
		//DAO 연결
		UserDao dao = new UserDao();
		int result = dao.save(user);
		
		request.setAttribute("user", user);
		
		if(result ==1) {
			response.sendRedirect("/blog/user/login.jsp");
		}else {
			Script.back(response);

		}
		
	}
	
}
