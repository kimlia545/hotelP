package hotel.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;

public class PwChangeAction implements HotelAction{

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw1");
		
		PwChangeDAO dao = new PwChangeDAO();
		
		int re = dao.changePw(id, pw);
		
		forward.setRedirect(true);
		forward.setNextPage("changeEnd.jsp");
		return forward;
	}

}
