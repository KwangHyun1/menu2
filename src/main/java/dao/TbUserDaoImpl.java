package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.TbUser;

public class TbUserDaoImpl implements TbUserDao {
	private static String dburl = "jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul&useSSL=false";
	private static String dbUser = "root";
	private static String dbpasswd = "1234";
	
	
	@Override
	public TbUser selectLogin(String userID, String userPW) {
		TbUser dto = null;	// 이 메소드에서 전달값
		
		Connection conn =null; 			//연결을 맺어낼 객체
		PreparedStatement ps = null;	//명령을 선언할 객체
		ResultSet rs = null; 			//결과값을 담아낼 객체
	
		
		try {
			//드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			//커넥션 객체
			conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
	
			String sql = "SELECT * FROM tb_user WHERE userID=? AND userPW = ?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userID);
			ps.setString(2, userPW);
			
			rs = ps.executeQuery(); //명렁어 실행

			if(rs.next()) {		
				dto = new TbUser(); // null이였던 값을 데이터 할당
				System.out.println("로그인 성공");
				dto.setUserID(rs.getString("userID"));
				dto.setUserPW(rs.getString("userPW"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				// 위 데이터를 셋팅이 끝나면 리스트에 담는다.

			}else {
				System.out.println("로그인 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null) {				
				try {
					rs.close();
				} catch (SQLException e) {				
					e.printStackTrace();
				}
			}
			if(ps != null) {				
				try {
					ps.close();
				} catch (SQLException e) {				
					e.printStackTrace();
				}
			}
			if(conn != null) {				
				try {
					conn.close();
				} catch (SQLException e) {				
					e.printStackTrace();
				}
			}

		}return dto;
	}

}
