package users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



/**
 * DAO: 데이터베이스 접근 객체의 약자. 실질적으로 데이터베이스에서 정보를 불러오거나 정보넣을때 사용 
 * */
public class UserDAO {
	private Connection conn;//접근하게 해주는 한 객체
	private PreparedStatement pstmt;
	private ResultSet rs;// 정보를 담을수있는 객체
	
	public UserDAO() {//하나의객체 생성했을때 자동으로 데이터베이스 커넥션
		try {
			String dbURL ="jdbc:mysql://localhost:3307/BBS";
			String dbID ="root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");//드라이버:oracle접속할 수 있도록 매개체 역할하는 라이브러리역할
			conn= DriverManager.getConnection(dbURL,dbID,dbPassword);//conn객체안에 접속된 정보.
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//로그인 기능
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
