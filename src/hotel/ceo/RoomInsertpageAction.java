package hotel.ceo;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.SortedSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import hotel.HotelAction;
import hotel.HotelActionF;

public class RoomInsertpageAction implements HotelAction {

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*String saveFolder=request.getRealPath("roomimg"); */
		
		int maxSize = 1024*1024*50;	
		String encType="euc-kr";
		String saveFolder="D:/Temp";
		CeoDAO dao = new CeoDAO();
		try{
			
			MultipartRequest mrequest 
		             = new MultipartRequest(
		            		 request,
		            		 saveFolder,
		            		 maxSize,
		            		 encType,
		            		 new DefaultFileRenamePolicy() );//파일업로드 완료
			CeoDTO hoteldto = new CeoDTO();      		 
		    int roomamount = Integer.parseInt(mrequest.getParameter("roomamount"));
			String ceoid = mrequest.getParameter("ceoid");
		    String syshotelimg = mrequest.getFilesystemName("hotelimg");
		    String orihotelimg = mrequest.getOriginalFileName("hotelimg");
		    String hotelname = mrequest.getParameter("hotelname");
		    String hoteladdress = mrequest.getParameter("hoteladdress");
		    
		    System.out.println(hotelname+"호텔이름");
		    System.out.println(hoteladdress+"호텔주소");
		    hoteldto.setCeoid(ceoid);
		    hoteldto.setSysname(syshotelimg);
		    hoteldto.setOriname(orihotelimg);
		    hoteldto.setHotelname(hotelname);
		    hoteldto.setHoteladdress(hoteladdress);
		    hoteldto.setRoomamount(roomamount);
		    
			System.out.println("1 : "+syshotelimg+"<br>");
			System.out.println("2 : "+orihotelimg+"<br>");
			System.out.println("3 : "+hotelname+"<br>");
			System.out.println("4 : "+hoteladdress+"<br>");
			System.out.println("5 : "+roomamount+"<br>");
		    
		    
			Vector<CeoDTO> roomVector = new Vector<CeoDTO>();
			
		    for(int i=0;i<roomamount;i++){
		    	String roomSysImg = mrequest.getFilesystemName("roomimg"+i);
		    	String roomOriImg = mrequest.getOriginalFileName("roomimg"+i);
		    	String roomType = mrequest.getParameter("roomtype"+i);
		    	String minPerson = mrequest.getParameter("minguest"+i);
		    	String maxPersion = mrequest.getParameter("maxguest"+i);
		    	String guestroomamount =mrequest.getParameter("guestroomamount");
		    	String roomPrice = mrequest.getParameter("roomprice"+i);
		    	
		    	CeoDTO dto = new CeoDTO();
		    	dto.setSysname(roomSysImg);
		    	dto.setOriname(roomOriImg);
		    	dto.setRoomtype(roomType);
		    	dto.setMinguest(Integer.parseInt(minPerson));
		    	dto.setMaxguest(Integer.parseInt(maxPersion));
		    	dto.setGuestroomamount(Integer.parseInt(guestroomamount));
		    	dto.setRoomprice(Integer.parseInt(roomPrice));
		    	roomVector.add(dto);
		    	System.out.println(guestroomamount+"숫자");
		    }		
		    
		   
		    dao.ceoinsert(roomVector,hoteldto);
			
		 /*   System.out.println(roomVector.get(0).setSysname()+"<br>");
		    System.out.println(roomVector.get(0).setOriname()+"<br>");
		    System.out.println(roomVector.get(0).getRoomType()+"<br>");
		    System.out.println(roomVector.get(0).getMinPerson()+"<br>");
		    System.out.println(roomVector.get(0).getMaxPersion()+"<br>");
		    System.out.println(roomVector.get(0).getRoomPrice()+"<br>");
		    */
		}catch(IOException ioe){
			ioe.printStackTrace();
			System.out.println ("입출력 에러");
			//response.sendRedirect("resiter.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
		HotelActionF forward = new HotelActionF();
		forward.setRedirect(false);
		forward.setNextPage("completeroom.jsp");
		return forward;
		
		
	}

}
