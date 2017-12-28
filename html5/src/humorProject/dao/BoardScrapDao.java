package humorProject.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import humorProject.model.BoardBest;
import humorProject.model.BoardScrap;

public class BoardScrapDao {
	private static BoardScrapDao instance = new BoardScrapDao();

	public static BoardScrapDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static { // static 변수 초기화 블럭
		// 자유게시판 Board
		try {
			Reader reader1 = Resources.getResourceAsReader("configuration_boardBest.xml");
			SqlSessionFactory ssf3 = new SqlSessionFactoryBuilder().build(reader1); // sqlsession을 만든다.
			session = ssf3.openSession(true); // 이걸 써줘야 db에서 자동 commit이 된다.
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}

	/////////////////////////////////////////////
	public int write(BoardScrap bs) {
		int result = 0;
		int num = 0;
		try {
			//최고 큰 수 구하기
			num = (int) session.selectOne("boardScrapns.getMaxNum");
			bs.setNum(num+1);
			//write
			result = session.insert("boardScrapns.write", bs);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public List<BoardScrap> list(BoardScrap bs){
		List<BoardScrap> list = null;
		try {
			//boardBest에 startRow와 endRow를 입력해서 넣어줌, 그 값을 이용하기 위해
			list = session.selectList("boardScrapns.list2", bs);
		} catch (Exception e) { System.out.println(e.getMessage());
		}
		return list;
	}
	public int total() {
		int total = 0;
		try {
			total = (int) session.selectOne("boardScrapns.total");
		} catch (Exception e) { System.out.println(e.getMessage());
		}
		return total;
	}
	//////////////////


}
