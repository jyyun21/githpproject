package humorProject.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import humorProject.dao.BoardReportDao;
import humorProject.model.BoardReport;

public class ViewReport implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		BoardReportDao reportDao = BoardReportDao.getInstance();
		List<BoardReport> list = new ArrayList<>();
		list = reportDao.list();
		for(BoardReport boardReport : list) {
			System.out.println(boardReport.getNum() + " : " + boardReport.getCategory() + " : " + boardReport.getBlock());
		}
		request.setAttribute("list", list);
		return "viewReport.jsp";
	}

}
