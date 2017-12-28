package humorProject.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import humorProject.model.BoardReport;

public class BoardReportDao {
	private static BoardReportDao instance = new BoardReportDao();

	public static BoardReportDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static { // static 변수 초기화 블럭
		// 자유게시판 Board
		try {
			Reader reader1 = Resources.getResourceAsReader("configuration_boardReport.xml");
			SqlSessionFactory ssf3 = new SqlSessionFactoryBuilder().build(reader1); // sqlsession을 만든다.
			session = ssf3.openSession(true); // 이걸 써줘야 db에서 자동 commit이 된다.
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}

	/////////////////////////////////////////////
	public int write(BoardReport br) {
		int result = 0;
		try {
			result = session.insert("write", br);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public List<BoardReport> list(BoardReport br){
		List<BoardReport> list = null;
		try {
			//boardBest에 startRow와 endRow를 입력해서 넣어줌, 그 값을 이용하기 위해
			list = session.selectList("list", br);
		} catch (Exception e) { System.out.println(e.getMessage());
		}
		return list;
	}
	
}
