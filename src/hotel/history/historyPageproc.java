package hotel.history;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import hotel.HotelAction;
import hotel.HotelActionF;
import hotel.review.HTHistoryDAO;
import hotel.review.HTHistoryDTO;



public class historyPageproc implements HotelAction{
	
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		
		//���������� ������ ���侲�⿡ ���
	
		
		System.out.println("rvNum : "+(request.getParameter("rvNum")));
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		
		//myHistoryselectAll�޼ҵ带 �̿��Ͽ� ���� Ŭ���� ���ų��� ���� �޾ƿ´�
		HTHistoryDAO dao = new HTHistoryDAO();
		Vector<HTHistoryDTO> v = dao.selecthistory(rvNum);
		
		//������������ ���೻���� ��� ���͸� �����ش�. rvNum
		request.setAttribute("myRv", v);
		request.setAttribute("rvNum", rvNum);
		
		//������������ �Ѱ��ݴϴ�.
		forward.setRedirect(false);
		forward.setNextPage("review.jsp");
		return forward;
		

		}
	}

		//���� ��ư�� ������ �� ���� ���� �� ���� ���� �ҷ�����
		/*	���並 �� ���� �� ���並 �����ϰ��� �Ҷ�
		db���� ���� �� ���並 ã��
		rvNum�� ���ؼ� 
		reviewNum ���� �����ͼ�
		reviewUpdate.jsp ���� ���� ���� ������ ���
		
		1.���並 ���� ���� history.jsp���� reviewNum���� ������ �־ ������ư ������ rvNum�� ���� �ѱ��
		history.java���� reviewNum ���� �����ͼ� history.jsp�� �� ������
		�׸��� history.jsp���� reviewNum �� �ѱ��
		
		2.���� ������ư ������ rvNum�� ���ؼ� reviewUpdate.java ���� reviewNum �� �����ͼ� review.jsp�� ����
		
		����� ���೻���� ������� review.jsp 
		
		rvNum ���� 2����
		����� ���೻���� ����ϱ�
		
		*/
		/*mypage.jsp->���೻��(historypage.do)<id�������>->historypage.java->history.jsp
		 * history.jsp(���侲���ư)<rvNum�������>->historyPageproc.do->historypageproc.java->review.jsp->reviewPageproc.do->reviewpageproc.java(historypage.do)->historypage.java->
		 * 
		 * 
		 * history.jsp(���亸���ư)<rvNum�������>->reviewUpdate.do->reviewUpdate.java->reviewUpdate.jsp(������ư)->reviewUpdateAction.do->historypage.do
		 * reviewUpdate.jsp(������ư)->reviewDeleteAction.do->historypage.do
		 * hotel_review DB ���Ͽ� rvNum 
		 * hotel_reservation rvNum 
		 * �߰� �����ȣ�� ������ �� ������ ���� ���� 
		 * -> */
		 