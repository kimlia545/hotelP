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
		String id = request.getParameter("id");// ������ �Է��ߴ� id pw//
		String pw = request.getParameter("pw");
		String thisPage = request.getParameter("thisPage");
		
		dto = dao.ceoselect(id);
		boolean what =dao.hotellogin(id, pw); // id�� pw��  db���ִ� ���� ��ġ�ϸ� Ʈ�� 
		boolean ceoid =(id.equals(dto.getCeoID()));
	
		
		System.out.println("�α��� Ȯ�� : " + what);
		System.out.println("CEO Ȯ�� : " + ceoid);
		
		if(what==true){
			if(ceoid==true){
				request.getSession().setAttribute("ceoid", dto.getCeoID());
			}
			request.getSession().setAttribute("userid", id); // id�� ���ǿ� ���
		}else{
			request.setAttribute("wrong",1); // �α��� ���и� �˷��ֱ� ���� ���
		}
		
		

		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);

		if(thisPage.equals("search")){
			//�˻��������� ���ư� ��, ����߾��� �������� �״�� �����ش�
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
