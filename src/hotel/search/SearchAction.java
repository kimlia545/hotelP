package hotel.search;

import hotel.*;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class SearchAction implements HotelAction {

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		HttpSession session = request.getSession(false);
		
		request.setCharacterEncoding("euc-kr");
		String location = request.getParameter("location");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String personnel = request.getParameter("personnel");
		
		//location�� ���Ե� ��� ���� ã�� ���� String�� ����
		location = "%" + location + "%";
		
		HTSearchDAO dao = new HTSearchDAO();
		Vector<HTDataDTO> v = dao.searchHotel(location, checkIn, checkOut, personnel);
		
		//��ġ���
		HTSearchDTO searchDto = new HTSearchDTO();
		searchDto.setLocation(location);
		searchDto.setCheckIn(checkIn);
		searchDto.setCheckOut(checkOut);
		searchDto.setNum(personnel);
		//��ġ����� ���ǿ� �����Ѵ�.
		session.setAttribute("searchInfo", searchDto);
		
		request.setAttribute("searchResult", v);
		forward.setNextPage("searchResultPage.jsp");
		
		return forward;
	}
}
