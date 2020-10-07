package hotel.review;

import java.util.Vector;

import javax.activation.ActivationDataFlavor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import hotel.HotelAction;
import hotel.HotelActionF;

public class reviewUpdate implements HotelAction{

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		//내 예약 내역 불러오기  
		System.out.println("rvNum : "+(request.getParameter("rvNum")));
		
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		
		HTHistoryDAO dao = new HTHistoryDAO();
		Vector<HTHistoryDTO> v = dao.selecthistory(rvNum);
		
		System.out.println(" dao.selecthistory(rvNum) : "+v.size());
		
		request.setAttribute("rvNum", rvNum);
		request.setAttribute("myRv", v);
				
		//내 리뷰 내역 불러오기
		HTReviewDAO rdao = new HTReviewDAO();
 		Vector<HTReviewDTO> rdto = rdao.getmyreview(rvNum);
 		System.out.println(" rdao.getmyreview(rvNum) : "+rdto.size());
 		System.out.println("rdao.getmyreview(grage) : "+rdto.size());
 
		//dto에서 reviewNum 값 가져오기
		request.setAttribute("reviewNum",rdto);
		
		//다음페이지로 넘겨줍니다.
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		forward.setNextPage("reviewUpdate.jsp");
		System.out.println("reviewUpdate.java 끝");
		return forward;
		
		//getSelectreviewNum
		
		
	}

}



//수정 버튼을 눌렀을 때 사용됨 내가 쓴 리뷰 내용 불러오기
/*		리뷰를 쓴 이후 내 리뷰를 열람하고자 할때
db에서 내가 쓴 리뷰를 찾기
rvNum을 통해서 
reviewNum 값을 가져와서
reviewUpdate.jsp 에서 리뷰 내용 제목이 출력

history.java에서 reviewNum 값을 가져와서 history.jsp에 값 나오게
그리고 history.jsp에서 reviewNum 값 넘기기


*/
/*rvNum 과 리뷰 값 가져오기*/

//int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
