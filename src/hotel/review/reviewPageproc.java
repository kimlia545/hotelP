package hotel.review;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import hotel.HotelAction;
import hotel.HotelActionF;


public class reviewPageproc implements HotelAction{
	
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//���� ���� Ÿ��Ʋ ���� ���� ���̵� rvNum DB����
		
		HotelActionF forward = new HotelActionF();
		
		/*request.getSession().setAttribute("userid");*/
		request.setCharacterEncoding("euc-kr");
		String title = request.getParameter("title"); 
		String content = request.getParameter("content");
		float grade = Float.parseFloat(request.getParameter("grade"));
		String id = request.getParameter("id");
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		
		HTReviewDTO dto = new HTReviewDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setGrade(grade);
		dto.setId(id);
		dto.setRvNum(rvNum);
			
		
		HTReviewDAO dao = new HTReviewDAO(); 
		rvNum = Integer.parseInt(request.getParameter("rvNum"));
		
		
		request.setAttribute("rvNum", rvNum);
		
		
		forward.setRedirect(true);
		forward.setNextPage("historypage.do");
	
		dao.reviewWrite(dto,rvNum);
		
		HttpSession session = request.getSession();
		
		//myHistoryselectAll�޼ҵ带 �̿��Ͽ� ���Ϳ� �ش�id�� ��� ���೻���� �����Ѵ�.
		HTHistoryDAO hdao = new HTHistoryDAO();
		Vector<HTHistoryDTO> v = hdao.myHistoryselectAll(id);
		
		//������������ ���೻���� ��� ���͸� �����ش�.
		request.setAttribute("myRv", v);
		
		System.out.println(v.size()+"*** ���ͽ�����");
		
		return forward;
	}
}
