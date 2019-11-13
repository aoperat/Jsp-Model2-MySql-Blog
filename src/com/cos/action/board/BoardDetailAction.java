package com.cos.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDao;
import com.cos.dao.CommentDao;
import com.cos.model.Board;
import com.cos.model.Comment;
import com.cos.util.Script;
import com.cos.util.Utils;

public class BoardDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		if (request.getParameter("id") == null || request.getParameter("id").equals("")) {
		}

		int id = Integer.parseInt(request.getParameter("id"));

		BoardDao dao = new BoardDao();
		Board board = dao.findById(id);
		
		CommentDao cDao = new CommentDao();
		
		List<Comment> comments = cDao.findByBoardId(id);
		
		
		int forReadCount = 0;
		int result = 0;
		if (board != null) {
			
			Cookie[] cookies = request.getCookies();
			
			if(cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					Cookie c = cookies[i];
					
					if(c.getName().equals("cookie"+id)) {
						forReadCount = 1;
					}
				}
			}
			
			if(forReadCount == 0) {
			result = dao.increaseReadCount(id);
			}
			
			Cookie newCookie = new Cookie("cookie"+id,"cookie"+id);
			newCookie.setMaxAge(300);
			response.addCookie(newCookie);
			
			

				// 유튜브 주소 파싱
				Utils.setPreviewYoutube(board);

				// board를 request에 담고 dispatcher 로 이동
				request.setAttribute("board", board);
				request.setAttribute("comments", comments);
				RequestDispatcher dis = request.getRequestDispatcher("board/detail.jsp");
				dis.forward(request, response);

		} else {
			Script.back(response);
		}

	}

}
