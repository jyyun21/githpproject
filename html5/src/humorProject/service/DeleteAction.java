package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import humorProject.dao.MemberDao;
import humorProject.model.Member;


public class DeleteAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String password = request.getParameter("password");
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		MemberDao md = MemberDao.getInstance();
		int passwordChk = md.loginChk(member);
		int result =0;
		if(passwordChk>0) {//패스워드가 맞을경우
			 result = md.delete(id);
			if(result>0) {	session.invalidate();}
			request.setAttribute("result", result);//0보다 크거나 0
			session.invalidate();//세션해제
		}else if(passwordChk==0) {//패스워드가 맞지않을 경우
			result =-1;
			request.setAttribute("result", result);
		}
		
		return "delete.jsp";
		
	}
}
