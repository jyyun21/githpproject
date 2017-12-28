package humorProject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.batch.Main;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import humorProject.dao.BoardScrapDao;
import humorProject.model.BoardBest;
import humorProject.model.BoardScrap;

public class BoardScrapAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String category = request.getParameter("category");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		//로그인을 안했다면
		if(id==null || id.equals("")) {
			return "loginNeed.jsp";
		}
		//table에 저장할 내용 set
		BoardScrap bs = new BoardScrap();
		bs.setId(id);
		bs.setCategory(category);
		bs.setBoard_num(num);
		bs.setFolder("basic"); //기본 폴더로 우선 설정
		
		//Dao를 통해 write
		BoardScrapDao bsDao = BoardScrapDao.getInstance();
		int result = bsDao.write(bs);
		request.setAttribute("result", result);
		
		return "boardScrapResult.jsp";
	}

}
