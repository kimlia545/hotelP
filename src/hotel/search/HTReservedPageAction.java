package hotel.search;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.login.loginvaleuDTO;
//상세페이지에서 예약 페이지로 이동
public class HTReservedPageAction implements HotelAction{
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		
		request.setCharacterEncoding("euc-kr");
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		int idx = Integer.parseInt(request.getParameter("hotelIndex"));
		String userID = request.getParameter("userID");
		
		HTSearchDAO dao = new HTSearchDAO();
		
		//호텔의 이름/주소/평점
		HTDataDTO hotelDto = dao.selectHotelInfo(idx);
		//호텔 객실에 대한 정보
		HTRoomDataDTO roomlDto = dao.selectRoomInfo(roomNum);
		//유저에 대한 정보
		loginvaleuDTO userDto = dao.selectUserInfo(userID);
		
		request.setAttribute("hotelData", hotelDto);
		request.setAttribute("roomData", roomlDto);
		request.setAttribute("userData", userDto);
		
		forward.setNextPage("reservationPage.jsp");
		
		
		HttpSession session = request.getSession(false);
		HTSearchDTO searchDto = (HTSearchDTO)session.getAttribute("searchInfo");
		System.out.println(searchDto);
		return forward;
		}
}
