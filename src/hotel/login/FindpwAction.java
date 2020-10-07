package hotel.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;

public class FindpwAction implements HotelAction {
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		
		request.setCharacterEncoding("euc-kr");//ÇÑ±Û ±úÁü Á¦°Å
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		FindDAO dao=new FindDAO();
		
		FindDTO pwstr=dao.pwFind(id,email);
		request.setAttribute("mypw",pwstr);

		forward.setNextPage("Find_pwShow.jsp");
		
		return forward;
	}

}
