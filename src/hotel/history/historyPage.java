package hotel.history;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.review.HTHistoryDAO;
import hotel.review.HTHistoryDTO;

public class historyPage implements HotelAction{
	
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		System.out.println("11111111111111");
		//���� ������ �������� �� ���
		
		//String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userid");
		System.out.println("22222222222222222222222222222");
		System.out.println(id);
		
		//myHistoryselectAll�޼ҵ带 �̿��Ͽ� ���Ϳ� �ش�id�� ��� ���೻���� �����Ѵ�.
		HTHistoryDAO dao = new HTHistoryDAO();
		Vector<HTHistoryDTO> v = dao.myHistoryselectAll(id);
		System.out.println("333333333333333333333");
		//������������ ���೻���� ��� ���͸� �����ش�.
		request.setAttribute("myRv", v);
		
	
/*		HTRivewDAO rdao = new HTReviewDAO();
		HTReviewDTO = dao.getrvNUM(rvNum);*/
		
		
		//������������ �Ѱ��ݴϴ�.
		forward.setRedirect(false);
		forward.setNextPage("history.jsp");
		return forward;
	}

}
