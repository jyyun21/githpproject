package humorProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import humorProject.dao.BoardDao;
import humorProject.dao.BoardFreeDao;
import humorProject.model.Board;

public class Search implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//검색할 key를 받아오기
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		//자게와 유게에서 정보 받아오기 
		BoardDao boardDao = BoardDao.getInstance();
		//BoardFreeDao boardFreeDao = BoardFreeDao.getInstance();
		
		//검색keyword를 가지고 board정보가져오기
		List<Board> boardList = null;
		boardList = boardDao.search(keyword);
	//	boardList.addAll(boardFreeDao.search(keyword));
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		return "search.jsp";
	}

}
