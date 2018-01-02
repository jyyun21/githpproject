package humorProject.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import humorProject.model.Board;
import humorProject.model.BoardBest;

public class BoardBestDao {
	private static BoardBestDao instance = new BoardBestDao();

	public static BoardBestDao getInstance() {
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
	public int write(BoardBest bb) {
		int result = 0;
		int num = 0;
		try {
			//최고 큰 수 구하기
			num = (int) session.selectOne("boardBestns.getMaxNum");
			bb.setNum(num+1);
			result = session.insert("boardBestns.write", bb);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public List<BoardBest> list(BoardBest boardBest){
		List<BoardBest> list = null;
		try {
			//boardBest에 startRow와 endRow를 입력해서 넣어줌, 그 값을 이용하기 위해
			list = session.selectList("boardBestns.list", boardBest);
		} catch (Exception e) { System.out.println(e.getMessage());
		}
		return list;
	}
	public int total() {
		int total = 0;
		try {
			total = (int) session.selectOne("boardBestns.total");
		} catch (Exception e) { System.out.println(e.getMessage());
		}
		return total;
	}
	public List<BoardBest> getMainList() {
		List<BoardBest> list = null;
		try {
			list = session.selectList("mainList");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

}
