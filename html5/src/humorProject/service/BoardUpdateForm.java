package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import humorProject.dao.Board;
import humorProject.dao.BoardDao;

public class BoardUpdateForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum= Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(num);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		
		return "boardUpdateForm.jsp";
	}

}
