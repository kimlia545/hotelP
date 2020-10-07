package hotel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface HotelAction {
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
