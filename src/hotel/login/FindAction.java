package hotel.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;

public class FindAction implements HotelAction {
	
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		
		request.setCharacterEncoding("euc-kr");//ÇÑ±Û ±úÁü Á¦°Å
		String named = request.getParameter("named");
		String email = request.getParameter("email");
	
		FindDAO dao=new FindDAO();
		
		String idstr=dao.idFind(named,email);
		
		request.setAttribute("myid",idstr);
		request.setAttribute("name", named);
		forward.setNextPage("Find_idShow.jsp");
		
		return forward;
	}

}
