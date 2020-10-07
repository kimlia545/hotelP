package hotel.login;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.search.HTDataDTO;
import hotel.search.HTRoomDataDTO;
import hotel.search.HTSearchDTO;

public class logoutAction implements HotelAction { //메인 페이지 이동

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.getSession().removeAttribute("userid");
		request.getSession().removeAttribute("ceoid");
		
		HttpSession session = request.getSession(false);
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		
		String thisPage = request.getParameter("thisPage");
		
		if(thisPage.equals("search")){
			//검색페이지로 돌아갈 때, 사용했었던 정보값을 그대로 돌려준다
			HTSearchDTO searchInfo = (HTSearchDTO)session.getAttribute("searchInfo");
			Vector<HTDataDTO> member = (Vector<HTDataDTO>)session.getAttribute("searchResult");
			
			request.setAttribute("searchInfo", searchInfo);
			request.setAttribute("searchResult", member);
			
			forward.setNextPage("searchResultPage.jsp");
			return forward;
		}else if(thisPage.equals("detail")){
			HTSearchDTO searchInfo = (HTSearchDTO)session.getAttribute("searchInfo");
			HTDataDTO dto = (HTDataDTO)session.getAttribute("hotelInfo");
			Vector<HTRoomDataDTO> v = (Vector<HTRoomDataDTO>)session.getAttribute("roomInfo");
			
			request.setAttribute("searchInfo", searchInfo);
			request.setAttribute("hotelInfo", dto);
			request.setAttribute("roomInfo", v);
			
			forward.setNextPage("hotelDetailPage.jsp");
			return forward;
		}else if(thisPage.equals("main")){
			response.sendRedirect("mainpage.jsp");
		}
		
		return null;
	}

}
