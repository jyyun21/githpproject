package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.BestTable;
import humorProject.dao.BestTableDao;
import humorProject.dao.BoardDao;

public class BoardClickBest implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		if(SessionChk.chk(request, response))return "loginForm.jsp";
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		BoardDao bd = BoardDao.getInstance();
		BestTable bestTable = new BestTable();
		BestTableDao btd = BestTableDao.getInstance();
		bestTable.setId(id);
		bestTable.setNum(num);
		int select = btd.clickBest(bestTable);
		if(select ==0) { //아직 추천을 안했다면
			bd.bestPlus(num);
		}
		request.setAttribute("select", select); //result = 0이면 아직 추천안함. 1이면 추천을 이미했음
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		//Num. pageNum
		return "clickBest.jsp";
	}

}
