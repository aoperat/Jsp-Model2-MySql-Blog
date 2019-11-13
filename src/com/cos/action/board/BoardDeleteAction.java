package com.cos.action.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDao;
import com.cos.dao.CommentDao;
import com.cos.dao.ReplyDao;
import com.cos.model.Comment;

public class BoardDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int id = Integer.parseInt(request.getParameter("id"));
		
		CommentDao cDao = new CommentDao();
		List<Comment> comments = new  ArrayList<Comment>();
		comments = cDao.findByBoardId(id);
		ReplyDao rDao = new ReplyDao();
		
		for (Comment comment : comments) {
			rDao.deleteAll(comment.getId());
			cDao.delete(comment.getId());
		}
		
		
		BoardDao dao = new BoardDao();
		dao.delete(id);
		
		response.sendRedirect("index.jsp");
		
	}
}
