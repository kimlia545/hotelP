package hotel.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;

public class reviewDeleteAction implements HotelAction{

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 리뷰 삭제

		
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		System.out.println("rvNum : "+rvNum);
		
		HTReviewDAO dao = new HTReviewDAO();
		dao.reviewDelete(rvNum);
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false); //true면 값을 안 넘기고 insert때 그외는 false
		forward.setNextPage("historypage.do");
		
		System.out.println("리뷰 삭제");
		
		return forward;
		
	}

}


