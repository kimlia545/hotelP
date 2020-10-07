package hotel.search;

import java.util.Date;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.login.loginvaleuDTO;

public class HTReservationApplyAction implements HotelAction{
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		HttpSession session = request.getSession(false);
		HTSearchDTO searchDto = (HTSearchDTO)session.getAttribute("searchInfo");
		
		request.setCharacterEncoding("euc-kr");
		int hotelIdx = Integer.parseInt(request.getParameter("hotelIdx"));
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		String roomType = request.getParameter("roomType");
		String checkIn = searchDto.getCheckIn();
		String checkOut = searchDto.getCheckOut();
		String userID = request.getParameter("userID");
		String userName = request.getParameter("userName");
		int price = Integer.parseInt(request.getParameter("price"));
		String hotelName = request.getParameter("hotelName");
		
		//예약 다했으면 이 세션은 볼 일이 없다
		session.removeAttribute("searchInfo");
		
		HTSearchDAO dao = new HTSearchDAO();
		dao.addReservationInfo(hotelIdx, roomNum, userName, userID, hotelName, roomType, price, checkIn, checkOut);
		
		forward.setRedirect(false);
		forward.setNextPage("mainpage.do");
		return forward;
	}
}
