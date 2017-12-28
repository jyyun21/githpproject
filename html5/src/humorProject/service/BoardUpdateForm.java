package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import humorProject.dao.BoardDao;
import humorProject.dao.BoardFreeDao;
import humorProject.dao.BoardNoticeDao;
import humorProject.model.Board;

public class BoardUpdateForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum= Integer.parseInt(request.getParameter("pageNum"));
		BoardDao bd = null;
		if(category.equals("free")) {
			bd = BoardFreeDao.getInstance();
		}
		else if(category.equals("notice")) bd = BoardNoticeDao.getInstance();
		else {
			bd = BoardDao.getInstance();
		}
		Board board = bd.select(num);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		
		return "boardUpdateForm.jsp";
	}

}
