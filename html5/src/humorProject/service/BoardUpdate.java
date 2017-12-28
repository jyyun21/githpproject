package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import humorProject.dao.BoardDao;
import humorProject.dao.BoardFreeDao;
import humorProject.dao.BoardNoticeDao;
import humorProject.model.Board;

public class BoardUpdate implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String category= request.getParameter("category");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		BoardDao bd = null;
		if(category.equals("free")) bd = BoardFreeDao.getInstance();
		else if(category.equals("notice")) bd = BoardNoticeDao.getInstance();
		else	bd = BoardDao.getInstance();
		
		Board board= bd.select(num); //선택한 보드를 가져옴
		board.setSubject(subject);
		board.setContent(content);
		int result = bd.update(board);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		return "boardUpdate.jsp";
	}

}
