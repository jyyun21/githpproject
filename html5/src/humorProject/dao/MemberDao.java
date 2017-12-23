package humorProject.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.TransactionIsolationLevel;

import humorProject.model.Member;

/**
 * DAO: 데이터베이스 접근 객체의 약자. 실질적으로 데이터베이스에서 정보를 불러오거나 정보넣을때 사용 
 * */
public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}//singleton
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session= ssf.openSession(true);
			} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	public int idChk(String id) {
		int result = 1;
		Member member = null;
		try {
			member = (Member)session.selectOne("memberns.select",id);//namespace붙여서 insert빨리찾음//넘어온 member랑 같으면 헷갈리므로 mem으로 명함.
			if(member == null) result = 0;
			else result = 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	//회원가입-db에 insert..sql문은 member.xml에 있음
	public int insert(Member member) {
		int result = 0;
		try {
			result = session.insert("memberns.insert",member);//namespace붙여서 insert빨리찾음
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;//0그대로면 회원가입실패.0보다크면 회원가입성공.join.jsp
		
	}
	/**
	 * //로그인 기능-userDAO에서 가져온것
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID=?";
		try {
			pstmt= conn.prepareStatement(SQL);// 데이터베이스에 sql문 삽입
			pstmt.setString(1, userID);// sql인젝션과 같은 해킹기법 방어하기위한수단으로  pstmt안 '?'에 넣는다.
			rs =pstmt.executeQuery();// 결과담을 객체 
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {//결과로 나온 패스워드와 접속시도한 패스워드 같다면
					return 1;// 로그인 성공
				}
				else return 0; // 비밀번호 불일치
			}
			return -1; //아이디가 없음.(sql 결과값이 없음)
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
}
	 * */
	//로그인 기능 login.jsp로 연결
	public int loginChk(Member member) {
		int result = -1;
		try {
			Member mem = (Member)session.selectOne("memberns.select",member.getId());//namespace붙여서 insert빨리찾음//넘어온 member랑 같으면 헷갈리므로 mem으로 명함.
			if(mem==null) result =-1;//존재하지 않는 아이디
			else {
				String dbPass = mem.getPassword();
				if(dbPass.equals(member.getPassword())) result =1;//로그인 성공
				else result = 0;//비밀번호가 틀림
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public Member select(String id) {
		Member member = null;
		try {
			member = (Member)session.selectOne("memberns.select",id);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return member;
	}
	public int update(Member member) {
		int result = 0;
		try {
			result = session.update("memberns.update",member);//namespace붙여서 insert빨리찾음
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public int delete(String id) {
		int result = 0;
		try {
			result = session.update("memberns.delete",id);//update그대로 두고 속은 delete. 실제로는 n-> y만 실행
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
}
