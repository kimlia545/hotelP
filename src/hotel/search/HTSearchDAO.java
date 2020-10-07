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
		
		//üũ�� ��¥���� üũ�ƿ� ��¥���� ���������� ��ȸ�ϱ� ����
		//��¥ ������ ���� SimpledataFormat ���� 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		try {
			Date beginDate = dateFormat.parse(checkIn);
			Date endDate = dateFormat.parse(checkOut);
			
			long calDate = endDate.getTime() - beginDate.getTime();
			long calDateDays = calDate / (24*60*60*1000);
			calDateDays = Math.abs(calDateDays);
			
			//��¥ ���ϱ� ����� ���� ����ϴ� Ŭ����
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			//������ �Ǵ� ��¥�� �����Ѵ�
			cal.setTime(beginDate);

			// üũ�ƿ��� ���̳��� ��¥��ŭ �����Ѵ�. (üũ�ƿ��� ������ ����: üũ�ƿ� �� ���� �ٸ� ����� üũ�� �� �� ����)
			for(int i = 0; i<calDateDays; i++){
				//��¥�� �����ش�. 0���� ���̳��� ��¥��ŭ �Ϸ羿 ����
				if(i != 0)
					cal.add(Calendar.DAY_OF_YEAR, 1);
				else if(i == 0)
					cal.add(Calendar.DAY_OF_YEAR, 0);
				
				//DateŸ�� ������ String���� ��ȯ�Ѵ�
				String strDate = dateFormat.format(cal.getTime());
				
				Vector<Integer> tempV = findEmptyRoom(strDate);
				for(int j=0; j<tempV.size(); j++){
					//���⼭ ��� exceptionRoomNumVector�� �˻��� ��¥ �� ������ �Ұ����� ���� �����س���.
					//���� �������� �� ���Ϳ� ��� ���� �˻�������� �ɷ��ش�.
					exceptionRoomNumVector.add(tempV.get(j));
				}
				

			}

		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		
		//������ �� ��ȣ�� �������� ���� �����ϱ� ���� �ӽ� String Ÿ�� ����
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
			
			System.out.println("������ġ����: " + pstmt);
			
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
		
		//��¥�� �Է��ϸ� �ش� ��¥�� ����Ǿ��ִ� ���� ��ϰ� ����� ���� ������ �����ϴ� ����
		String rvQuery = "SELECT roomNum, COUNT(roomNum) FROM hotel_reservationlist WHERE rvDate=? GROUP BY roomNum HAVING COUNT(roomNum)";
		//�� ���� �������� ����� ������ �ִ� ���� ������ �޾ƿ��� ����
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
					
					//���� ���ȣ����, ���� �� ����츦 return�޾� ���Ϳ� �����Ѵ�.
					//�ش� ���Ϳ� ����ִ� ���ȣ�� ���Ե� ȣ���� �˻�������� ������ �� = �̹� ������ �ִ� ��
					if(rvdto.getRoomNum() == roomdto.getRoomNum() && rvdto.getAmount() >= roomdto.getAmount()){
						v.add(roomdto.getRoomNum());
						System.out.println("���� �Ϸ�� ��: " + roomdto.getRoomNum());
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
	
	//��ġ�ϰ� ȣ�ڸ�� �ҷ��ö� �Ϻ� ���� ������ �ʿ��ϹǷ� �ش� ��� ���� ó���� ���� �޼ҵ�
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
			
			while(rs.next()){//���� �������� �����ö��� while�� �� ���ؼ� Vector�� dto�� add ���ش�.
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
	
	//idx�� ���� ȣ���� ��� ���� ����
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
	
	//�� ��ȣ �޾ƿ��� �� ���� ��� ������ ����
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
	
	//������ id�� �ش� ������ ��� ���� �о���� 
	//�� ��ȣ �޾ƿ��� �� ���� ��� ������ ����
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
	
	//���� ���̺� ���� ���
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
			
			//üũ�� ��¥���� üũ�ƿ� ��¥���� ���������� ��ȸ�ϱ� ����
			//��¥ ������ ���� SimpledataFormat ���� 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			try {
				Date beginDate = dateFormat.parse(checkIn);
				Date endDate = dateFormat.parse(checkOut);
				
				long calDate = endDate.getTime() - beginDate.getTime();
				long calDateDays = calDate / (24*60*60*1000);
				calDateDays = Math.abs(calDateDays);
				
				//��¥ ���ϱ� ����� ���� ����ϴ� Ŭ����
				Calendar cal = new GregorianCalendar(Locale.KOREA);
				//������ �Ǵ� ��¥�� �����Ѵ�
				cal.setTime(beginDate);

				// üũ�ƿ��� ���̳��� ��¥��ŭ �����Ѵ�. (üũ�ƿ��� ������ ����: üũ�ƿ� �� ���� �ٸ� ����� üũ�� �� �� ����)
				for(int i = 0; i<calDateDays; i++){
					//��¥�� �����ش�. 0���� ���̳��� ��¥��ŭ �Ϸ羿 ����
					if(i != 0)
						cal.add(Calendar.DAY_OF_YEAR, 1);
					else if(i == 0)
						cal.add(Calendar.DAY_OF_YEAR, 0);
					
					//DateŸ�� ������ String���� ��ȯ�Ѵ�
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

