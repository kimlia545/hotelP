package hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import hotel.login.ceologinDTO;
import hotel.login.logincodeDTO;
import hotel.login.loginvaleuDTO;
import hotel.mypage.InvitecodeDTO;
import hotel.mypage.RecommendedpersonDTO;
import hotel.mypage.baggageDTO;
import hotel.mypage.incunpickupDTO;
import hotel.mypage.otherDTO;
import hotel.mypage.pickupDTO;

public class HotelDAO {
	private Connection conn; //데이터베이스에 접근하기
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
	private PreparedStatement pstmt4;
	
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	public int Signupinsert(HotelDTO dto){
		//실행 구문
		int result =0;
		int result2 =0;
		ResultSet rs;
		String query ="";
		String query2 ="";
		String query4="";
		Vector<InvitecodeDTO> vDTO = new Vector<InvitecodeDTO>(); 
		try {
			
			conn = pool.getConnection();
			query = "insert into logintb value(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getCodes());
			result = pstmt.executeUpdate();	
			
			//enterprise는 사업자 번호로, 일반 사용자가 회원가입을 했을 시에 들어와선 안되는 정보.
			//그러므로 해당 값이 공백일때는 해당 쿼리를 실행하면 안됩니다.
			if(!dto.getEnterprise().equals("")){
				System.out.println("dPaqud");
				query4 ="insert into hotel_Info value(null,?,null,null,null,null,?)";
				pstmt4 = conn.prepareStatement(query4);
				pstmt4.setString(1,dto.getId());
				pstmt4.setString(2,dto.getEnterprise());
				result = pstmt4.executeUpdate();
			}

			//추천인 코드 처리 쿼리
			query2 = "SELECT id FROM logintb WHERE code=?";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, dto.getInvite());
			rs = pstmt2.executeQuery();
			
			if(rs.next()){
				InvitecodeDTO invitedto =new InvitecodeDTO();
				if((rs.getString(1)!=null)||(rs.getString(1)!="")){
					invitedto.setInviteid(rs.getString(1));
					vDTO.add(invitedto);
					String query3 ="insert into invitetb value(null,?,?,?,now())";
					pstmt3 = conn.prepareStatement(query3);
					pstmt3.setString(1,vDTO.get(0).getInviteid());
					pstmt3.setString(2, dto.getId());
					pstmt3.setString(3, dto.getCodes());
					result = pstmt3.executeUpdate();
				}
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt,pstmt);
			pool.freeConnection(conn,pstmt3,pstmt4);
		}
		return result;
	}
	
	public boolean hotellogin(String id, String pw){ // 로그인 아이디 비밀번호 일치하는지 확인
		HotelDTO dto = new HotelDTO();
 		int result =0; 
		ResultSet rs= null;
		boolean what = false;
		try {
			
			conn = pool.getConnection();
			String query = "select * from logintb where id=? and pw=?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				what = true;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn,pstmt,rs);
		}
		return what;
	}
	public int Selectboolean(String id, String pw){ // 아직 미사용  // 또다른 방법
		String query = "SELECT count(*) FROM logintb where id=? and pw=?";
		ResultSet rs = null;
		int count =0;
		try{
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs = pstmt.executeQuery(query);
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null){
				rs.close();
				}
				if(pstmt!= null){
				pstmt.close();
				}
				if(conn!= null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}
	//기타 문의 
	public int otherinsert(Vector<String> A){
		//실행 구문
		int result =0;
		int result2 =0;
		try {
			conn = pool.getConnection();
			String query = "insert into mypagetotaltb value(null,?,?,'Notprocessed',now())";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, A.get(1));
			pstmt.setString(2, A.get(4));
			result = pstmt.executeUpdate();
			
			
			String query2 = "insert into othertb value(?,?,?,(select idx from mypagetotaltb order by idx desc limit 1))";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, A.get(1));
			pstmt2.setString(2, A.get(2));
			pstmt2.setString(3, A.get(3));
			
			result2 = pstmt2.executeUpdate();
			
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, pstmt2);
		}
		return result ;
	}
	//기타문의 끝
	//현지 공항 픽업 서비스
	public int pickupinsert(Vector<String> A){
			//실행 구문
		int result =0;
		int result2 =0;
		try {
			conn = pool.getConnection();
			
			String query2 = "insert into mypagetotaltb value(null,?,?,'Notprocessed',now())";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, A.get(0));
			pstmt2.setString(2, A.get(14));
			result2 = pstmt2.executeUpdate();
			
			String query = "insert into pickuptb value(?,?,?,?,?,?,?,?,?,?,?,?,?,(select idx from mypagetotaltb order by idx desc limit 1))";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, A.get(1));
			pstmt.setString(2, A.get(2));
			pstmt.setString(3, A.get(3));
			pstmt.setString(4, A.get(4));
			pstmt.setString(5, A.get(5));
			pstmt.setString(6, A.get(6));
			pstmt.setString(7, A.get(7));
			pstmt.setString(8, A.get(8));
			pstmt.setString(9, A.get(9));
			pstmt.setString(10, A.get(10));
			pstmt.setString(11, A.get(11));
			pstmt.setString(12, A.get(12));
			pstmt.setString(13, A.get(13));
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt,pstmt2);
		}
		return result;
	}
	//현지 공항 픽업서비스 끝
	//인천 공항 픽업 서비스
	public int incunpickupinsert(Vector<String> A){
		//실행 구문
	int result =0;
	int result2 =0;
		try {
			conn = pool.getConnection();
			String query2 = "insert into mypagetotaltb value(null,?,?,'Notprocessed',now())";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, A.get(0));
			pstmt2.setString(2, A.get(10));
			result2 = pstmt2.executeUpdate();
			

			String query = "insert into incunpickuptb value(?,?,?,?,?,?,?,?,?,(select idx from mypagetotaltb order by idx desc limit 1))";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, A.get(1));
			pstmt.setString(2, A.get(2));
			pstmt.setString(3, A.get(3));
			pstmt.setString(4, A.get(4));
			pstmt.setString(5, A.get(5));
			pstmt.setString(6, A.get(6));
			pstmt.setString(7, A.get(7));
			pstmt.setString(8, A.get(8));
			pstmt.setString(9, A.get(9));
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, pstmt2);
		}
		return result;
	}
	//인천공항 픽업서비스
	//수하물 배송내용 
	public int baggageinsert(Vector<String> A){
		//실행 구문
		int result =0;
		int result2 =0;
		try {
			conn = pool.getConnection();

			String query2 = "insert into mypagetotaltb value(null,?,?,'Notprocessed',now())";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, A.get(0));
			pstmt2.setString(2, A.get(14));
			result2 = pstmt2.executeUpdate();
			
			String query = "insert into baggagetb value(?,?,?,?,?,?,?,?,?,?,?,?,?,(select idx from mypagetotaltb order by idx desc limit 1))";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, A.get(1));
			pstmt.setString(2, A.get(2));
			pstmt.setString(3, A.get(3));
			pstmt.setString(4, A.get(4));
			pstmt.setString(5, A.get(5));
			pstmt.setString(6, A.get(6));
			pstmt.setString(7, A.get(7));
			pstmt.setString(8, A.get(8));
			pstmt.setString(9, A.get(9));
			pstmt.setString(10, A.get(10));
			pstmt.setString(11, A.get(11));
			pstmt.setString(12, A.get(12));
			pstmt.setString(13, A.get(13));
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt,pstmt2);
		}
		return result;
	}
	
	
	public Vector<HotelDTO> selectmypagetotal(){
		ResultSet rs =null;  //ResultSet 반환해주는 명령어 
		Vector<HotelDTO> v = new Vector<HotelDTO>(); // 모든데이터를 담을 벡터사용
		String query="select * from mypagetotaltb";// sql 명령어 입력
		try {
			try {
				conn = pool.getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pstmt=conn.prepareStatement(query); // 
			
			rs =pstmt.executeQuery();
			
			while(rs.next()){
				HotelDTO dto = new HotelDTO();
				dto.setIdx(rs.getInt(1));
				dto.setType(rs.getString(2));
				dto.setTypeid(rs.getString(3));
				dto.setProcess(rs.getString(4));
				dto.setTime(rs.getString(5));
				
				v.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null){
				rs.close();
				}
				if(pstmt!= null){
				pstmt.close();
				}
				if(conn!= null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}
	public Vector SelectInformation(String type, String idx){ // 아직 미사용  // 또다른 방법
		String query = "select * from "+type+"tb"+ " where idx= ?";		
		ResultSet rs = null;
		Vector<otherDTO> other = new Vector<otherDTO>();
		Vector<pickupDTO> pickup = new Vector<pickupDTO>();
		Vector<incunpickupDTO> incunpickup = new Vector<incunpickupDTO>();
		Vector<baggageDTO> baggage = new Vector<baggageDTO>();
		int count =0;
		System.out.println(type+idx);
		try{
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,Integer.parseInt(idx));
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(type.equals("other")){
					otherDTO dto = new otherDTO();
					dto.setReservation(rs.getString(1));
					dto.setTitle(rs.getString(2));
					dto.setRequests(rs.getString(3));
					other.add(dto);
				}else if(type.equals("pickup")){
					pickupDTO dto = new pickupDTO();
					dto.setReservation(rs.getString(1));
					dto.setPhone(rs.getString(2));
					dto.setPickuppeople(rs.getString(3));
					dto.setTrip(rs.getString(4));
					dto.setArrivedate(rs.getString(5));
					dto.setArrivetime(rs.getString(6));
					dto.setArriveAP(rs.getString(7));
					dto.setArriveAPname(rs.getString(8));
					dto.setStartdate(rs.getString(9));
					dto.setStarttime(rs.getString(10));
					dto.setStartAP(rs.getString(11));
					dto.setStartAPname(rs.getString(12));
					dto.setTextarea(rs.getString(13));
					
					pickup.add(dto);
				}else if(type.equals("incunpickup")){
					incunpickupDTO dto = new incunpickupDTO();
					dto.setReservation(rs.getString(1));
					dto.setCarben(rs.getString(2));
					dto.setStartadd(rs.getString(3));
					dto.setArriveadd(rs.getString(4));
					dto.setReservationdate(rs.getString(5));
					dto.setReservationtime(rs.getString(6));
					dto.setIncunpickuppeople(rs.getString(7));
					dto.setBaggagenum(rs.getString(8));
					dto.setTextarea(rs.getString(9));
					incunpickup.add(dto);
					
				}else if(type.equals("baggage")){
					baggageDTO dto = new baggageDTO();
					dto.setReservation(rs.getString(1));
					dto.setEntrust(rs.getString(2));
					dto.setEntrustadd(rs.getString(3));
					dto.setEntrustdate(rs.getString(4));
					dto.setEntrusttime(rs.getString(5));
					dto.setEntrustphone(rs.getString(6));
					dto.setFind(rs.getString(7));
					dto.setFindadd(rs.getString(8));
					dto.setFinddate(rs.getString(9));
					dto.setFindtime(rs.getString(10));
					dto.setFindphone(rs.getString(11));
					dto.setMainapname(rs.getString(12));
					dto.setTextarea(rs.getString(13));
					baggage.add(dto);
					
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null){
				rs.close();
				}
				if(pstmt!= null){
				pstmt.close();
				}
				if(conn!= null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(type.equals("other")){
			return other;
		}else if(type.equals("pickup")){
			return pickup;
		}else if(type.equals("incunpickup")){
			return incunpickup;
		}else{
			return baggage;
		}
	}
	
	public int QnADeleteData(String idx, String type){
		//실행 구문
		int result =0;
		int result2 =0;
		try {
			conn = pool.getConnection();
			System.out.println(idx);
			System.out.println(type);
			String query = "DELETE FROM "+type+"tb"+" WHERE idx =?"; //DB고장
			pstmt = conn.prepareStatement(query);
			//pstmt.setString(1, type);
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();			
			
			String query2 = "DELETE FROM mypagetotaltb WHERE idx=?";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, idx);
			result2 = pstmt2.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, pstmt2);
		}
		return result ;
	}
	
	public int logindate(String pw, String phone, String email, String id){ 
		String query="";
		/*Connection conn =null;*/
		int rs = 0;
		int count =0;
		try{
			System.out.println(pw+phone+email+id);
			query = "UPDATE logintb SET pw=?, phone=?, email=? WHERE id=?";
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,pw);
			pstmt.setString(2,phone);
			pstmt.setString(3,email);
			pstmt.setString(4,id);
			rs = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt);
		}
		return count;
	}
	
	public loginvaleuDTO selectlogin(String id){ 
		String query="";
		Connection con =null;
		ResultSet rs = null;
		loginvaleuDTO logindto = new loginvaleuDTO();
		int count =0;
		try{
			
			query = "select * from logintb WHERE id =?";
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				logindto.setId(rs.getString(1));
				logindto.setPw(rs.getString(2));
				logindto.setName(rs.getString(3));
				logindto.setPhone(rs.getString(4));
				logindto.setEmail(rs.getString(5));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null){
				rs.close();
				}
				if(pstmt!= null){
				pstmt.close();
				}
				if(conn!= null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return logindto;
	}
	
	public  Vector<logincodeDTO> selectcode(){ 
		String query="";
	/*	Connection conn =null;*/
		ResultSet rs = null;
		Vector<logincodeDTO> codedate = new Vector<logincodeDTO>();
		int count =0;
		try{
			
			query = "select code from logintb";
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);			
			rs =pstmt.executeQuery();
			
			while(rs.next()){
				logincodeDTO codedto = new logincodeDTO();
				codedto.setCodes(rs.getString(1));
				codedate.add(codedto);
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null){
				rs.close();
				}
				if(pstmt!= null){
				pstmt.close();
				}
				if(conn!= null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return codedate;
	}
	
	public Vector<RecommendedpersonDTO> Recommendedselect(String id){
		ResultSet rs =null; 
		ResultSet rs2 =null;//ResultSet 반환해주는 명령어 
		Vector<RecommendedpersonDTO> rdto = new Vector<RecommendedpersonDTO>(); // 모든데이터를 담을 벡터사용
		// sql 명령어 입력
		
		try {
				conn = pool.getConnection();
				String query="SELECT * FROM invitetb WHERE invite=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);

				String query2="select code from logintb where id=?";
				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, id);
				
			rs2= pstmt2.executeQuery();
			if(rs2.next()){
				RecommendedpersonDTO dto = new RecommendedpersonDTO();
				dto.setCodes(rs2.getString(1));
				rdto.add(dto);
			}
			
			rs =pstmt.executeQuery();
			
			while(rs.next()){
				RecommendedpersonDTO dto = new RecommendedpersonDTO();
				dto.setRecommendedin(rs.getString(2));
				dto.setRecommendedout(rs.getString(3));
				dto.setTime(rs.getString(5));
				rdto.add(dto);
			}
			
			System.out.println(rdto);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null){
				rs.close();
				}
				if(pstmt!= null){
				pstmt.close();
				}
				if(conn!= null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rdto;
	}
	
	public int loginidfineId(String id){
		int result = 0;
		ResultSet rs;
		try {
			String sql = "select count(*) from "
					+ "logintb where id=?";
			try {
				conn = pool.getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(pstmt!= null){
				pstmt.close();
				}
				if(conn!= null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int invitefineId(String invite){
		int result = 0;
		ResultSet rs;
		try {
			String sql = "select count(*) from "+"logintb where code=?";
			try {
				conn = pool.getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, invite);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(pstmt!= null){
				pstmt.close();
				}
				if(conn!= null){
				conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
		return result;
	}
	
	public ceologinDTO ceoselect(String id){
		//실행 구문
		ceologinDTO dto = new ceologinDTO();
		ResultSet rs;
		String query ="";
		try {
			conn = pool.getConnection();
			query = "SELECT ceoID FROM hotel_Info WHERE ceoID=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setCeoID(rs.getString(1));
				
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt);
			
		}
		return dto;
	}
	
	
}
	//수하물배송내용 끝