package humorProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import humorProject.dao.BoardReportDao;
import humorProject.model.BoardReport;

public class ViewReport implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		BoardReportDao reportDao = BoardReportDao.getInstance();
		List<BoardReport> list = reportDao.list();
		
		request.setAttribute("list", list);
		return "viewReport.jsp";
	}

}
