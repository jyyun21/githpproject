package humorProject.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.TransactionIsolationLevel;


import humorProject.model.Member;

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
			member = (Member)session.selectOne("memberns.selectJoinId",id);//namespace붙여서 insert빨리찾음//넘어온 member랑 같으면 헷갈리므로 mem으로 명함.
			if(member == null) result = 0; //아이디가 존재하지않으면 0
			else result = 1;//존재하고 del=n 이면 1. y일땐 어쩌지?
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public int insert(Member member) {
		int result = 0;
		try {
			result = session.insert("memberns.insert",member);//namespace붙여서 insert빨리찾음
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
		
	}
	
	public int loginChk(Member member) {
		int result = -1;
		try {
			Member mem = (Member)session.selectOne("memberns.select",member.getId());//namespace붙여서 insert빨리찾음//넘어온 member랑 같으면 헷갈리므로 mem으로 명함.
			if(mem==null) result =-1;//아이디 불일치
			else {
				String dbPass = mem.getPassword();
				if(dbPass.equals(member.getPassword())) result =1; //아이디, 비번 일치
				else result = 0;//아이디 일치, 비번 불일치
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public Member select(String id) {
		Member member = null;
		try {
			member = (Member)session.selectOne("memberns.select",id);//namespace붙여서 insert빨리찾음//넘어온 member랑 같으면 헷갈리므로 mem으로 명함.
			
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
	
	//리스트용 임시. connection 바꾸기

	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("연결실패: "+ e.getMessage());
		}
		return conn;
	}
	public List<Member> list(int startRow, int endRow) {
		List<Member> list= new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//String sql = "select * from member2 ";
		String sql = "select * from (select rowNum rn, a.* from "
				+ "(select * from hpmember order by reg_date desc) a) "
				+ "where rn between ? and ? ";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setAddress(rs.getString("address"));
				member.setTel(rs.getString("tel"));
				member.setReg_date(rs.getDate("reg_date"));
				member.setDel(rs.getString("del"));
				list.add(member);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {if(rs !=null)rs.close();
				 if(pstmt !=null)pstmt.close();
			     if(conn !=null)conn.close();
			} catch (Exception e) {
			}
		}
		return list;
		
	}
	public int total() {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from hpmember";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {if(rs !=null)rs.close();
				 if(pstmt !=null)pstmt.close();
			     if(conn !=null)conn.close();
			} catch (Exception e) {
			}
		}
		return result;
		
	}
	
}
