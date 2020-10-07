package hotel.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;

public class reviewDeleteAction implements HotelAction{

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// ���� ����

		
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		System.out.println("rvNum : "+rvNum);
		
		HTReviewDAO dao = new HTReviewDAO();
		dao.reviewDelete(rvNum);
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false); //true�� ���� �� �ѱ�� insert�� �׿ܴ� false
		forward.setNextPage("historypage.do");
		
		System.out.println("���� ����");
		
		return forward;
		
	}

}


