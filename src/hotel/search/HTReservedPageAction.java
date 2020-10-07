package hotel.search;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.login.loginvaleuDTO;
//������������ ���� �������� �̵�
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
		
		//ȣ���� �̸�/�ּ�/����
		HTDataDTO hotelDto = dao.selectHotelInfo(idx);
		//ȣ�� ���ǿ� ���� ����
		HTRoomDataDTO roomlDto = dao.selectRoomInfo(roomNum);
		//������ ���� ����
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
