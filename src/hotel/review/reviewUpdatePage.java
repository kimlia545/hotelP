package hotel.review;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.HotelAction;
import hotel.HotelActionF;


public class reviewUpdatePage  implements HotelAction {
	
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//리뷰 내용 불러오기
		
		HotelActionF forward = new HotelActionF();//값을 가져와서 자바를 하고 jsp파일에 뿌린다
			String id = request.getParameter("id");
			HTReviewDAO dao = new HTReviewDAO(); 
			Vector<HTReviewDTO> v = dao.selectMine("id");
		    request.setAttribute("info", v); 
			forward.setRedirect(false);
			forward.setNextPage("historypage.do");
		return forward;
	}

}