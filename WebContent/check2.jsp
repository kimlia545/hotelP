<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hotel.*, java.util.Vector,org.json.simple.*" %>
<%
		int result2=1;
		if(request.getParameter("invite") !=null){
			JSONObject json = new JSONObject();
			HotelDAO dao = new HotelDAO();			
			String invite = request.getParameter("invite");
			result2 = dao.invitefineId(invite);
			String value ="";
			if(invite=="" || result2==1){
				value ="";
			}else{		
				value="잘못된 추천인 입니다.";
			}
			
			json.put("result2", value);
			out.println(json);
		}
	%>
