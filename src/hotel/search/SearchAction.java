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
		
		//location이 포함된 모든 값을 찾기 위해 String값 변경
		location = "%" + location + "%";
		
		HTSearchDAO dao = new HTSearchDAO();
		Vector<HTDataDTO> v = dao.searchHotel(location, checkIn, checkOut, personnel);
		
		//서치결과
		HTSearchDTO searchDto = new HTSearchDTO();
		searchDto.setLocation(location);
		searchDto.setCheckIn(checkIn);
		searchDto.setCheckOut(checkOut);
		searchDto.setNum(personnel);
		//서치결과를 세션에 저장한다.
		session.setAttribute("searchInfo", searchDto);
		
		request.setAttribute("searchResult", v);
		forward.setNextPage("searchResultPage.jsp");
		
		return forward;
	}
}
