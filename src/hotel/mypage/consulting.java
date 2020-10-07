package hotel.mypage;

import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelDAO;
import hotel.HotelAction;
import hotel.HotelActionF;

public class consulting implements HotelAction{

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Enumeration param = request.getParameterNames();
		Vector<String> v = new Vector<String>();
		HotelDAO dao = new HotelDAO();
		String phone="";
		//System.out.println(param.hasMoreElements());
		//System.out.println(param.nextElement());
		String y = request.getParameter("TT");
		while (param.hasMoreElements()){
			
			String str = (String) param.nextElement();
			if(str.equals("phone1")||str.equals("phone2")||str.equals("phone3")||str.equals("phone4")){
				phone= phone+request.getParameter(str);
				if(str.equals("phone4")){
					v.add(phone);
				}
			}else{
				v.add(request.getParameter(str));
				
			}
			
			
			}
			if(y.equals("other")){
				dao.otherinsert(v);
			}else if(y.equals("pickup")){
				dao.pickupinsert(v);
			}else if(y.equals("incunpickup")){
				dao.incunpickupinsert(v);
			}else if(y.equals("baggage")){
				dao.baggageinsert(v);
			}
			/*if(str.equals("phone1") ||str.equals("phone2")||str.equals("phone3")){
				phone= phone+request.getParameter(str);
				if(str.equals("phone3")){
					v.add(phone);
				}
			}else{
				v.add(request.getParameter(str));
			}*/
		
		
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		forward.setNextPage("QnApage.jsp");
		return forward;
	}

}
