package humorProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.BoardDao;
import humorProject.dao.BoardFileDao;
import humorProject.dao.BoardFreeDao;
import humorProject.dao.BoardNoticeDao;
import humorProject.dao.MemberDao;
import humorProject.model.Board;
import humorProject.model.BoardFile;
import humorProject.model.Member;

public class View implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		//SessionChk-MainAction.java 닉네임 가져오는 부분
		if(id!=null) {
			MemberDao md =MemberDao.getInstance();
			Member member = md.select(id);
			request.setAttribute("member", member);
		}
		
		
		//베스트게시판에서 넘어온건지 확인
		String best = request.getParameter("best");
		//스크랩게시판에서넘어온것
		String scrap = request.getParameter("scrap");
	//	String notice = request.getParameter("notice");
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String category = request.getParameter("category");
		String check = request.getParameter("check");
		BoardDao bd = null;
		//공지글 인지 확인
		//일반 게시판 글
		if(category.equals("notice")) bd = BoardNoticeDao.getInstance();
		else if(category.equals("free")) bd = BoardFreeDao.getInstance();
		else bd = BoardDao.getInstance();
		
		if (check == null) {
			bd.readcount(num); //+1해주기
		}
		Board board = bd.select(num); //선택한 num에 맞는 글을 가져와서 거기의 정보를 가져옴 
		BoardFileDao fd = BoardFileDao.getInstance();
		BoardFile file = new BoardFile();
		List<BoardFile> fileList = null;
		//가져올 카테고리와 게시판 번호를 넣기 
		file.setNum(num);
		file.setCategory(category);
		//파일리스트 가져오기
		fileList = fd.getImage(file); //번호와 category를 세팅한걸 넣어서 맞는 이미지 가져오기
		
		//request.setAttribute("notice", notice);
		
	
		request.setAttribute("scrap", scrap);
		request.setAttribute("id", id);
		request.setAttribute("best", best);
		request.setAttribute("fileList", fileList); //list
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		return "viewBoard.jsp";
	}

}
