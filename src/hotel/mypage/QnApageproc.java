package hotel.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;

public class QnApageproc implements HotelAction { // QnA�� �ۼ��ϴ°����� �̵�

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(true);
		forward.setNextPage("QnA.jsp");
		return forward;
	}

}
