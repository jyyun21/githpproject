package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import humorProject.dao.BoardDao;
import humorProject.dao.BoardFreeDao;
import humorProject.model.BoardReport;

public class BoardBlock implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		String unblock = request.getParameter("unblock");
		int num =  Integer.parseInt(request.getParameter("num"));
		BoardDao bd = null;
		if(category.equals("free"))
			bd = BoardFreeDao.getInstance();
		else 
			bd = BoardDao.getInstance();
		
		BoardReport br = new BoardReport();
		br.setNum(num);
		br.setCategory(category);
		if(unblock==null) {
			bd.setBlock(num, br);
		}
		else
			bd.setUnBlock(num, br);
		return "boardBlock.jsp";
	}

}
