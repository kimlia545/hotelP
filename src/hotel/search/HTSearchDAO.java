package hotel.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.Vector;


import hotel.DBConnectionMgr;
import hotel.login.loginvaleuDTO;

public class HTSearchDAO {
	private Connection conn;
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	
	public Vector<HTDataDTO> searchHotel(String location, String checkIn, String checkOut, String personnel){
		Vector<HTDataDTO> v = new Vector<HTDataDTO>();
		Vector<Integer> exceptionRoomNumVector = new Vector<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//체크인 날짜부터 체크아웃 날짜까지 예약정보를 조회하기 위해
		//날짜 연산을 위한 SimpledataFormat 선언 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		try {
			Date beginDate = dateFormat.parse(checkIn);
			Date endDate = dateFormat.parse(checkOut);
			
			long calDate = endDate.getTime() - beginDate.getTime();
			long calDateDays = calDate / (24*60*60*1000);
			calDateDays = Math.abs(calDateDays);
			
			//날짜 더하기 계산을 위해 사용하는 클래스
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			//기준이 되는 날짜를 세팅한다
			cal.setTime(beginDate);

			// 체크아웃과 차이나는 날짜만큼 실행한다. (체크아웃날 당일은 제외: 체크아웃 한 날에 다른 사람이 체크인 할 수 있음)
			for(int i = 0; i<calDateDays; i++){
				//날짜를 더해준다. 0부터 차이나는 날짜만큼 하루씩 더함
				if(i != 0)
					cal.add(Calendar.DAY_OF_YEAR, 1);
				else if(i == 0)
					cal.add(Calendar.DAY_OF_YEAR, 0);
				
				//Date타입 변수를 String으로 변환한다
				String strDate = dateFormat.format(cal.getTime());
				
				Vector<Integer> tempV = findEmptyRoom(strDate);
				for(int j=0; j<tempV.size(); j++){
					//여기서 담긴 exceptionRoomNumVector는 검색한 날짜 중 예약이 불가능한 방을 추출해낸다.
					//이후 쿼리에서 이 벡터에 담긴 방은 검색결과에서 걸러준다.
					exceptionRoomNumVector.add(tempV.get(j));
				}
				

			}

		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		
		//제외한 방 번호를 쿼리에서 직접 제거하기 위해 임시 String 타입 선언
		String roomNumQuery = "";
		for(int i=0; i<exceptionRoomNumVector.size(); i++){
			roomNumQuery = roomNumQuery + " AND roomNum != " + exceptionRoomNumVector.get(i);
			//AND roomNum != 1 AND roomNum != 2 ...
		}
		
		String query1 = "SELECT * FROM hotel_info WHERE address LIKE ? AND idx = ANY (SELECT idx FROM hotel_guestroom WHERE minGuest <= ? AND maxGuest >= ? " + roomNumQuery + ")";
		//String query1 = "SELECT * FROM hotel_info WHERE address=? AND idx = ANY (SELECT idx FROM hotel_guestroom WHERE minGuest <= ? AND maxGuest >= ? " + roomNumQuery + ")";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query1);
			pstmt.setString(1, location);
			pstmt.setString(2, personnel);
			pstmt.setString(3, personnel);
			
			rs = pstmt.executeQuery();
			
			System.out.println("최종서치쿼리: " + pstmt);
			
			while(rs.next()){
				HTDataDTO dto = new HTDataDTO();

				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setAddress(rs.getString(4));
				dto.setGrade(rs.getInt(5));
				dto.setExceptRoom(exceptionRoomNumVector);
				
				v.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return v;
	}//searchHotel END
	
	
	public Vector<Integer> findEmptyRoom(String date){
		Vector<Integer> v = new Vector<Integer>();
		
		PreparedStatement rvPstmt = null;
		PreparedStatement roomPstmt = null;
		ResultSet rvRs = null;
		ResultSet roomRs = null;
		
		//날짜를 입력하면 해당 날짜에 예약되어있는 방의 목록과 예약된 방의 갯수를 리턴하는 쿼리
		String rvQuery = "SELECT roomNum, COUNT(roomNum) FROM hotel_reservationlist WHERE rvDate=? GROUP BY roomNum HAVING COUNT(roomNum)";
		//↑ 위의 쿼리에서 예약된 내역이 있는 방의 갯수를 받아오는 쿼리
		String roomQuery = "SELECT roomNum, roomAmount FROM hotel_guestroom WHERE roomNum = ANY (SELECT roomNum FROM hotel_reservationlist WHERE rvDate=? GROUP BY roomNum HAVING COUNT(roomNum))";
		
		try {
			conn = pool.getConnection();
			rvPstmt = conn.prepareStatement(rvQuery);
			rvPstmt.setString(1, date);
			rvRs = rvPstmt.executeQuery();
			
			roomPstmt = conn.prepareStatement(roomQuery);
			roomPstmt.setString(1, date);
			roomRs = roomPstmt.executeQuery();
			
			while(rvRs.next()){
				
				HTReservedRoomTempDTO rvdto = new HTReservedRoomTempDTO();
				HTReservedRoomTempDTO roomdto = new HTReservedRoomTempDTO();
				
				rvdto.setRoomNum(rvRs.getInt(1));
				rvdto.setAmount(rvRs.getInt(2));
						
				if(roomRs.next()){
					roomdto.setRoomNum(roomRs.getInt(1));
					roomdto.setAmount(roomRs.getInt(2));
					
					//현재 방번호에서, 예약 다 찬경우를 return받아 벡터에 저장한다.
					//해당 벡터에 들어있는 룸번호가 포함된 호텔은 검색결과에서 제외할 것 = 이미 예약이 있는 방
					if(rvdto.getRoomNum() == roomdto.getRoomNum() && rvdto.getAmount() >= roomdto.getAmount()){
						v.add(roomdto.getRoomNum());
						System.out.println("예약 완료된 방: " + roomdto.getRoomNum());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, rvPstmt, rvRs);
			pool.freeConnection(conn, roomPstmt, roomRs);
		}
		return v;
	}
	
	//서치하고 호텔목록 불러올때 일부 객실 정보도 필요하므로 해당 기능 수행 처리를 위한 메소드
	public Vector<HTRoomDataDTO> roomOptionSelect(int idx){
		Vector<HTRoomDataDTO> v = new Vector<HTRoomDataDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String query = "SELECT * FROM hotel_guestroom WHERE idx=?";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()){//값이 여러개를 가져올때는 while문 을 통해서 Vector에 dto를 add 해준다.
				HTRoomDataDTO dto = new HTRoomDataDTO();
				dto.setRoomNum(rs.getInt(1));
				dto.setIdx(rs.getInt(2));
				dto.setRoomType(rs.getString(3));
				dto.setRoomAmount(rs.getInt(4));
				dto.setRoomPrice(rs.getInt(5));
				dto.setMinGuest(rs.getInt(6));
				dto.setMaxGuest(rs.getInt(7));
				
				v.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return v;
	}
	
	//idx를 통해 호텔의 모든 정보 선택
	public HTDataDTO selectHotelInfo(int idx){
		HTDataDTO dto = new HTDataDTO();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String query = "SELECT * FROM hotel_info WHERE idx=?";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setAddress(rs.getString(4));
				dto.setGrade(rs.getInt(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return dto;
	}
	
	//방 번호 받아오면 그 방의 모든 정보를 선택
	public HTRoomDataDTO selectRoomInfo(int roomNum){
		HTRoomDataDTO dto = new HTRoomDataDTO();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM hotel_guestroom WHERE roomNum=?";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setRoomNum(rs.getInt(1));
				dto.setIdx(rs.getInt(2));
				dto.setRoomType(rs.getString(3));
				dto.setRoomAmount(rs.getInt(4));
				dto.setRoomPrice(rs.getInt(5));
				dto.setMinGuest(rs.getInt(6));
				dto.setMaxGuest(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return dto;
	}
	
	//유저의 id로 해당 유저의 모든 정보 읽어오기 
	//방 번호 받아오면 그 방의 모든 정보를 선택
	public loginvaleuDTO selectUserInfo(String userID){
		loginvaleuDTO dto = new loginvaleuDTO();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM logintb WHERE id=?";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setId(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setEmail(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return dto;
	}
	
	//예약 테이블에 직접 등록
	public int addReservationInfo(int hotelIdx, int roomNum, String userName, String userID, String hotelName, String roomType, int price, String checkIn, String checkOut){
		int result = 0;
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		String query = "INSERT INTO hotel_reservation VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hotelIdx);
			pstmt.setInt(2, roomNum);
			pstmt.setString(3, userName);
			pstmt.setString(4, userID);
			pstmt.setString(5, hotelName);
			pstmt.setString(6, roomType);
			pstmt.setInt(7, price);
			pstmt.setString(8, checkIn);
			pstmt.setString(9, checkOut);
			result = pstmt.executeUpdate();	
			
			//체크인 날짜부터 체크아웃 날짜까지 예약정보를 조회하기 위해
			//날짜 연산을 위한 SimpledataFormat 선언 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			try {
				Date beginDate = dateFormat.parse(checkIn);
				Date endDate = dateFormat.parse(checkOut);
				
				long calDate = endDate.getTime() - beginDate.getTime();
				long calDateDays = calDate / (24*60*60*1000);
				calDateDays = Math.abs(calDateDays);
				
				//날짜 더하기 계산을 위해 사용하는 클래스
				Calendar cal = new GregorianCalendar(Locale.KOREA);
				//기준이 되는 날짜를 세팅한다
				cal.setTime(beginDate);

				// 체크아웃과 차이나는 날짜만큼 실행한다. (체크아웃날 당일은 제외: 체크아웃 한 날에 다른 사람이 체크인 할 수 있음)
				for(int i = 0; i<calDateDays; i++){
					//날짜를 더해준다. 0부터 차이나는 날짜만큼 하루씩 더함
					if(i != 0)
						cal.add(Calendar.DAY_OF_YEAR, 1);
					else if(i == 0)
						cal.add(Calendar.DAY_OF_YEAR, 0);
					
					//Date타입 변수를 String으로 변환한다
					String strDate = dateFormat.format(cal.getTime());
					
					String query2 = "insert into hotel_reservationlist value(?,?,?)";
					pstmt2 = conn.prepareStatement(query2);
					pstmt2.setInt(1, hotelIdx);
					pstmt2.setInt(2, roomNum);
					pstmt2.setString(3, strDate);
					
					result = pstmt2.executeUpdate();	
				}

			} catch (ParseException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
			pool.freeConnection(conn, pstmt2, rs);
		}
		return result;
	}
	
}//class END

