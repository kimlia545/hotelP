package hotel.history;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.review.HTHistoryDAO;
import hotel.review.HTHistoryDTO;



public class historyPageproc implements HotelAction{
	
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		
		//예약페이지 내용을 리뷰쓰기에 출력
	
		
		System.out.println("rvNum : "+(request.getParameter("rvNum")));
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		
		//myHistoryselectAll메소드를 이용하여 내가 클릭한 구매내역 값만 받아온다
		HTHistoryDAO dao = new HTHistoryDAO();
		Vector<HTHistoryDTO> v = dao.selecthistory(rvNum);
		
		//다음페이지에 예약내역이 담긴 벡터를 보내준다. rvNum
		request.setAttribute("myRv", v);
		request.setAttribute("rvNum", rvNum);
		
		//다음페이지로 넘겨줍니다.
		forward.setRedirect(false);
		forward.setNextPage("review.jsp");
		return forward;
		

		}
	}

		//수정 버튼을 눌렀을 때 사용됨 내가 쓴 리뷰 내용 불러오기
		/*	리뷰를 쓴 이후 내 리뷰를 열람하고자 할때
		db에서 내가 쓴 리뷰를 찾기
		rvNum을 통해서 
		reviewNum 값을 가져와서
		reviewUpdate.jsp 에서 리뷰 내용 제목이 출력
		
		1.리뷰를 쓰고 나서 history.jsp에서 reviewNum값을 가지고 있어서 수정버튼 누를때 rvNum과 같이 넘기기
		history.java에서 reviewNum 값을 가져와서 history.jsp에 값 나오게
		그리고 history.jsp에서 reviewNum 값 넘기기
		
		2.리뷰 수정버튼 누를때 rvNum을 통해서 reviewUpdate.java 에서 reviewNum 값 가져와서 review.jsp에 띄우기
		
		리뷰와 예약내역을 띄워야함 review.jsp 
		
		rvNum 쿼리 2문장
		리뷰와 예약내역을 출력하기
		
		*/
		/*mypage.jsp->예약내역(historypage.do)<id값들고가기>->historypage.java->history.jsp
		 * history.jsp(리뷰쓰기버튼)<rvNum값들고가기>->historyPageproc.do->historypageproc.java->review.jsp->reviewPageproc.do->reviewpageproc.java(historypage.do)->historypage.java->
		 * 
		 * 
		 * history.jsp(리뷰보기버튼)<rvNum값들고가기>->reviewUpdate.do->reviewUpdate.java->reviewUpdate.jsp(수정버튼)->reviewUpdateAction.do->historypage.do
		 * reviewUpdate.jsp(삭제버튼)->reviewDeleteAction.do->historypage.do
		 * hotel_review DB 파일에 rvNum 
		 * hotel_reservation rvNum 
		 * 추가 예약번호와 같은지 비교 예약한 값에 리뷰 
		 * -> */
		 