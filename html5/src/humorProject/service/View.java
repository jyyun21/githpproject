package humorProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.Board;
import humorProject.dao.BoardDao;
import humorProject.dao.BoardFile;
import humorProject.dao.BoardFileDao;
import humorProject.dao.BoardFreeDao;



public class View implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String category = request.getParameter("category");
		String check = request.getParameter("check");
		BoardDao bd = null;
		
		if(category.equals("free")) bd = BoardFreeDao.getInstance();
		else bd = BoardDao.getInstance();
		
		if (check == null) {
			bd.readcount(num); //+1해주기
		}
		Board board = bd.select(num); //선택한 num에 맞는 글을 가져와서 거기의 정보를 가져옴 
		BoardFileDao fd = BoardFileDao.getInstance();
		BoardFile file = new BoardFile();
		List<BoardFile> fileList = null;
		file.setNum(num);
		file.setCategory(category);
		//파일리스트 가져오기
		fileList = fd.getImage(file); //번호와 category를 세팅한걸 넣어서 만는 이미지 가져오기
		request.setAttribute("fileList", fileList); //list
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		request.setAttribute("id", id);
		return "viewBoard.jsp";
	}

}
