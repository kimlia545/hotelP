package hotel.search;

import hotel.*;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class HTRoomDetailsAction implements HotelAction {
	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		
		//�˻�>�˻����>�˻���� Ŭ�������� �ߴ� â�� ó���ϴ� action
		//idx���� �޾Ƽ� ���� �������� �ش� idx�� �ش�Ǵ� ���� 
		int idx = Integer.parseInt( request.getParameter("HotelIdx"));
		//����ó�� �ؾ��ϴ� ���� ������� �����´�
		String exceptRoom = request.getParameter("exceptRoom");
		
		HTSearchDAO dao = new HTSearchDAO();
		HTDataDTO dto = dao.selectHotelInfo(idx);
		Vector<HTRoomDataDTO> v = dao.roomOptionSelect(idx);
		
		//����ó�� �ؾ��ϴ� ���� ����� / ������ �߶� �׽�Ʈ
		String exceptArr[] = exceptRoom.split("/");
		
		if(exceptArr[0] == null || exceptArr[0].trim().equals("")){
			exceptArr[0] = "0";
		}

		for(int i=0; i<exceptArr.length; i++) {
			for(int j=0; j<v.size(); j++){
				if(v.get(j).getRoomNum() == Integer.parseInt(exceptArr[i])){
					//���� ������ ȣ�ڿ� ����ó���ؾ��ϴ� ���� �ִٸ�
					//���Ǹ�Ͽ��� �������ش�.
					v.remove(i);					
				}
			}
		}

		request.setAttribute("hotelInfo", dto);
		request.setAttribute("roomInfo", v);
		forward.setNextPage("hotelDetailPage.jsp");
		return forward;
	}
}
