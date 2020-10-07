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
		
		//리뷰 쓰기 타이틀 내용 점수 아이디 rvNum DB저장
		
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
		
		//myHistoryselectAll메소드를 이용하여 벡터에 해당id의 모든 예약내역을 저장한다.
		HTHistoryDAO hdao = new HTHistoryDAO();
		Vector<HTHistoryDTO> v = hdao.myHistoryselectAll(id);
		
		//다음페이지에 예약내역이 담긴 벡터를 보내준다.
		request.setAttribute("myRv", v);
		
		System.out.println(v.size()+"*** 벡터싸이즈");
		
		return forward;
	}
}
