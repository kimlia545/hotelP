package hotel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hotelmain implements HotelAction { //메인으로 간다.

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(true);
		forward.setNextPage("mainpage.jsp");
		return forward;
	}

}
