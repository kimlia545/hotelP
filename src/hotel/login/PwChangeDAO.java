package hotel.login;

import java.sql.Connection;
import java.sql.PreparedStatement;

import hotel.DBConnectionMgr;

public class PwChangeDAO {
	private Connection conn; //데이터베이스에 접근하기
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
	
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	public int changePw(String id,String pw){ 
		String query="";
		int rs = 0;

		try{
			
			query = "UPDATE logintb SET pw=? WHERE id=?";
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,pw);
			pstmt.setString(2,id);
			rs = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt);
		}
		return rs;
	}
}
