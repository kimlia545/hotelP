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
		
		
		//�� ���� ���� �ҷ�����  
		System.out.println("rvNum : "+(request.getParameter("rvNum")));
		
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		
		HTHistoryDAO dao = new HTHistoryDAO();
		Vector<HTHistoryDTO> v = dao.selecthistory(rvNum);
		
		System.out.println(" dao.selecthistory(rvNum) : "+v.size());
		
		request.setAttribute("rvNum", rvNum);
		request.setAttribute("myRv", v);
				
		//�� ���� ���� �ҷ�����
		HTReviewDAO rdao = new HTReviewDAO();
 		Vector<HTReviewDTO> rdto = rdao.getmyreview(rvNum);
 		System.out.println(" rdao.getmyreview(rvNum) : "+rdto.size());
 		System.out.println("rdao.getmyreview(grage) : "+rdto.size());
 
		//dto���� reviewNum �� ��������
		request.setAttribute("reviewNum",rdto);
		
		//������������ �Ѱ��ݴϴ�.
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		forward.setNextPage("reviewUpdate.jsp");
		System.out.println("reviewUpdate.java ��");
		return forward;
		
		//getSelectreviewNum
		
		
	}

}



//���� ��ư�� ������ �� ���� ���� �� ���� ���� �ҷ�����
/*		���並 �� ���� �� ���並 �����ϰ��� �Ҷ�
db���� ���� �� ���並 ã��
rvNum�� ���ؼ� 
reviewNum ���� �����ͼ�
reviewUpdate.jsp ���� ���� ���� ������ ���

history.java���� reviewNum ���� �����ͼ� history.jsp�� �� ������
�׸��� history.jsp���� reviewNum �� �ѱ��


*/
/*rvNum �� ���� �� ��������*/

//int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
