package humorProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.Board;
import humorProject.dao.BoardDao;
import humorProject.dao.BoardFile;
import humorProject.dao.BoardFileDao;



public class View implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String check = request.getParameter("check");
		BoardDao bd = BoardDao.getInstance();
		if (check == null) {
			bd.readcount(num); //+1해주기
		}
		Board board = bd.select(num); //선택한 num에 맞는 글을 가져와서 거기의 정보를 가져옴 
		BoardFileDao fd = BoardFileDao.getInstance();
		List<BoardFile> fileList = null;
		fileList = fd.getImage(num);
		request.setAttribute("fileList", fileList); //list
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		request.setAttribute("id", id);
		return "viewBoard.jsp";
	}

}
