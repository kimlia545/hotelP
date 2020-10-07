package hotel.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelDAO;
import hotel.HotelAction;
import hotel.HotelActionF;

public class QnApageDeleteData implements HotelAction {

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String idx= request.getParameter("idx");
		String [] value = idx.split(",");
		HotelDAO dao = new HotelDAO();
		dao.QnADeleteData(value[0], value[1]);
		
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(true);
		forward.setNextPage("QnApage.jsp");
		return forward;
	}

}
