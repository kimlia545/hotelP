package hotel.ceo;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import hotel.DBConnectionMgr;
import hotel.HotelDTO;


public class CeoDAO {
	private Connection conn; //데이터베이스에 접근하기
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
	private PreparedStatement pstmt4;
	private PreparedStatement pstmt5;
	private PreparedStatement pstmt6;
	
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	public int ceoinsert(Vector<CeoDTO> roomdata, CeoDTO dto){
		//실행 구문
		int result =0;
		int result2 =0;
		int result3 =0;
		int result4 =0;
		int result5 =0;
		
		ResultSet rs;
		String query ="";
		String query2 ="";
		String query3 ="";
		String query4 ="";
		String query5 ="";
		String query6 ="";
		try {
			
			query = "UPDATE hotel_info SET NAME=?, address=?, roomTypeAmount=? WHERE ceoid=?";
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getHotelname());
			pstmt.setString(2, dto.getHoteladdress());
			pstmt.setInt(3, dto.getRoomamount());
			pstmt.setString(4, dto.getCeoid());
			result = pstmt.executeUpdate();

			
			query2 = "SELECT idx from hotel_Info WHERE ceoid=?";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, dto.getCeoid());
			rs = pstmt2.executeQuery();
			
			
			if(rs.next()){
				CeoidxDTO Ceodto = new CeoidxDTO();
				Ceodto.setIdx(rs.getInt(1));
								
				query3 = "insert into hotel_GuestRoom value(null,?,?,?,?,?,?)";
				for(int i=0; i<roomdata.size(); i++){
				pstmt3 = conn.prepareStatement(query3);
				pstmt3.setInt(1, Ceodto.getIdx());
				pstmt3.setString(2, roomdata.get(i).getRoomtype());
				pstmt3.setInt(3, roomdata.get(i).getGuestroomamount());
				pstmt3.setInt(4, roomdata.get(i).getRoomprice());
				pstmt3.setInt(5, roomdata.get(i).getMinguest());
				pstmt3.setInt(6, roomdata.get(i).getMaxguest());
				result = pstmt3.executeUpdate();
				}
				
				query5 = "insert into hotelimg value(?,?,?)";
				pstmt5 = conn.prepareStatement(query5);
				pstmt5.setInt(1, Ceodto.getIdx());
				pstmt5.setString(2, dto.getOriname());
				pstmt5.setString(3, dto.getSysname());
				result = pstmt5.executeUpdate();
				
				query4 = "SELECT roomNum FROM hotel_GuestRoom WHERE idx=?";
				pstmt4 = conn.prepareStatement(query4);
				pstmt4.setInt(1, Ceodto.getIdx());
				rs = pstmt4.executeQuery();
				int i=0;
				while(rs.next()){
					int idx;
						idx=rs.getInt(1);
						/*for(int i=0; i<roomdata.size(); i++){
*/						query6 = "insert into roomimg value(?,?,?,?)"; //오류난다 
						pstmt6 = conn.prepareStatement(query6);
						pstmt6.setInt(1, Ceodto.getIdx());
						pstmt6.setInt(2, idx);
						pstmt6.setString(3, roomdata.get(i).getSysname());
						pstmt6.setString(4, roomdata.get(i).getOriname());
						result = pstmt6.executeUpdate();
					//}
						i++;
					
				}
				
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt,pstmt2);
			pool.freeConnection(conn,pstmt3,pstmt4);
			pool.freeConnection(conn,pstmt5,pstmt6);
		}
		return result;
	}
	
	
	public Vector<HotelmainimgDTO> hotelmainimg(String ceoids){
		ResultSet rs;
		Vector<HotelmainimgDTO> vhotelimg = new Vector<HotelmainimgDTO>();
		try {
			conn = pool.getConnection();
			String query = "SELECT idx, name, address, roomTypeAmount FROM hotel_info WHERE ceoID= ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ceoids);
			rs = pstmt.executeQuery();
			int ceoidx;
			String hotelname;
			String hoteladdress;
			int roomnum;
			if(rs.next()){
				ceoidx=rs.getInt(1);
				hotelname=rs.getString(2);
				hoteladdress=rs.getString(3);
				roomnum=rs.getInt(4);
				
				String query2 = "SELECT idx, filname FROM hotelimg where idx= ?";
				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setInt(1, ceoidx);
				rs = pstmt2.executeQuery();
				
				if(rs.next()){
					HotelmainimgDTO dto = new HotelmainimgDTO();
					dto.setHotelmainnumber(rs.getInt(1));
					dto.setHotelfilname(rs.getString(2));
					dto.setHotelname(hotelname);
					dto.setHoteladdress(hoteladdress);
					dto.setRoomnum(roomnum);

					vhotelimg.add(dto);
				}
				
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, pstmt2);
		}
		return vhotelimg ;
 	} // 룸 이미지 불러오는 dao
	
	
	public Vector<HotelroomimgDTO> Hotelroomimg(int hotelidx){
		ResultSet rs;
		ResultSet rs2;
		Vector<HotelroomimgDTO> vroomimg = new Vector<HotelroomimgDTO>();
		try {
			conn = pool.getConnection();
			String query ="SELECT * FROM hotel_guestroom WHERE idx= ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hotelidx);
			rs = pstmt.executeQuery();

			while(rs.next()){
				HotelroomimgDTO dto = new HotelroomimgDTO();
				dto.setGuestroomnumber(rs.getInt(1)); // ceo가 생성한 룸 방 번호
				dto.setIdx(rs.getInt(2));
				dto.setRoomType(rs.getString(3));
				dto.setRoomAmount(rs.getInt(4)); // 생성한 룸의 갯수
				dto.setRoomprice(rs.getInt(5));
				dto.setMinGuest(rs.getInt(6));
				dto.setMaxGuest(rs.getInt(7));
				vroomimg.add(dto);
			}
			String query2 = "SELECT hotelnumber, roomnumber, filname FROM roomimg where hotelnumber=?";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setInt(1, hotelidx);
			rs2 = pstmt2.executeQuery();
			
			int j = 0;
			while(rs2.next()){
				HotelroomimgDTO dto = vroomimg.get(j);

				dto.setHotelnumber(rs2.getInt(1));
				dto.setRoomnumber(rs2.getInt(2)); //ceo가 생성한 룸 방 번호
				dto.setFilname(rs2.getString(3));
				
				vroomimg.set(j, dto);
				j++;
			}
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, pstmt2);
		}
		return vroomimg ;
 	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}