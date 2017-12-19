package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.BestTable;
import humorProject.dao.BestTableDao;
import humorProject.dao.Board;
import humorProject.dao.BoardBestDao;
import humorProject.dao.BoardDao;
import humorProject.dao.BoardFreeDao;

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
			if(bd.getBestNum(num) ==10) {
				//베스트게시판에 글 쓰기
				Board board1=bd.select(num);
				BoardBestDao bestDao = BoardBestDao.getInstance();
				bestDao.write(board1);
				
			}
		}
		request.setAttribute("select", select); //result = 0이면 아직 추천안함. 1이면 추천을 이미했음
		request.setAttribute("category", category);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		//Num. pageNum
		return "clickBest.jsp";
	}

}
