package hotel.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import hotel.DBConnectionMgr;


public class HTReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private Connection conn2;
	private PreparedStatement pstmt2;
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	//리뷰 작성 시 insert
	public int reviewWrite(HTReviewDTO dto,int rvNum){
		
		int result = 0;
		int result2 = 0;
		try{
			conn = pool.getConnection();
			String query = "INSERT INTO hotel_review VALUES(null,null,?,?,NOW(),?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setFloat(3, dto.getGrade());
			pstmt.setString(4,  dto.getId());
			pstmt.setInt(5,  dto.getRvNum());
			result = pstmt.executeUpdate();
			
			/*리뷰를 쓸때 같이 rvNum에 값을 넣고 reviewWrite boolean 타입을 0을 1로 바꿔준다*/
			conn2 = pool.getConnection();
			String query2 = "UPDATE hotel_reservation SET reviewWrite = 1 WHERE rvNum IN (SELECT rvNum FROM hotel_review WHERE rvNum =?)";
			 pstmt2 =  conn2.prepareStatement(query2);
			 pstmt2.setInt(1, rvNum);
			 
			 result2 = pstmt2.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn,pstmt);
			pool.freeConnection(conn2,pstmt2);
		}
		return result+result2;
		/*result result2 는 한개만 되면 1 두 개 다 맞으면 2 두개 다 안되면 0*/
	}

	//리뷰 댓글 작성 시 insert 
	public int reviewWrite_re(String reviewNum_re, String title, String content){
		String query = "INSERT INTO hotel_review VALUES (NULL, ?, ?, ?, NOW(),null,null)";

		int result = 0;
		
		try{
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, reviewNum_re);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			
			result = pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
		return result;
	}//일반 방명록에 대한 덧글 join END
	
	
	
	//모두 로드하기 리뷰 목록 
	public Vector selectAll(){
		ResultSet rs = null;
		String query = "SELECT * FROM hotel_review";
		Vector<HTReviewDTO> v = new Vector<HTReviewDTO>();
			
		try {
			conn = pool.getConnection();
			pstmt=conn.prepareStatement(query);
			rs = pstmt.executeQuery();
				
			while(rs.next()){				
				HTReviewDTO dto = new HTReviewDTO();
				dto.setReviewNum(rs.getInt(1));
				dto.setReviewNum_re(rs.getInt(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setWdate(rs.getString(5));
				dto.setGrade(rs.getFloat(6));
				dto.setId(rs.getString(7));
				dto.setRvNum(rs.getInt(8));
					
				v.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return v;
	}  //selectAll END
	
	
	//모두 로드하기 나의 내 리뷰 목록 
		public Vector selectMine(String id){
			ResultSet rs = null;
			String query = "SELECT * FROM hotel_review where id =?";
			Vector<HTReviewDTO> v = new Vector<HTReviewDTO>();
				
			try {
				conn = pool.getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
					
				while(rs.next()){				
					HTReviewDTO dto = new HTReviewDTO();
					dto.setReviewNum(rs.getInt(1));
					dto.setReviewNum_re(rs.getInt(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setWdate(rs.getString(5));
					dto.setGrade(rs.getFloat(6));
					dto.setId(rs.getString(7));
					dto.setRvNum(rs.getInt(8));
					
					v.add(dto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			} finally{
				pool.freeConnection(conn, pstmt, rs);
			}
			return v;
		}  //selectMine END

		
		//rvNum 값으로 내가 클릭한 리뷰정보만 가져오기
		public Vector getmyreview(int rvNum){
			ResultSet rs = null;
			String query = "select * from hotel_review where rvNum=? ";
			Vector<HTReviewDTO> v = new Vector<HTReviewDTO>();
			
			try {
				conn = pool.getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1,rvNum);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					HTReviewDTO dto = new HTReviewDTO();
					dto.setRvNum(rs.getInt("rvNum"));
					dto.setReviewNum(rs.getInt("reviewNum"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setGrade(rs.getFloat("grade"));
					dto.setId(rs.getString("id"));
					dto.setRvNum(rs.getInt("rvNum"));
					
					v.add(dto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			} finally{
				pool.freeConnection(conn, pstmt, rs);
			}
			return v;
			} //getmyreview END		
	

		

		//수정 시, 수정할 내용을 가져옴
		public Vector getSelectrvNum(int rvNum){
			Vector<HTReviewDTO> v = new Vector<HTReviewDTO>();
			ResultSet rs = null;
			String query = "SELECT * FROM hotel_review WHERE rvNum=?";
			
			try {
				conn = pool.getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1,rvNum);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					HTReviewDTO dto = new HTReviewDTO();
					dto.setReviewNum(rs.getInt(1));
					dto.setReviewNum_re(rs.getInt(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setWdate(rs.getDate(5)+"");
					dto.setGrade(rs.getFloat(6));
					dto.setId(rs.getString(7));
					dto.setRvNum(rs.getInt(8));
				}
			}catch (Exception e) {
				e.printStackTrace();
			} finally{
				pool.freeConnection(conn, pstmt, rs);
			}
			return v;
		} //getSelectreviewNum END

	//update 내용 수정
	public int reviewUpdate(int rvNum, String title,String content,float grade){
		String query = "UPDATE hotel_review set title=?,content=?,grade=? where rvNum=?";
		int result=0;
		try{
			conn=pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setFloat(3, grade);
			pstmt.setInt(4, rvNum);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt);
		}
		return result;	
	}//수정 끝
	
	//삭제 리뷰 삭제
	public int reviewDelete(int rvNum){
		int result2 =0;
		int result=0;
		
		try{//reviewWrite boolean 값을 0으로 바꿔서 리뷰보기 버튼이 리뷰쓰기로 바뀌게 된다
			conn2 = pool.getConnection();
			String query2 = "UPDATE hotel_reservation SET reviewWrite = 0 WHERE rvNum IN (SELECT rvNum FROM hotel_review WHERE rvNum =?)";
			pstmt2 = conn2.prepareStatement(query2);
			pstmt2.setInt(1, rvNum);
			result2 = pstmt2.executeUpdate();
					
			conn=pool.getConnection();
			String query = "delete from hotel_review where rvNum=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rvNum);
				result = pstmt.executeUpdate();
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(conn2,pstmt2);
				pool.freeConnection(conn, pstmt);
				
			}
			return result2+result;
		}
}



/*
//rvNum 값을 가져와서 reviewNum을 통해 리뷰 내용을 화면출력
		public Vector getMyReview(int rvNum){
			ResultSet rs = null;
			String query = "select revivewNum from hotel_review where rvNum=? ";
			Vector<HTReviewDTO> v = new Vector<HTReviewDTO>();
			
			try {
				conn = pool.getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1,rvNum);
				rs = pstmt.executeQuery();
			
			while(rs.next()){				
				HTReviewDTO dto = new HTReviewDTO();
				dto.setReviewNum(rs.getInt("reviewNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setGrade(rs.getFloat("grade"));
				dto.setId(rs.getString("id"));
				dto.setRvNum(rs.getInt("rvNum"));
		
					
				v.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return v;
		} //getreview END



		
		//rvNum 값으로 reviewNum 값 가져오기
		public HTReviewDTO getreviewNum(int reviewNum){
			ResultSet rs = null;
			String query = "select reviewNum from hotel_review where rvNum=? ";
			HTReviewDTO dto = new HTReviewDTO();
			
			try {
				conn = pool.getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1,reviewNum);
				rs = pstmt.executeQuery();
			
			if(rs.next()){				
				dto.setReviewNum(rs.getInt("reviewNum"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return dto;
		} //getrvNum END
		


*/

