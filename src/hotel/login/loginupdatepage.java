package hotel.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.HotelDAO;

public class loginupdatepage implements HotelAction {

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(true);
		forward.setNextPage("loginvalueupdatepage.jsp");
		return forward;
		
	}

}
