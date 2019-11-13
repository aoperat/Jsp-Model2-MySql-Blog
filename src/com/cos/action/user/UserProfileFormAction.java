package com.cos.action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.UserDao;
import com.cos.model.User;

public class UserProfileFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

			String username = request.getParameter("username");
			
			UserDao dao = new UserDao();
			
			User user = new User();
			user = dao.findByUsername(username);
			
			request.setAttribute("user", user);
			RequestDispatcher dis = request.getRequestDispatcher("/user/uploadForm.jsp");
			dis.forward(request, response);
	
	}

}
