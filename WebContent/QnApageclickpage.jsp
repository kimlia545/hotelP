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
			<td>���� ����</td>
			<td><%=otherval.get(i).getReservation() %></td>
		</tr>
		<tr>
			<td>�� ��</td>
			<td><%=otherval.get(i).getTitle() %></td>
		</tr>
		<tr>
			<td>��û ����</td>
			<td><%=otherval.get(i).getRequests() %></td>
		</tr>	
		<%}	
	}else if(type.equals("pickup")){
		Vector<pickupDTO> pickupval = dao.SelectInformation(type,idx);
		for(int i=0; i<pickupval.size();i++){
			
		%>
		
		<tr>
			<td>���� ����</td>
			<td><%=pickupval.get(i).getReservation()%></td>
		</tr>
		<tr>
			<td>��ȭ��ȣ(������ȣ)</td>
			<td><%=pickupval.get(i).getPhone()%></td>
		</tr>
		<tr>
			<td>�ο� ��</td>
			<td><%=pickupval.get(i).getPickuppeople() %></td>
		</tr>
		<tr>
			<td>�պ� / ��</td>
			<td><%=pickupval.get(i).getTrip()%></td>		
		</tr>
		<tr>
			<td>���� ��¥</td>
			<td><%=pickupval.get(i).getArrivedate()%></td>		
		</tr>
		<tr>
			<td>���� �ð�</td>
			<td><%=pickupval.get(i).getArrivetime()%></td>		
		</tr>
		<tr>
			<td>���� ���׸�</td>
			<td><%=pickupval.get(i).getArriveAP()%></td>		
		</tr>
		<tr>
			<td>[����]�װ��� ��</td>
			<td><%=pickupval.get(i).getStartAPname()%></td>		
		</tr>
		<tr>
			<td>��� ��¥</td>
			<td><%=pickupval.get(i).getStartdate()%></td>		
		</tr>
		<tr>
			<td>��� �ð�</td>
			<td><%=pickupval.get(i).getStarttime()%></td>		
		</tr>
		<tr>
			<td>��� ���׸�</td>
			<td><%=pickupval.get(i).getStartAP()%></td>		
		</tr>
		<tr>
			<td>[���]������ ��</td>
			<td><%=pickupval.get(i).getStartAPname()%></td>		
		</tr>
		<tr>
			<td>��û ����</td>
			<td><%=pickupval.get(i).getTextarea()%></td>		
		</tr>	
		<%}
	}else if(type.equals("incunpickup")){
		out.println("���´�");
		Vector<incunpickupDTO> incunpickupval = dao.SelectInformation(type,idx);
		out.println(incunpickupval.size());
		
		for(int i=0; i<incunpickupval.size();i++){%>
		<tr>
			<td>���� ����</td>
			<td><%=incunpickupval.get(i).getReservation() %></td>
		</tr>
		<tr>
			<td>�̿��� ��</td>
			<td><%=incunpickupval.get(i).getCarben()%></td>		
		</tr>
		<tr>
			<td>����� �ּ�</td>
			<td><%=incunpickupval.get(i).getStartadd() %></td>		
		</tr>
		<tr>
			<td>���� �ּ�</td>
			<td><%=incunpickupval.get(i).getArriveadd() %></td>		
		</tr>
		<tr>
			<td>���� ��¥</td>
			<td><%=incunpickupval.get(i).getReservationdate() %></td>		
		</tr>
		<tr>
			<td>���� �ð�</td>
			<td><%=incunpickupval.get(i).getReservationtime()%></td>		
		</tr>
		<tr>
			<td>�ο� ��</td>
			<td><%=incunpickupval.get(i).getIncunpickuppeople() %></td>		
		</tr>
		<tr>
			<td>���Ϲ� ����</td>
			<td><%=incunpickupval.get(i).getBaggagenum()%></td>		
		</tr>
		<tr>
			<td>��û ����</td>
			<td><%=incunpickupval.get(i).getTextarea() %></td>		
		</tr>
			
		<%}
	}else if(type.equals("baggage")){
		Vector<baggageDTO> baggageval = dao.SelectInformation(type,idx);
		for(int i=0; i<baggageval.size();i++){%>
		<tr>
			<td>���� ����</td>
			<td><%=baggageval.get(i).getReservation()%></td>
		</tr>
		<tr>
			<td>�ñ�� ���</td>
			<td><%=baggageval.get(i).getEntrust()%></td>			
		</tr>
		<tr>
			<td>�ñ�� �ּ�</td>
			<td><%=baggageval.get(i).getEntrustadd()%></td>		
		</tr>
		<tr>
			<td>�ñ�� ��¥</td>
			<td><%=baggageval.get(i).getEntrustdate()%></td>		
		</tr>
		<tr>
			<td>�ñ�� �ð�</td>
			<td><%=baggageval.get(i).getEntrusttime()%></td>		
		</tr>
		<tr>
			<td>�ñ�� ����ó</td>
			<td><%=baggageval.get(i).getEntrustphone()%></td>		
		</tr>
		<tr>
			<td>ã�� ���</td>
			<td><%=baggageval.get(i).getFind()%></td>		
		</tr>	
		<tr>
			<td>ã�� �ּ�</td>
			<td><%=baggageval.get(i).getFindadd()%></td>		
		</tr>
		<tr>
			<td>ã�� ��¥</td>
			<td><%=baggageval.get(i).getFinddate()%></td>		
		</tr>
		<tr>
			<td>ã�� �ð�</td>
			<td><%=baggageval.get(i).getFindtime()%></td>		
		</tr>
		<tr>
			<td>ã�� ��� ����ó</td>
			<td><%=baggageval.get(i).getFindphone()%></td>		
		</tr>
		<tr>
			<td>�װ��� ��</td>
			<td><%=baggageval.get(i).getMainapname()%></td>		
		</tr>
		<tr>
			<td>��û ����</td>
			<td><%=baggageval.get(i).getTextarea()%></td>		
		</tr>
		
		<%}
	}%>
	</table>
	<input type="button" value="����"  onclick="QnADelete('<%=idx %>,<%=type %>')">
	<a href="" name=Dee> ����  </a>
	</form>
	<script type="text/javascript">
		function QnADelete(idx){
			document.idxval.idx.value=idx;
			idxval.submit();
		}
	</script>
</body>
</html>