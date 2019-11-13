package com.cos.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDao;
import com.cos.model.Board;
import com.cos.util.Utils;

public class BoardListAction2 implements Action {

	private final static String TAG = "BoardListAction : ";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int page = Integer.parseInt(request.getParameter("page"));

		if (page <= 0) {
			page = 1;
		}

		BoardDao bDao = new BoardDao();
		List<Board> boards = bDao.findAll(page);
		List<Board> hotBoards = bDao.findOrderByReadCountDesc();
		
		Utils.setPreviewImg(boards);
		Utils.setPreviewContent(boards);
		Utils.setPreviewImg(hotBoards);
		
		request.setAttribute("boards", boards);
		request.setAttribute("hotBoards", hotBoards);
		
		
		RequestDispatcher dis = request.getRequestDispatcher("/board/list.jsp");
		dis.forward(request, response);

	}

}
