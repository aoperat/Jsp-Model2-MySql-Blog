package com.cos.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.UserDao;
import com.cos.model.User;
import com.cos.util.SHA256;
import com.cos.util.Script;

public class UserLoginAction implements Action {

	private static final String TAG = "UserLoginAction : ";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// [NEED] 유효성 검사
		String username = request.getParameter("username");
		String rawPassword = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");
		String password = SHA256.getEncrypt(rawPassword, "cos");
		
		UserDao dao = new UserDao();
		int result = dao.findByUsernameAndPassword(username, password);

		if (result == 1) {
			if(rememberMe != null) {
				System.out.println(TAG + "쿠키저장");
				Cookie c = new Cookie("username", username);
				c.setMaxAge(6000);
				response.addCookie(c);
			}else {
				System.out.println(TAG + "쿠키삭제");
				Cookie c = new Cookie("username", null);
				c.setMaxAge(0);
				response.addCookie(c);
			}
			//세션 등록
			HttpSession session = request.getSession();
			
			
			//User 객체 가져오기
			User user = dao.findByUsername(username);
			session.setAttribute("user", user); //어트리뷰트에 모델을 넣어서 사용 가능하다. (세션사용시)
			response.sendRedirect("/blog/index.jsp");
		} else {
			Script.back(response);
		}
	}

}
