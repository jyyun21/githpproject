package humorProject.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardBestDao extends BoardDao {
	private static BoardBestDao instance = new BoardBestDao();

	public static BoardBestDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	private static SqlSession sessionFile;
	static { // static 변수 초기화 블럭
		// 자유게시판 Board
		try {
			Reader reader3 = Resources.getResourceAsReader("configuration_boardBest.xml");
			SqlSessionFactory ssf3 = new SqlSessionFactoryBuilder().build(reader3); // sqlsession을 만든다.
			session = ssf3.openSession(true); // 이걸 써줘야 db에서 자동 commit이 된다.
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		//file DB
		try {
			Reader reader2 = Resources.getResourceAsReader("configuration_file.xml");
			SqlSessionFactory ssf2 = new SqlSessionFactoryBuilder().build(reader2); // sqlsession을 만든다.
			sessionFile = ssf2.openSession(true); // 이걸 써줘야 db에서 자동 commit이 된다.
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

	}

	/////////////////////////////////////////////
	public int write(Board board) {
		int result = 0;
		int num = 0;
		try {
			num = (int) session.selectOne("getMaxNum");
			board.setNum(1);
			result = session.insert("write", board);
			int number = board.getNum();
			sessionFile.update("tempChange", number);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	////////////////
	public int getMaxNum() {
		int num = 0;
		try {
			num = (int) session.selectOne("getMaxNum");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return num + 1;
	}

	public List<Board> getList(Board board) {
		List<Board> list = null;
		try {
			list = session.selectList("boardList2", board); // return type이 board고 그걸 list에 차곡차곡 넣어줌
			// String sql = "select * from (select rowNum rn, a.* from ( select * from board
			// order by num desc ) a ) where rn between ? and ?";
			// num desc순으로 꺼내고 꺼낸 rowNum에 rn을붙여서 다시 꺼내고 이 rn을 가지고 범위를 정함

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	public Board select(int num) {
		Board board = null;
		try {
			board = (Board) session.selectOne("select", num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return board;
	}

	public int total() {
		int total = 0;
		try {
			total = (int) session.selectOne("total");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public int delete(int num) {
		int result = 0;
		try {
			result = session.delete("delete", num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public void readcount(int num) {
		try {
			session.update("plusReadcount", num); // +1해주기
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public int update(Board board) {
		int result = 0;
		try {
			result = session.update("update", board);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public void bestPlus(int num) {
		try {
			// int best = (int) sessionBest.selectOne("getBestNum", num); //추천수를 구함
			session.update("plusBest", num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Override
	public int getBestNum(int num) {
		int result =0;
		try {
			//추천 수 구하기
			result = (int) session.selectOne("getBestNum", num);
		} catch (Exception e) { System.out.println(e.getMessage());
		}
		return result;
	}
}
