package humorProject.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.BoardBestDao;
import humorProject.dao.BoardDao;
import humorProject.dao.BoardFreeDao;
import humorProject.dao.MemberDao;
import humorProject.model.Board;
import humorProject.model.BoardBest;
import humorProject.model.Member;



public class MainAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//SessionChk.chk(request,response);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id != null ) {
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		request.setAttribute("member", member);
		}
		BoardDao bd = BoardDao.getInstance();
		List<Board> list = bd.getMainList();
		
		BoardBestDao bestDao = BoardBestDao.getInstance();
		List<BoardBest> bestList = bestDao.getMainList();
		List<Board> boardList = new ArrayList<>();
		for (BoardBest b : bestList) {
			String category = b.getCategory(); //어떤 게시판인지 알기
			if (category.equals("free"))
				bd = BoardFreeDao.getInstance();
			else
				bd = BoardDao.getInstance();
			Board board = bd.select(b.getBoard_num());
			board.setBoardBestNum(b.getNum());//실제 유머게시판의 num이아니라 best게시판의 num을 설정
			boolean result = boardList.add(board);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("boardList", boardList);
		
		return "main.jsp";
	}

}
