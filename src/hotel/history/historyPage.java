package hotel.history;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.review.HTHistoryDAO;
import hotel.review.HTHistoryDTO;

public class historyPage implements HotelAction{
	
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		System.out.println("11111111111111");
		//예약 내역에 예약정보 값 출력
		
		//String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userid");
		System.out.println("22222222222222222222222222222");
		System.out.println(id);
		
		//myHistoryselectAll메소드를 이용하여 벡터에 해당id의 모든 예약내역을 저장한다.
		HTHistoryDAO dao = new HTHistoryDAO();
		Vector<HTHistoryDTO> v = dao.myHistoryselectAll(id);
		System.out.println("333333333333333333333");
		//다음페이지에 예약내역이 담긴 벡터를 보내준다.
		request.setAttribute("myRv", v);
		
	
/*		HTRivewDAO rdao = new HTReviewDAO();
		HTReviewDTO = dao.getrvNUM(rvNum);*/
		
		
		//다음페이지로 넘겨줍니다.
		forward.setRedirect(false);
		forward.setNextPage("history.jsp");
		return forward;
	}

}
