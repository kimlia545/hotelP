package hotel.login;

import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.HotelDAO;
import hotel.search.HTDataDTO;
import hotel.search.HTRoomDataDTO;
import hotel.search.HTSearchDTO;
import hotel.HotelAction;
import hotel.HotelActionF;



public class loginPage implements HotelAction {

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		HotelDAO dao= new HotelDAO();
		ceologinDTO dto = new ceologinDTO();
		String id = request.getParameter("id");// 유저가 입력했던 id pw//
		String pw = request.getParameter("pw");
		String thisPage = request.getParameter("thisPage");
		
		dto = dao.ceoselect(id);
		boolean what =dao.hotellogin(id, pw); // id와 pw가  db에있는 값과 일치하면 트루 
		boolean ceoid =(id.equals(dto.getCeoID()));
	
		
		System.out.println("로그인 확인 : " + what);
		System.out.println("CEO 확인 : " + ceoid);
		
		if(what==true){
			if(ceoid==true){
				request.getSession().setAttribute("ceoid", dto.getCeoID());
			}
			request.getSession().setAttribute("userid", id); // id를 세션에 등록
		}else{
			request.setAttribute("wrong",1); // 로그인 실패를 알려주기 위해 등록
		}
		
		

		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);

		if(thisPage.equals("search")){
			//검색페이지로 돌아갈 때, 사용했었던 정보값을 그대로 돌려준다
			Vector<HTDataDTO> member = (Vector<HTDataDTO>)session.getAttribute("searchResult");
			session.removeAttribute("searchResult");
			request.setAttribute("searchResult", member);
			forward.setNextPage("searchResultPage.jsp");
		}
		else if(thisPage.equals("detail")){
			HTSearchDTO searchInfo = (HTSearchDTO)session.getAttribute("searchInfo");
			HTDataDTO hoteldto = (HTDataDTO)session.getAttribute("hotelInfo");
			Vector<HTRoomDataDTO> v = (Vector<HTRoomDataDTO>)session.getAttribute("roomInfo");
			session.removeAttribute("hotelInfo");
			session.removeAttribute("roomInfo");
			
			request.setAttribute("hotelInfo", hoteldto);
			request.setAttribute("roomInfo", v);
			
			forward.setNextPage("hotelDetailPage.jsp");
		}
		else if(thisPage.equals("main")){
			forward.setNextPage("mainpage.jsp");
		}
		
		return forward;
		
	}

}
