<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hotel.*, java.util.Vector,org.json.simple.*" %>
<%
		int result=0;
		if(request.getParameter("id") != null){
			JSONObject json = new JSONObject();
			HotelDAO dao = new HotelDAO();			
			String id = request.getParameter("id");
			result = dao.loginidfineId(id);
			String value = "";
			if(result==1){				
				value="이미 존재하는 아이디 입니다.";
			}else if(result==0){
				
			}			
			json.put("result", value);
			out.println(json);
		}

	%>

