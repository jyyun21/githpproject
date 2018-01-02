package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.BestTableDao;
import humorProject.dao.BoardBestDao;
import humorProject.dao.BoardDao;
import humorProject.dao.BoardFreeDao;
import humorProject.dao.BoardNoticeDao;
import humorProject.model.BestTable;
import humorProject.model.Board;
import humorProject.model.BoardBest;

public class BoardClickBest implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		if(SessionChk.chk(request, response))return "loginForm.jsp";
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String category = request.getParameter("category");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		BoardDao bd = null;
		if(category.equals("free")) {
			bd = BoardFreeDao.getInstance();
		}
		else if(category.equals("notice")) bd = BoardNoticeDao.getInstance();
		else {
			bd = BoardDao.getInstance();
		}
		//추천 테이블에 정보넣기
		BestTable bestTable = new BestTable();
		BestTableDao btd = BestTableDao.getInstance();
		bestTable.setId(id);
		bestTable.setNum(num);
		bestTable.setCategory(category);
		int select = btd.clickBest(bestTable);//추천테이블에 누가 추천했는지 정보 기입
		if(select ==0) { //아직 추천을 안했다면
			bd.bestPlus(num); //게시판테이블에도 추천수 plus하기
			if (category.equals("free") || category.equals("humor")) { //자게나 유게일때, 공지사항은 베스트로못가게
				if (bd.getBestNum(num) == 10) {
					// 자유, 유머 게시판에 따라 bd가 선택됨
					Board board1 = bd.select(num);
					BoardBestDao bestDao = BoardBestDao.getInstance();
					BoardBest bb = new BoardBest();
					bb.setCategory(board1.getCategory());
					// 유머, 자유게시판의 번호를 저장
					bb.setBoard_num(board1.getNum());
					bestDao.write(bb);
				}
			}
		}
		String best = request.getParameter("best");
		String scrap = request.getParameter("scrap");
		String search = request.getParameter("search");
		if(search !=null) {
			String keyword = request.getParameter("keyword");
			String keyfield = request.getParameter("keyfield");
			request.setAttribute("keyword", keyword);
			request.setAttribute("keyfield", keyfield);
		}
		request.setAttribute("select", select); //result = 0이면 아직 추천안함. 1이면 추천을 이미했음
		request.setAttribute("category", category);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		request.setAttribute("best", best);
		request.setAttribute("scrap", scrap);
		request.setAttribute("search", search);
		
		//Num. pageNum
		return "clickBest.jsp";
	}

}
