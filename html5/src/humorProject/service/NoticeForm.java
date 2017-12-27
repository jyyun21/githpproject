package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.MemberDao;
import humorProject.model.Member;

public class NoticeForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//SessionChk-MainAction.java에서 가져옴. 닉네임받아오기위해서
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id != null ) {
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		request.setAttribute("member", member);
		}
		
		if(id ==null || !id.equals("master")) return "index.jsp";
		request.setAttribute("id", id);
		return "noticeForm.jsp";
	}
	
}
