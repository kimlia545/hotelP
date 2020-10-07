package hotel.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hotel.DBConnectionMgr;
import hotel.HotelDTO;

public class FindDAO {
	private Connection conn; //데이터베이스에 접근하기
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
	
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	public String idFind(String named, String email){ // 아이디 일치하는지 확인
		FindDTO dto = new FindDTO();
 		String result =null; 
		ResultSet rs= null;

		try {
			
			conn = pool.getConnection();
			String query = "select * from logintb where name=? and email=?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,named);
			pstmt.setString(2,email);
			rs = pstmt.executeQuery();

			if(rs.next()){
				result=(rs.getString("id"));
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn,pstmt,rs);
		}
		return result;
	}
	
	public FindDTO pwFind(String id, String email){ //  비밀번호 일치하는지 확인
		FindDTO dto = new FindDTO();
 		String result =null; 
		ResultSet rs= null;

		try {
			
			conn = pool.getConnection();
			String query = "select * from logintb where id=? and email=?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,id);
			pstmt.setString(2,email);
			rs = pstmt.executeQuery();

			
			if(rs.next()){
				dto.setPw(rs.getString("pw"));
				dto.setId(rs.getString("id"));
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn,pstmt,rs);
		}
		return dto;
	}
	
}
