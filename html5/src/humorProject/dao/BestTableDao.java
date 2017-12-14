package humorProject.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BestTableDao {
	private static BestTableDao instance = new BestTableDao();
	private BestTableDao() {
	}
	public static BestTableDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static { // static 변수 초기화 블럭
		//추천 DB
		try {
			Reader reader3 = Resources.getResourceAsReader("configuration_best.xml");
			SqlSessionFactory ssf3 = new SqlSessionFactoryBuilder().build(reader3); // sqlsession을 만든다.
			session = ssf3.openSession(true); // 이걸 써줘야 db에서 자동 commit이 된다.
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	public int clickBest(BestTable bestTable) {
		int select = 0;
		try {
			select = (int) session.selectOne("checkIdNum", bestTable);
			if(select ==0) {//아이디가 게시판에 추천한 경우가 없다면 
				session.insert("insertBest",bestTable);
			}
		} catch (Exception e) {System.out.println(e.getMessage());
		}
		return select;
	}
}
