package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardReportForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		if(SessionChk.chk(request, response))return "loginNeed.jsp";
		int num = Integer.parseInt(request.getParameter("num"));
		String category = request.getParameter("category");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		request.setAttribute("id", id);
		request.setAttribute("num", num);
		request.setAttribute("category", category);
		return "board/boardReportForm.jsp";
	}

}
