package hotel.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;

public class mypage implements HotelAction { //������������ �̵�

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(true);
		forward.setNextPage("mypagemain.jsp");
		return forward;
		
	}

}
