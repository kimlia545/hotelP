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
		
		//���� ���� �ҷ�����
		
		HotelActionF forward = new HotelActionF();//���� �����ͼ� �ڹٸ� �ϰ� jsp���Ͽ� �Ѹ���
			String id = request.getParameter("id");
			HTReviewDAO dao = new HTReviewDAO(); 
			Vector<HTReviewDTO> v = dao.selectMine("id");
		    request.setAttribute("info", v); 
			forward.setRedirect(false);
			forward.setNextPage("historypage.do");
		return forward;
	}

}