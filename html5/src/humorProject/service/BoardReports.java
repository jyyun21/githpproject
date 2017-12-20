package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import humorProject.dao.BoardReport;
import humorProject.dao.BoardReportDao;

public class BoardReports implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String category = request.getParameter("category");
		String r_type = request.getParameter("r_type");
		String r_content = request.getParameter("r_content");
		BoardReport boardReport = new BoardReport();
		boardReport.setNum(num);
		boardReport.setCategory(category);
		boardReport.setId(id);
		boardReport.setR_content(r_content);
		boardReport.setR_type(r_type);
		BoardReportDao brd = BoardReportDao.getInstance();
		int result = brd.write(boardReport);
		request.setAttribute("result", result);
		return "boardReport.jsp";
	}

}
