package hotel.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import hotel.DBConnectionMgr;

public class HTHistoryDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	//내 예약내역가져오기
	public Vector<HTHistoryDTO> myHistoryselectAll(String rvID){ 
		ResultSet rs = null;
		String query = "SELECT * FROM hotel_reservation where rvID = ?";
		Vector<HTHistoryDTO> v = new Vector<HTHistoryDTO>();
		
		try{
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rvID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				HTHistoryDTO dto = new HTHistoryDTO();
				dto.setRvNum(rs.getInt("rvNum"));
				dto.setRvName(rs.getString("rvName")); 
				dto.setRvID(rs.getString("rvID"));
				dto.setRvHotelName(rs.getString("rvHotelName"));
				dto.setRvroomType(rs.getString("rvroomType"));
				dto.setPrice(rs.getInt("price"));
				dto.setCheckIn(rs.getString("checkIn"));
				dto.setCheckOut(rs.getString("checkOut"));
				dto.setReviewWrite(rs.getBoolean("reviewWrite"));
				v.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return v;
	}  //selectAll END
	

	 //내 예약내역 중 클릭한 예약만 가져오기
			public Vector selecthistory(int rvNum){
				ResultSet rs = null;
				String query =  "SELECT * FROM hotel_reservation where rvNum =?";
				Vector<HTHistoryDTO> v = new Vector<HTHistoryDTO>();
					
				try {
					conn = pool.getConnection();
					pstmt=conn.prepareStatement(query);
					pstmt.setInt(1,rvNum);
					rs = pstmt.executeQuery();
						
					while(rs.next()){				
						HTHistoryDTO dto = new HTHistoryDTO();
						dto.setRvNum(rs.getInt(1));
						dto.setIdx(rs.getInt(2));
						dto.setRoomNum(rs.getInt(3));
						dto.setRvName(rs.getString(4));
						dto.setRvID(rs.getString(5));
						dto.setRvHotelName(rs.getString(6));
						dto.setRvroomType(rs.getString(7));
						dto.setPrice(rs.getInt(8));
						dto.setCheckIn(rs.getDate(9)+"");  //값은 Date로 받아오고 ""로 String 타입으로 값 바꾸기
						dto.setCheckOut(rs.getDate(10)+"");
						dto.setReviewWrite(rs.getBoolean(11));
							
						v.add(dto);
					}
				}catch (Exception e) {
					e.printStackTrace();
				} finally{
					pool.freeConnection(conn, pstmt, rs);
				}
				return v;
			}  //selecthistory END

			
			
}
