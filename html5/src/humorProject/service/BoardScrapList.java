package humorProject.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.BoardDao;
import humorProject.dao.BoardFreeDao;
import humorProject.dao.BoardScrapDao;
import humorProject.dao.MemberDao;
import humorProject.model.Board;
import humorProject.model.BoardBest;
import humorProject.model.BoardScrap;
import humorProject.model.Member;

public class BoardScrapList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// SessionChk-MainAction.java에서 가져옴. 닉네임받아오기위해서
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(id);
			request.setAttribute("member", member);
		}
		//BoadScraop, bs
		BoardScrap bs = new BoardScrap();
		bs.setId(id);
		BoardScrapDao bsDao = BoardScrapDao.getInstance();
		
		//////////paging을 위한 변수설정
		final int ROWPERPAGE = 10; //한페이지당 보여주는 글의 개수
		final int PAGEPERBLOCK = 10;//페이지를 표시할 개수 
		String pageNum = request.getParameter("pageNum"); //pageNum은 현재 페이지
		if(pageNum == null || pageNum.equals("")){
			pageNum = "1";
		}
		int currentPage =Integer.parseInt(pageNum); //현재 페이지 1,  2, 3페이지
		int startRow = (currentPage -1)*ROWPERPAGE +1;// 1~10, 11~20, 21~30
		int endRow = startRow + ROWPERPAGE -1;
		int total = bsDao.total(); //총 글의 개수
		int totPage = (int)Math.ceil((double)total/ROWPERPAGE);//한 페이지당 글을 표시할 수 있는 개수로 나누면 총 페이지개수가 나옴 
		int startPage = currentPage -(currentPage-1)%PAGEPERBLOCK; //1,2,3,4,5,6,7,8,9,0 || 11,12,13,14,15,16,17,18,19,20 페이지 수 10개씩 표시되게 한다.
													//7페이지면 1~10, 15페이지면 11~20, 28페이지면 21~30 페이지가 게시판밑에 표시됨
		int endPage = startPage + PAGEPERBLOCK-1;
		if(endPage>totPage) endPage = totPage; //마지막 페이지 수 변경, 34페이지까지있는 게시판이라면 이 코드가 없으면 40페이지까지 표시된다.
		int tot = total - startRow +1;
		bs.setStartRow(startRow); //시작 열과 끝 열의 수를 정함 
		bs.setEndRow(endRow);
		
		// id가 가지고 있는 scrap목록 불러오기
		List<BoardScrap> list = null;
		list = bsDao.list(bs);

		// 스크랩목록에서 맞는 board내용 가져와서 저장하기
		BoardDao bd = null;
		List<Board> boardList = new ArrayList<>();
		if (list != null) {
			for (BoardScrap b : list) {
				String category = b.getCategory(); // 어떤 게시판인지 알기
				if (category.equals("free")) // 자게
					bd = BoardFreeDao.getInstance();
				else // 유게
					bd = BoardDao.getInstance();
				Board board = bd.select(b.getBoard_num());
				board.setBoardBestNum(b.getNum());// 실제 유머게시판의 num이아니라 best게시판(b)의 num을 설정
				boolean result = boardList.add(board);
			}
		}
		
		// 시간 설정부분
		for (Board board1 : boardList) {
			SimpleDateFormat sdf2 = new SimpleDateFormat("yy-MM-dd HH:mm:ss");// HH:mm:ss
			String old = sdf2.format(board1.getReg_date());
			// if(today.compareTo(board.getReg_date()) <0) board.setTime(news); //today가 무조건
			// 커 1 이 나온다.
			board1.setTime(old);
		}
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow",startRow );
		request.setAttribute("endRow",endRow );
		request.setAttribute("total", total);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startPage",startPage );
		request.setAttribute("endPage", endPage);
		request.setAttribute("ROWPERPAGE", ROWPERPAGE);
		
		
		return "boardScrapList.jsp";
	}

}
