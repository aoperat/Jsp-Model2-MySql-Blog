package com.cos.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.BoardDao;
import com.cos.model.Board;
import com.cos.model.User;
import com.cos.util.Script;
import com.cos.util.Utils;

public class BoardDetailAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		if (request.getParameter("id") == null || request.getParameter("id").equals("")) {
		}

		int id = Integer.parseInt(request.getParameter("id"));

		BoardDao dao = new BoardDao();
		Board board = dao.findById(id);


		if (board != null) {
			
			int result = dao.increaseReadCount(id);
			if (result == 1) {
                
				// 유튜브 주소 파싱
				Utils.setPreviewYoutube(board);

				// board를 request에 담고 dispatcher 로 이동
				request.setAttribute("board", board);
				RequestDispatcher dis = request.getRequestDispatcher("board/detail.jsp");
				dis.forward(request, response);

			} else {
				Script.back(response);
			}
		} else {
			Script.back(response);
		}

	}

}
