package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.Board;
import humorProject.dao.BoardNoticeDao;

public class Notice implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = (HttpSession) request.getAttribute("id");
		String subject = request.getParameter("subject");
		String  id= request.getParameter("id");
		String  head= request.getParameter("head");
		String  content= request.getParameter("content");
		String ip = request.getRemoteAddr();
		Board board = new Board();
		board.setSubject(subject);
		board.setId(id);
		board.setCategory("notice");
		board.setContent(content);
		board.setIp(ip);
		board.setHead(head);
		BoardNoticeDao bnb = BoardNoticeDao.getInstance();
		int result = bnb.write(board);
		request.setAttribute("result", result);
		return "noticeResult.jsp";
	}

}
