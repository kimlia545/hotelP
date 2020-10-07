package hotel.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.HotelDAO;
import hotel.HotelDTO;
import hotel.HotelAction;
import hotel.HotelActionF;

public class SignupAction implements HotelAction { // 회원가입 페이지 값 받고 jsp보내기

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		String name= request.getParameter("name");
		String phone= request.getParameter("phone");
		String email= request.getParameter("email");
		String codes = request.getParameter("codes");
		String invite= request.getParameter("invite");
		String enterprise= request.getParameter("enterprisetext");
		HotelDTO dto = new HotelDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setCodes(codes);
		dto.setInvite(invite);
		dto.setEnterprise(enterprise);
		
		HotelDAO dao = new HotelDAO();
		dao.Signupinsert(dto);
		
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		forward.setNextPage("mainpage.do");
		return forward;
		
	}

}
