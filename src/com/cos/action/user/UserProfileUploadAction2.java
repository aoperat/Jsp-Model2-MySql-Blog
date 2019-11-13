package com.cos.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.UserDao;
import com.cos.model.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserProfileUploadAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String userProfile = request.getParameter("userProfile");

		UserDao dao = new UserDao();
		int result = dao.setUserProfile(username, userProfile);

		if (result == 1) {

			HttpSession session = request.getSession();

			// User 객체 가져오기
			User user = dao.findByUsername(username);
			session.setAttribute("user", user); // 어트리뷰트에 모델을 넣어서 사용 가능하다. (세션사용시)
			response.sendRedirect("/blog/index.jsp");
		}

	}

}
