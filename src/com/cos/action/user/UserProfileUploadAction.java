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

public class UserProfileUploadAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = request.getServletContext().getRealPath("media");
				
		MultipartRequest multi = new MultipartRequest(
				request,
				path,
				1024 * 1024 * 10, //사이즈값 : 2MB
				"UTF-8", //인코딩 방식
				new DefaultFileRenamePolicy() // 파일명 중복을 해결하기 위한 정책 함수
		);
		String username = multi.getParameter("username");
		String filename = multi.getFilesystemName("userProfile"); //정책에 의해서 변경된 이름
		String originFilename = multi.getOriginalFileName("userProfile");
		String contextPath = request.getServletContext().getContextPath();
		String downloadPath = request.getServletContext().getRealPath("media");
		String filepath = contextPath+"/media/"+filename;


		UserDao dao = new UserDao();
		int result = dao.setUserProfile(username, filepath);

		if (result == 1) {

			HttpSession session = request.getSession();

			// User 객체 가져오기
			User user = dao.findByUsername(username);
			session.setAttribute("user", user); // 어트리뷰트에 모델을 넣어서 사용 가능하다. (세션사용시)
			response.sendRedirect("/blog/index.jsp");
		}

	}

}
