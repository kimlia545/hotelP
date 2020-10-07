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
		
		//검색>검색결과>검색결과 클릭했을때 뜨는 창을 처리하는 action
		//idx값을 받아서 다음 페이지에 해당 idx에 해당되는 객실 
		int idx = Integer.parseInt( request.getParameter("HotelIdx"));
		//예외처리 해야하는 방의 결과값을 가져온다
		String exceptRoom = request.getParameter("exceptRoom");
		
		HTSearchDAO dao = new HTSearchDAO();
		HTDataDTO dto = dao.selectHotelInfo(idx);
		Vector<HTRoomDataDTO> v = dao.roomOptionSelect(idx);
		
		//예외처리 해야하는 방의 목록을 / 단위로 잘라서 테스트
		String exceptArr[] = exceptRoom.split("/");
		
		if(exceptArr[0] == null || exceptArr[0].trim().equals("")){
			exceptArr[0] = "0";
		}

		for(int i=0; i<exceptArr.length; i++) {
			for(int j=0; j<v.size(); j++){
				if(v.get(j).getRoomNum() == Integer.parseInt(exceptArr[i])){
					//만약 선택한 호텔에 예외처리해야하는 방이 있다면
					//객실목록에서 제거해준다.
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
