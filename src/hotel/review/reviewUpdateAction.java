package hotel.review;

import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelAction;
import hotel.HotelActionF;

public class reviewUpdateAction  implements HotelAction{

		@Override
		public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			
			//수정된 내용 저장하기 grade값도 jsp에 넣어서 값이 같이 나오도록
			HotelActionF forward = new HotelActionF();
			request.setCharacterEncoding("euc-kr");
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			float grade = Float.parseFloat(request.getParameter("grade"));
			int rvNum = Integer.parseInt(request.getParameter("rvNum"));
			

			System.out.println("title : "+title);
			System.out.println("content : "+content);
			System.out.println("grade : "+grade);
			System.out.println("rvNum : " +rvNum);
			
			
			HTReviewDTO dto = new HTReviewDTO();
			dto.setRvNum(rvNum);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setGrade(grade);
			
			
			HTReviewDAO dao = new HTReviewDAO();
			dao.reviewUpdate(rvNum, title,content,grade);
			
			forward.setRedirect(false);
			forward.setNextPage("historypage.do");
			return forward;
		}
	
}
