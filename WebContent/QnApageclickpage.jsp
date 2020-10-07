<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hotel.mypage.otherDTO, hotel.mypage.pickupDTO,hotel.mypage.incunpickupDTO, hotel.mypage.baggageDTO, java.util.*,hotel.HotelDAO,hotel.HotelDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="QnApageDeleteData.do" name="idxval">
	<input type="hidden" name="idx">
	<table>
	
	<% 
	HotelDAO dao= new HotelDAO();
	String idx = (String)request.getAttribute("idx");
	String type = (String)request.getAttribute("type"); 
	%>
	
	<%
	if(type.equals("other")){
		Vector<otherDTO> otherval = dao.SelectInformation(type,idx);
		for(int i=0; i<otherval.size();i++){%>
		<tr>
			<td>관련 예약</td>
			<td><%=otherval.get(i).getReservation() %></td>
		</tr>
		<tr>
			<td>제 목</td>
			<td><%=otherval.get(i).getTitle() %></td>
		</tr>
		<tr>
			<td>요청 사항</td>
			<td><%=otherval.get(i).getRequests() %></td>
		</tr>	
		<%}	
	}else if(type.equals("pickup")){
		Vector<pickupDTO> pickupval = dao.SelectInformation(type,idx);
		for(int i=0; i<pickupval.size();i++){
			
		%>
		
		<tr>
			<td>관련 예약</td>
			<td><%=pickupval.get(i).getReservation()%></td>
		</tr>
		<tr>
			<td>전화번호(국가번호)</td>
			<td><%=pickupval.get(i).getPhone()%></td>
		</tr>
		<tr>
			<td>인원 수</td>
			<td><%=pickupval.get(i).getPickuppeople() %></td>
		</tr>
		<tr>
			<td>왕복 / 편도</td>
			<td><%=pickupval.get(i).getTrip()%></td>		
		</tr>
		<tr>
			<td>도착 날짜</td>
			<td><%=pickupval.get(i).getArrivedate()%></td>		
		</tr>
		<tr>
			<td>도착 시간</td>
			<td><%=pickupval.get(i).getArrivetime()%></td>		
		</tr>
		<tr>
			<td>도착 공항명</td>
			<td><%=pickupval.get(i).getArriveAP()%></td>		
		</tr>
		<tr>
			<td>[도착]항공편 명</td>
			<td><%=pickupval.get(i).getStartAPname()%></td>		
		</tr>
		<tr>
			<td>출발 날짜</td>
			<td><%=pickupval.get(i).getStartdate()%></td>		
		</tr>
		<tr>
			<td>출발 시간</td>
			<td><%=pickupval.get(i).getStarttime()%></td>		
		</tr>
		<tr>
			<td>출발 공항명</td>
			<td><%=pickupval.get(i).getStartAP()%></td>		
		</tr>
		<tr>
			<td>[출발]공항편 명</td>
			<td><%=pickupval.get(i).getStartAPname()%></td>		
		</tr>
		<tr>
			<td>요청 사항</td>
			<td><%=pickupval.get(i).getTextarea()%></td>		
		</tr>	
		<%}
	}else if(type.equals("incunpickup")){
		out.println("나온다");
		Vector<incunpickupDTO> incunpickupval = dao.SelectInformation(type,idx);
		out.println(incunpickupval.size());
		
		for(int i=0; i<incunpickupval.size();i++){%>
		<tr>
			<td>관련 예약</td>
			<td><%=incunpickupval.get(i).getReservation() %></td>
		</tr>
		<tr>
			<td>이용할 밴</td>
			<td><%=incunpickupval.get(i).getCarben()%></td>		
		</tr>
		<tr>
			<td>출발지 주소</td>
			<td><%=incunpickupval.get(i).getStartadd() %></td>		
		</tr>
		<tr>
			<td>도착 주소</td>
			<td><%=incunpickupval.get(i).getArriveadd() %></td>		
		</tr>
		<tr>
			<td>예약 날짜</td>
			<td><%=incunpickupval.get(i).getReservationdate() %></td>		
		</tr>
		<tr>
			<td>예약 시간</td>
			<td><%=incunpickupval.get(i).getReservationtime()%></td>		
		</tr>
		<tr>
			<td>인원 수</td>
			<td><%=incunpickupval.get(i).getIncunpickuppeople() %></td>		
		</tr>
		<tr>
			<td>수하물 갯수</td>
			<td><%=incunpickupval.get(i).getBaggagenum()%></td>		
		</tr>
		<tr>
			<td>요청 사항</td>
			<td><%=incunpickupval.get(i).getTextarea() %></td>		
		</tr>
			
		<%}
	}else if(type.equals("baggage")){
		Vector<baggageDTO> baggageval = dao.SelectInformation(type,idx);
		for(int i=0; i<baggageval.size();i++){%>
		<tr>
			<td>관련 예약</td>
			<td><%=baggageval.get(i).getReservation()%></td>
		</tr>
		<tr>
			<td>맡기는 장소</td>
			<td><%=baggageval.get(i).getEntrust()%></td>			
		</tr>
		<tr>
			<td>맡기는 주소</td>
			<td><%=baggageval.get(i).getEntrustadd()%></td>		
		</tr>
		<tr>
			<td>맡기는 날짜</td>
			<td><%=baggageval.get(i).getEntrustdate()%></td>		
		</tr>
		<tr>
			<td>맡기는 시간</td>
			<td><%=baggageval.get(i).getEntrusttime()%></td>		
		</tr>
		<tr>
			<td>맡기는 연락처</td>
			<td><%=baggageval.get(i).getEntrustphone()%></td>		
		</tr>
		<tr>
			<td>찾는 장소</td>
			<td><%=baggageval.get(i).getFind()%></td>		
		</tr>	
		<tr>
			<td>찾는 주소</td>
			<td><%=baggageval.get(i).getFindadd()%></td>		
		</tr>
		<tr>
			<td>찾는 날짜</td>
			<td><%=baggageval.get(i).getFinddate()%></td>		
		</tr>
		<tr>
			<td>찾는 시간</td>
			<td><%=baggageval.get(i).getFindtime()%></td>		
		</tr>
		<tr>
			<td>찾는 장소 연락처</td>
			<td><%=baggageval.get(i).getFindphone()%></td>		
		</tr>
		<tr>
			<td>항공편 명</td>
			<td><%=baggageval.get(i).getMainapname()%></td>		
		</tr>
		<tr>
			<td>요청 사항</td>
			<td><%=baggageval.get(i).getTextarea()%></td>		
		</tr>
		
		<%}
	}%>
	</table>
	<input type="button" value="삭제"  onclick="QnADelete('<%=idx %>,<%=type %>')">
	<a href="" name=Dee> 변경  </a>
	</form>
	<script type="text/javascript">
		function QnADelete(idx){
			document.idxval.idx.value=idx;
			idxval.submit();
		}
	</script>
</body>
</html>