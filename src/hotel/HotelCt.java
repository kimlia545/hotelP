package hotel;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import hotel.ceo.*;
import hotel.history.historyPage;
import hotel.history.historyPageproc;
import hotel.login.*;
import hotel.mypage.*;
import hotel.review.*;
import hotel.search.*;

@WebServlet("/HotelCt")
public class HotelCt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;
    public HotelCt() {
        super();
        // TODO Auto-generated constructor stub
        try{
        	Context init = new InitialContext();
        	ds = (DataSource)init.lookup("java:comp/env/jdbc/TestDB");
        }catch (NamingException e) {
			e.printStackTrace();
		}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doprocess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doprocess(request, response);
	}
	
	
	 public void doprocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		 HotelDAO dao = new HotelDAO();
		 String requestURI = request.getRequestURI(); //요청 주소값
		// main.do
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		// main 만 가져오도록 글자를 자른다.
		String command = requestURI.substring(cmdIdx);
		String viewPage = null;
		HotelAction action = null;
		HotelActionF forward = null;
		try{
			
			if(command.equals("mainpage.do")){ // 시작 홈페이지
				action = new Hotelmain(); 
				forward = action.execute(request, response);
			}else if(command.equals("signup.do")){ // 회원가입 페이지
				action = new Signuppage();
				forward = action.execute(request, response);
			}else if(command.equals("SignupAction.do")){ 
				action = new SignupAction();
				forward = action.execute(request, response);
			}else if(command.equals("LoginAction.do")){
				action = new SignupAction();
				forward = action.execute(request, response);
			}else if(command.equals("loginpage.do")){				
				action = new loginPage();
				forward = action.execute(request, response);
			}else if(command.equals("logoutpage.do")){				
				action = new logoutAction();
				forward = action.execute(request, response);
			}else if(command.equals("mypage.do")){				
				action = new mypage();
				forward = action.execute(request, response);
			}else if(command.equals("QnApage.do")){				
				action = new QnApage();
				forward = action.execute(request, response);
			}else if(command.equals("QnApageproc.do")){				
				action = new QnApageproc();
				forward = action.execute(request, response);
			}else if(command.equals("consulting.do")){				
				action = new consulting();
				forward = action.execute(request, response);
			}else if(command.equals("BoardInformation.do")){				
				action = new BoardInformation();
				forward = action.execute(request, response);
			}else if(command.equals("QnApageDeleteData.do")){				
				action = new QnApageDeleteData();
				forward = action.execute(request, response);
			}else if(command.equals("loginupdate.do")){				
				action = new loginupdatepage();
				forward = action.execute(request, response);
			}else if(command.equals("sumlogin.do")){				
				action = new sumloginaction();
				forward = action.execute(request, response);
			}else if(command.equals("Invitefriends.do")){				
				action = new Invitefriends();
				forward = action.execute(request, response);
			}else if(command.equals("SearchAction.do")){ // 검색부분				
				action = new SearchAction();
				forward = action.execute(request, response);
			}else if(command.equals("roomInsertpage.do")){ // 검색부분				
				action = new RoomInsertpage();
				forward = action.execute(request, response);
			}else if(command.equals("roominsertpageaction.do")){ // 검색부분				
				action = new RoomInsertpageAction();
				forward = action.execute(request, response);
			}else if(command.equals("Ceoroomcomlete.do")){ // 검색부분				
				action = new Ceoroomcomlete();
				forward = action.execute(request, response);
			}else if(command.equals("HotelDetails.do")){ // 검색결과에서 호텔 세부정보	
				action = new HTRoomDetailsAction();
				forward = action.execute(request, response);
			}else if(command.equals("HTReservedPageAction.do")){ 
				action = new HTReservedPageAction();
				forward = action.execute(request, response);	
			}else if(command.equals("Findid.do")){ // 아이디 찾기			
				action = new FindAction();
				forward = action.execute(request, response);
			}else if(command.equals("Findpw.do")){ // 비번 찾기			
				action = new FindpwAction();
				forward = action.execute(request, response);
			}else if(command.equals("change_PW.do")){ // 비번찾기>비번변경			
				action = new PwChangeAction();
				forward = action.execute(request, response);
			}else if(command.equals("HTReservationApplyAction.do")){ // 예약등록	
				action = new HTReservationApplyAction();
				forward = action.execute(request, response);
			}else if(command.equals("reviewPage.do")){
				action = new reviewPage();
				forward = action.execute(request, response);	
			}else if(command.equals("reviewPageproc.do")){ //리뷰 쓴 내용 저장
				action = new reviewPageproc();
				forward = action.execute(request, response);			
			}else if(command.equals("reviewUpdateAction.do")){ //수정한 리뷰내용 저장
				action = new reviewUpdateAction();
				forward = action.execute(request, response);	
			}else if(command.equals("reviewDeleteAction.do")){ //리뷰 삭제
				action = new reviewDeleteAction();
				forward = action.execute(request, response);		
			}else if(command.equals("historypage.do")){ // 예약내역 클릭시 내가 예약내역들 출력
				action = new historyPage();
				forward = action.execute(request, response);
			}else if(command.equals("historyPageproc.do")){ //리뷰 쓰기페이지에 클릭한 예약 내역 출력
				action = new historyPageproc();
				forward = action.execute(request, response);		
			}else if(command.equals("reviewUpdate.do")){ //리뷰 수정페이지에 클릭한 예약내역과 작성한 리뷰 내용 출력
				action = new reviewUpdate();
				forward = action.execute(request, response);	
			}else{
				response.sendRedirect("mainpage.do");
			}
			
			
			if(forward != null){
				if(forward.isRedirect()){
					System.out.println(forward.getNextPage());
					response.sendRedirect(forward.getNextPage());
					
				}else{
					
					RequestDispatcher dispatcher =
							request.getRequestDispatcher(forward.getNextPage());
					dispatcher.forward(request, response);
				}
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	 }
	 
}
