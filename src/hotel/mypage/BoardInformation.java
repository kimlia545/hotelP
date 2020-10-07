package hotel.mypage;

import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelDAO;
import hotel.HotelAction;
import hotel.HotelActionF;

public class BoardInformation implements HotelAction {

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String type= request.getParameter("idx");
		System.out.println(type);
		String [] x = type.split(",");

		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		request.setAttribute("idx", x[0]);
		request.setAttribute("type", x[1]);
		
		forward.setNextPage("QnApageclickpage.jsp");
		return forward;
		
	}
}
