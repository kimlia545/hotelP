package hotel.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.HotelDAO;

public class sumloginaction implements HotelAction {

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		HotelDAO dao= new HotelDAO();
		dao.logindate(pw, phone, email, id);
		
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(true);
		forward.setNextPage("mypagemain.jsp");
		return forward;
		
	}

}
