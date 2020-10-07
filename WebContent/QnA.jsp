

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	html,body{
		box-sizing: border-box;
		font-family: 나눔고딕;
	}
	{
		margin: 0 auto;
		padding: 0 auto;
	}
	input[type="button"]{
		border:none;
		outline:none;
		left: 640px;
		bottom: 10px;
		position: relative;
		height: 30px;
	} 
	
	.fa-input { font-family: FontAwesome, ‘Helvetica Neue’, Helvetica, Arial, sans-serif; }
	.main , .pickuppop{
		width: 760px;
		background-color: rgba(179,217,255,0.3);
		color: rgba(0,0,0,0.5);
	}
	table{
		width: 800px;
	}
	.top td{
		height: 65px;
		border-bottom:1px solid rgba(150,100,150,0.2); 
	}
	.center td{
		padding-top: 30px;
	}
	.a{
	 	width: 150px;
	 	padding: 10px;
	}
	#name{
		width: 550px;
	}
	textarea {
		margin-bottom: 30px;
	}
	.num{
		width: 30px;
	}
	.sub{
		width: 10px;
		border: 1px solid red;
	}
	.pickuppop div{
		display: flex;
	}
	.div{
		width: 170px;
		display: flex;
		color: rgba(0,0,0,0.5);
	}
	.incuntb tr{
		font-size: 15px;
		
		
	}
	.incuntb td{
		border: 1px solid black;
		padding: 7px;
	}
	.won{
		color: rgba(0,0,0,0.5);
	}
	/* .botton{
		padding-top: 10px;
	} */
	.incunpickuppop, .pickuppop, .baggagepop {
		 display: none; 
	}
	
	.baggagetb td{
		border: 1px solid black;
	}
	.damage li{
		padding-bottom: 10px;
	}
	ol ul{
		font-size: 15px;
	}
	.baggagepop li{
		padding-bottom: 10px;
	}
	.PH{
		width: 70px;
		height: 20px;
	}
	.baggagepopsub>div>div,.pickuppop>div>div,.incunpickuppop>div>div{
		padding-bottom: 6px;
	}
	textarea{
		resize: none;
		width: 450px;
		height: 200px;
	}
	 .main_left_top{
        width: 352px;
        display: flex;
        position: relative;
        bottom: -20px;
        margin-top: -30px;
  
    }
    .main_left_top1{
        font-size: 25px;
        width: 150px;
        position:relative;
       
        
    }
    .main_left_top2{
        padding-top: 10px;
        width: 230px;
        
    }
    .main_right{
        padding-top: 18px;
		width: 200px;
        color: rgba(0,0,0,0.7);
        position: fixed;
        margin-left: 850px;
	}
</style>
</head>
<body>
	<% 
	String[] time = new String[48];
	
	for(int i = 0; i < 24; i++){
		time[i * 2] = String.format("%02d:%02d", i, 0);
		time[i * 2 + 1] = String.format("%02d:%02d", i, 30);
	}
	%>
<div style="display: flex;width: 950px; margin: 0 auto; padding: 0 auto;">
<div>	
	<div class="main_left_top">
		  <p class="main_left_top1">문 의 하 기</p><p class="main_left_top2">문의하실 유형을 선택해주세요.</p>
	</div>
	<hr size="4px" color="black">
	<div class=main style="display: flex;">
		<!-- <form name="frm"> -->
		
		<table>
			<tr class=top>
				<td class=a>문의 유형</td>	
		 		<td>
		 		
			 		<select id="popmenu" name="maintopmenu">
					  <option value='other' id="other">기타</option>
					  <option value='pickup' id="pickup">현지 공항 픽업 서비스</option>
					  <option value='incunpickup' id="incunpickup">인천 공항 픽업 서비스'</option>
					  <option value='baggage' id="baggage">수하물 배송내용</option>
					</select>
				</td>
			</tr>
			
		</table>
		<!-- </form> -->
		<input type="hidden" style=" color: black; position:absolute; left: 550px;" value="<%=session.getAttribute("userid")%>">
	</div>
	
	<form action="consulting.do" name= otheraction  style="position:relative; ">
	<div class =main id =rlxk>
		<input type="hidden" value="other" name=TT> 
		<table>
			<tr class=center>
				<td class=a sty>관련 예약</td>	
		 		<td><select class="op" name="reservation1" required oninput="setCustomValidity('')">
				  <option value='noclick'>---- 관련 예약 선택 ----</option>
				  <option value='BReservation'>예약 전</option>
				</select></td>
			</tr>
			<tr>
				<td class=a>제목</td>	
		 		<td><input type="text" class="alertAc" required oninput="setCustomValidity('')"  name="name"></td>
			</tr>
			<tr>
				<td class=a  >요청사항</td>	
		 		<td><textarea rows="14" cols="80" name=textarea1></textarea></td>
			</tr>
		</table>
		<input type="button" value="작성 완료" id="submitother" style="color: white; background-color:rgba(0,200,200,0.7); width: 100px; ">
	</div>
	<input type="hidden" value="<%=session.getAttribute("userid") %>" name="valid">
	</form>
	
	<form action="consulting.do" name ="pickupaction">
	<div class=pickuppop style="padding-top: 10px;">
	<input type="hidden" value="pickup" name=TT>
		<div style="width: 750px; display: flex">
			<div class=div>관련 예약</div>
			<div>
				<select class="op" name="reservation2" required oninput="setCustomValidity('')">
					<option value='noclick'>---- 관련 예약 선택 ----</option>
					<option value='BReservation'>예약 전</option>
				</select>
			</div>
		</div>
		
		<div>
			<div class=div>긴급시 연락처</div>
			<div>
				 <input type="text" class="alertAc PH"   name= phone1 > 
				 (국가번호) -
				 <input type="text" class="alertAc PH"   name= phone2 > - 
				 <input type="text" class="alertAc PH"   name= phone3 > - 
				 <input type="text" class="alertAc PH"   name= phone4 >
				 
			</div>
		</div>
		
		<div>
			<div class=div>인원 수</div>
			<div>
				<input type="text" class="alertAc"   name=pickuppeople onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
				<input type="radio" name="trip" value="RoundTrip" checked="checked">왕복
				<input type="radio" name="trip" value="One-wayTrip">편도	
			</div>
		</div><br>
		
		
		<div>항공 정보 (출발편)</div><br>
		<div>
			<div class=div>도착 날짜 / 시간</div>
			<div><input type="text" class="alertAc datepicker1" name="arrivedate"> / 시간 <input type="text" class="alertAc"  name=arrivetime></div>
		</div>	
	
		<div>
			<div class=div>도착 공항 명</div>
			<div><input type="text" class="alertAc"   name="arriveAP"></div>
		</div>	
		
		<div>
			<div class=div>항공편 명</div>
			<div><input type="text" class="alertAc"   name="arriveAPname"></div>
		</div>	
		<br>
		<div>항공 정보 (귀국편)</div>
		<br>
		<div>
			<div class=div>출발 날짜&nbsp;&nbsp; / 시간</div>
			<div><input type="text" class="alertAc datepicker1" name="startdate"> / 시간 <input type="text" class="alertAc"  name="starttime"></div>
		</div> 	
			
		<div>
			<div class=div>출발 공항 명</div>
			<div><input type="text" class="alertAc" name="startAP"></div>
		</div>	
		
		<div>
			<div class=div>항공편 명</div>
			<div><input type="text" class="alertAc"  name="startAPname"></div>
		</div>	
		
		<div>
			<div class=div>요청 사항</div>
			<div><textarea rows="14" cols="80"name="textarea2"></textarea></div>
		</div>
		<input type="button" value="작성 완료" id="submitpickup" style="color: white; background-color:rgba(0,200,200,0.7); width: 100px; ">		
	</div>
	<input type="hidden" value="<%=session.getAttribute("userid") %>" name="valid">
	</form>
	
	
	
	
	
	
	
	
	
	
	<form action="consulting.do" name ="incunpickupaction">
	<div class=incunpickuppop style="width: 760px; padding-top:10px; background-color: rgba(179,217,255,0.3)">
	<input type="hidden" value="incunpickup" name=TT>
		<div style="width: 720px;height:400px; ;background-color: rgba(255,255,255,0.5); overflow:scroll; overflow-x:hidden; position:relative; left: 20px;">
			<div style="width:700px;">
				<p style="text-align: center; font-weight: bold; font-size: 23px;">인천국제공항 픽업 서비스</p>
				<p style="text-align: center; color: rgba(0,200,200,0.8)">에바종X 제이에스밴</p><br>
				<p style="text-align: center;">픽업 서비스를 통해 공항을 편하게 오가세요. 제이에스밴 차량이 고객님께서 지정하신 시간에 지정하신 장소로 찾아갑니다. 여행을 시작할 때 집에서 인천국제공항까지, 여행을 마친 뒤에 인천국제공항에서 집까지! 같은 여행이라도 더욱 편안하고 아름다운 추억이 됩니다.</p>
				<div style="font-size:17px; height:30px; padding:5px; font-weight:bold; color: white; background-color: rgba(0,200,200,0.8)">상품 정보</div>
				<ol>
					<li>프리미엄밴: 기아 올뉴카니발 또는 현대 그랜드스타렉스<br>인원과 짐이 많은 고객들을 위한 서비스로 최대 8인까지 차량 한 대로 이동할 수 있습니다.</li>
					<li>리무진밴: 기아 카니발리무진 또는 현대 그랜드스타렉스리무진<br>품격 있고 편안한 승차감을 원하시는 고객들을 위한 서비스로 최대 8인까지 차량 한 대로 이동할 수 있습니다. 기본적인 영어 회화가 가능한 기사가 배정됩니다.</li>
					
				<ul style="list-style: none; position:relative; right: 30px;">
					<li>- 리무진밴 이용 시 프리미엄밴 이용 요금에서 <span>11,000원</span>이 추가됩니다</li>
					<li>- 유아용 카시트는 고객님의 제품으로 설치할 수 있으며, 왕복 이용 시 보관해드립니다.</li>
					<li>- 서비스 이용 영업일 기준 최소 5일 전에 예약하셔야 합니다.</li>
					<li>- 인천국제공항 도착·출발 상품이며 현재 인천을 제외한 수도권에서만 이용할 수 있습니다.</li>
					<li style="color: red">- 통행료는 서비스 이용 당일 현장에서 현금으로 지불하셔야 합니다.</li>
					<li style="color: red">- 현장 사정에 따라 사전 통보 없이 통행료가 조정될 수 있습니다.</li>
				</ul>
				</ol><br>
				<table class=incuntb style="width:670px;  position:relative; left: 20px;border-collapse: collapse; ">
					<tr style="background-color: rgba(0,0,0,0.8);color: white;">
						<td style="width: 300px;text-align: center; font-weight: bold;">지역</td>
						<td style="width: 120px;text-align: center;font-weight: bold;">프리미엄밴</td>
						<td style="width: 120px;text-align: center;font-weight: bold;">통행료</td>			
					</tr>
					<tr>
						<td>강서, 양천, 영등포, 마포, 서대문, 구로, 금천, 관악, 동작, 은평</td>
						<td>76,000 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>용산, 중구, 종로, 서초</td>
						<td>81,500 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>강북, 성북, 동대문, 성동, 강남</td>
						<td>87,000 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>도봉, 노원</td>
						<td>92,500 원</td>
						<td class=won>약 11,000원</td>
					</tr>
					<tr>
						<td>중랑, 광진, 강동, 송파</td>
						<td>92,500 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>부천시</td>
						<td>65,000 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>김포시 (풍무, 사우)</td>
						<td>65,000 원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>김포시 (장기,통진읍)</td>
						<td>70,500 원</td>
						<td class=won>약 5,000원</td>
					</tr>
					<tr>
						<td>시흥시</td>
						<td>65,000 원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>고양시 (벽제)</td>
						<td>81,500 원</td>
						<td class=won>약 9,000원</td>
					</tr>
					<tr>
						<td>고양시 (덕양구)</td>
						<td>70,500원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>일산시</td>
						<td>70,500 원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>과천시</td>
						<td>87,000 원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>광명시</td>
						<td>70,500 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>광주시</td>
						<td>114,500 원</td>
						<td class=won>약 10,000원</td>
					</tr>
					<tr>
						<td>구리시</td>
						<td>103,500 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>군포시</td>
						<td>76,000 원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>남양주시</td>
						<td>114,500 원</td>
						<td class=won>약 12,000원</td>
					</tr>
					<tr>
						<td>동두천시</td>
						<td>114,500 원</td>
						<td class=won>약 11,000원</td>
					</tr>
					<tr>
						<td>성남시</td>
						<td>103,500 원</td>
						<td class=won>약 10,000원</td>
					</tr>
					<tr>
						<td>수원시</td>
						<td>92,500 원</td>
						<td class=won>약 10,000원</td>
					</tr>
					<tr>
						<td>안산시 (단원구)</td>
						<td>70,500 원</td>
						<td class=won>약 9,000원</td>
					</tr>
					<tr>
						<td>안산시 (상록구)</td>
						<td>76,000 원</td>
						<td class=won>약 9,000원</td>
					</tr>
					<tr>
						<td>안성시</td>
						<td>147,500 원</td>
						<td class=won>약 15,000원</td>
					</tr>
					<tr>
						<td>안양시</td>
						<td>76,000 원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>양주시</td>
						<td>98,000 원</td>
						<td class=won>약 11,000원</td>
					</tr>
					<tr>
						<td>오산시</td>
						<td>125,500 원</td>
						<td class=won>약 14,000원</td>
					</tr>
					<tr>
						<td>용인시 (처인구)</td>
						<td>109,000 원</td>
						<td class=won>약 11,000원</td>
					</tr>
					<tr>
						<td>용인시 (기흥구,수지구)</td>
						<td>98,000 원</td>
						<td class=won>약 10,000원</td>
					</tr>
					<tr>
						<td>의왕시</td>
						<td>81,500 원</td>
						<td class=won>약 10,000원</td>
					</tr>
					<tr>
						<td>의정부시</td>
						<td>92,500 원</td>
						<td class=won>약 11,000원</td>
					</tr>
					<tr>
						<td>이천시</td>
						<td>136,500 원</td>
						<td class=won>약 12,000원</td>
					</tr>
					<tr>
						<td>파주시</td>
						<td>92,500 원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>파주시 (문산읍)</td>
						<td>103,500 원</td>
						<td class=won>약 8,000원</td>
					</tr>
					<tr>
						<td>평택시</td>
						<td>136,500 원</td>
						<td class=won>약 12,000원</td>
					</tr>
					<tr>
						<td>포천시</td>
						<td>125,500 원</td>
						<td class=won>약 11,000원</td>
					</tr>
					<tr>
						<td>하남시</td>
						<td>125,500 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>화성시</td>
						<td>103,500 원</td>
						<td class=won>약 10,000원</td>
					</tr>
					<tr>
						<td>화성시 (동탄)</td>
						<td>114,500 원</td>
						<td class=won>약 11,000원</td>
					</tr>
					<tr>
						<td>가평군</td>
						<td>158,500 원</td>
						<td class=won>약 12,000원</td>
					</tr>
					<tr>
						<td>양평군</td>
						<td>147,500 원</td>
						<td class=won>약 7,000원</td>
					</tr>
					<tr>
						<td>여주군</td>
						<td>158,500 원</td>
						<td class=won>약 12,200원</td>
					</tr>
					<tr>
						<td>연천군</td>
						<td>136,500 원</td>
						<td class=won>약 8,000원</td>
					</tr>
				</table>								
			</div><br><br>
			<div style="font-size:17px; height:30px; padding:5px; font-weight:bold; color: white; background-color: rgba(0,200,200,0.8)">취소 및 환불 규정</div>
			<br><div>예약 출발 시간 3일 이전 오후 5시까지 에바종 고객센터를 통해 취소할 수 있으며 이후에는 환불 불가능합니다. 에바종 고객센터 운영시간 외에는 제이에스밴 고객센터를 통해 취소하실 수 있습니다.
				<ul style="list-style: none; right: 20px; position: relative; font-size: 15px ">
					<li>- 고객센터: 1577-90xx / 운영시간: 평일 9:00~18:00</li>
					<li>- 그런컴퓨터밴 고객센터: 1544-71xx / 운영시간: 매일 08:00~02:00</li>
				</ul>			
			 </div>
		</div>
		<br><br>
		<div style="width: 700px; display: flex">
			<div class=div>관련 예약</div>
			<div>
				<select class="op" name=reservation3 >
					<option value='noclick'>---- 관련 예약 선택 ----</option>
					<option value='BReservation'>예약 전</option>
				</select>
			</div>
		</div>
		
		<div style="width: 700px; display: flex">
			<div class=div>관련 예약</div>
			<div>
				<select class="op" name="carben" required oninput="setCustomValidity('')">
					<option value='PBAN'>프리미엄밴</option>
					<option value='RBAN'>리무진밴</option>
				</select>
			</div>
		</div>
		
		<div style="display: flex;width: 700px; ">
			<div class=div>출발지 주소</div>
			<div><input type="text" class="alertAc"  name="startadd"></div>
		</div>
		
		<div style="display: flex;width: 700px;">
			<div class=div>도착지 주소</div>
			<div><input type="text" class="alertAc"  name="arriveadd"></div>
		</div> 
		
		<div  style="display: flex;width: 700px; ">
			<div class=div>예약 날짜 / 시간</div>
			<div>
				<div class=div style="display: flex;"><input type="text" class="alertAc datepicker1"name="reservationdate"></div>
				<div >시간 
					<select name="reservationtime" required oninput="setCustomValidity('')">
						<%for(int i=0; i < time.length; i++){ %>
							<option value="<%=time[i]%>"><%=time[i]%></option>
						<%} %>
					</select>
				</div>
			</div>
		</div>
		<div style="display: flex">
			<div class=div>인원수</div>
			<div>
				<select class="op" name=incunpickuppeople style="height: 20px" required oninput="setCustomValidity('')">
					<%
						for(int i=1; i <=8; i++){ %>
						<option value="<%=i%>"><%=i%></option>
					<%} %>
				</select>명
			</div>
		</div>
		<div style="display: flex">
			<div class=div>수하물 갯수</div>
			<div><input type="text" class="alertAc" name="baggagenum" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></div>
		</div>
		<div style="display: flex">
			<div class=div>요청 사항</div>
			<div><textarea rows="14" cols="80" name="textarea3"></textarea></div>
		</div>
		<input type="button" value="작성 완료" id="submitincunpickup" style="color: white; background-color:rgba(0,200,200,0.7); width: 100px; ">
	</div>
	<input type="hidden" value="<%=session.getAttribute("userid") %>" name="valid3">
	</form>
	
	
	
	
	
	
	
	
	<form action="consulting.do" name ="baggageaction">
	<div class=baggagepop style="width: 760px; padding-top:10px; background-color: rgba(179,217,255,0.3)" >
		<input type="hidden" value="baggage" name=TT>
		<div style="width: 720px;height:400px; ;background-color: rgba(255,255,255,0.5); overflow:scroll; overflow-x:hidden; position:relative; left: 20px;">
			<div style="width:700px;">
				<p style="text-align: center; font-size: 23px; font-weight: bold;">공항 짐 운반 서비스</p>
				<p style="color:rgba(0,200,200,0.8); text-align: center;">*상호명 X 짐좀에어</p><br>
				<p style="text-align: center;">무거운 짐은 잊고 가볍게 여행하세요. 
				서울에서 이용할 수 있는 짐좀에어는 여행 짐을 원하는 장소에서 공항으로
				 보내거나, 공항에서 원하는 장소로 보낼 수 있는 짐 운반 서비스입니다.
				  짐이 많고 무겁다면 짐 운반 서비스를 이용해 가벼운 마음으로 여행하세요. 
				당일 아침 여행 짐을 맡기시면 오후에 공항에서 찾으실 수 있습니다.
				<p>
				<p style="color:red; font-weight: 500; font-size: 13px; text-align: center;">*에바종 X 짐좀에어 서비스는 현재 서울과 경기도에서만 이용하실 수 있는 점 양해 부탁드립니다.</p><br>
				<div style="background-color: rgba(0,200,200,0.8); color: white; font-weight: bold; height: 30px; padding-top: 5px;">서비스 이용 및 배송 시간</div><br>
				<div><img src="hotelimg/Zzz.jpg"></div><br>
				<p style="font-size: 14px;">* 당일 배송 가능 지역: 마포구, 서대문구, 종로구, 중구, 용산구, 강남구, 서초구 (이외 지역 익일 배송 가능)</p><br>
				<div style="background-color: rgba(0,200,200,0.8); color: white; font-weight: bold; height: 30px; padding-top: 5px;">픽업 · 전달 위치</div>
				<ol>
					<li>인천 / 김포공항</li>
					<ul style="list-style: none; right: 40px; position: relative;" >
						<li>- 인천공항 제 1 터미널: 3층 N 19 카운터 맞은편 노랑풍선 데스크</li>
						<li>- 인천공항 제 2 터미널: 3층 H 카운터 뒤편 한진택배</li>
						<li>- 김포공항 국제선: 1층 입궁장 수화물 토탈 서비스</li>
						<li>- 김포공항 국내선: 1층 우체국 맞은편 수화물 토탈 서비스</li>
					</ul>
				</ol>
				<table class=baggagetb style="border-collapse: collapse; width: 670px;">
					<tr>
						<td>구분</td>
						<td>서비스 상품</td>
						<td>사이즈</td>
						<td>가격(5% 할인 적용)</td>
					</tr>
					<tr>
						<td rowspan="3">서울</td>
						<td rowspan="2">지정장소 ↔ 공항</td>
						<td>28인치 이하</td>
						<td>19,000원</td>
					</tr>
					<tr>
						
						<td>28인치 초과</td>
						<td>28,500원</td>
					</tr>
					<tr>
						<td>여행짐 보관</td>
						<td>1일 보관</td>
						<td>4,000원</td>
					</tr>
				</table>
				<div>
					* 수도권 경기 지역(일산 의정부 구리 하남 성남 분당 과천 안양 고양 군포 과천)은 이용요금 <span>5,000원</span>이 추가됩니다.<br>
				</div><br>
				<div style="background-color: rgba(0,200,200,0.8); color: white; font-weight: bold;  height: 30px; padding-top: 5px;">취소 및 환불규정</div><br>
				<ol>
					<li>예약 출발 시간 3일 전 오후 5시까지 에바종 고객센터를 통해 취소할 수 있으며 이후에는 불가능합니다.</li>
						<ul style="list-style: none; right: 20px; position: relative;">
							<li>- 고객센터: 1577-9056 / 운영시간: 평일 9:00~18:00</li>
							<li>- 짐좀에어 서울 고객센터: 1670-7496 / 운영시간: 매일 09:30~18:30</li>
						</ul>
					<li>
					고객의 비행기가 불가항력적인 이유로 지연의 경우, 고객을 통해 미리 회사에 고지가 된 경우에 한해서 환불이 가능합니다. 그러나 이에 관련된 어떠한 내용도 고지가 되지 않은 채 일방적인
					 고객의 취소 요청인 경우 단순변심으로 간주해 환불요건이 충족되지 않습니다
					 </li>
				</ol>
				<div style="background-color: rgba(0,200,200,0.8); color: white; font-weight: bold;  height: 30px; padding-top: 5px;">배송 및 분실·파손 규정</div><br>
				<ol class=damage>
					<li>아래 명시된 품목의 사항을 포함하고 있거나 유사하다고 인정되는 품목에 대해 운송을 거부할 수 있습니다.
					 고객과 사전 협의되지 않은 해당 품목의 운반 중 발생한 사고에 대하여 어떠한 문제도 책임지지 않습니다.</li>
					<ul style="list-style: none; right: 20px; position: relative; font-size: 15px ">
						<li>- 고가 귀금속, 고가 물품(금, 보석)</li>
						<li>- 현금 및 유가증권(모든 형태의 수표 및 서류)</li>
						<li>- 타인에게 해를 가할 수 있는 물품</li>
						<li>- 파손 위험 물품</li>
						<li>- 부패성 물품</li>
						<li>- 악취가 심한 물품</li>
						<li>- 발인화성 화학물질이나 향정신성 의약품</li>
						<li>- 디지털카메라, 노트북, 아이패드 등 전자기기</li>
					</ul>
					<li>수하물의 가치가 한 건당 <span>500,000원</span> 이상일 경우 회사는 배송을 거부할 수 있으므로, <span>500,000원</span>을 초과하는 경우 회사와 고객 사이에 사전 합의가 이루어져야 합니다. 만약 사전합의 없이 고객이 임의로<span>500,000원</span> 이상의 수하물의 운송을 요청하는 경우 회사는 수하물에 대하여 최대 <span>500,000원</span>의 손해배상책임만을 부담합니다.</li>
					<li>수하물의 분실 및 손실이 발생한 경우<span>500,000원</span>을 한도로 배상책임을 부담합니다. 수하물의 분실 및 손실이 발생한 경우 고객은 인도받은 날로부터 영업일 7일 이내에 분실 및 손실에 대한 자료를 서면으로 제출해야 합니다. 고객이 인도받은 날로부터 영업일 7일 이내에 회사에 분실 및 손실에 대해 배상을 요청하지 않으면 회사는 어떠한 책임도 부담하지 않습니다.</li>
					<li>항공지연, 자연재해, 테러 등 불가항력적인 사유로 인하여 일어난 분실 및 손실에 대해서는 책임지지 않습니다. 짐좀에어의 책임으로 수하물의 운송이 지연되어 고객이 수하물 없이 항공기에 탑승한 경우 짐좀에어는 가장 빠른 수단을 이용하여 고객의 목적지로 수하물을 운송해 드립니다.</li>
				</ol>	
			</div>
		</div><br>
		
		<div class=baggagepopsub style="margin-left: 14px;">
			<div style="display: flex">
				<div class=div>관련 예약</div>
				<div>
					<select class="op" name=reservation4 required oninput="setCustomValidity('')">
						<option value='noclick'>----관련 예약 선택----</option>
						<option value='reservation'>예약 전</option>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>맡기는 장소</div>
				<div>
					<select class="op" name=entrust>
					<option value='Hotel'>호텔</option>
					<option value='IncunA1'>인천공항 터미널1</option>
					<option value='IncunA2'>인천공항 터미널2</option>
					<option value='KInternational'>김포국제공항</option>
					<option value='KDomestic'>김포국내공항</option>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>맡기는 장소 주소</div>
				<div><input type="text" class="alertAc" name=entrustadd></div>
			</div>
			
			<div style="display: flex">
				<div class=div>맡기는 날짜</div>
				<input type="text" class="alertAc datepicker1" name="entrustdate">
			</div>
			
			<div style="display: flex">
				<div class=div>맡기는 시간</div>
				<div>
					<select class="op" name=entrusttime required oninput="setCustomValidity('')">
					<%for(int i=14; i < 31; i++){ %>
						<option value="<%=time[i]%>"><%=time[i]%></option>
					<%} %>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>맡기는 장소 연락처</div>
				<input type="text" class="alertAc"name="entrustphone">
			</div>
			
			<div style="display: flex">
				<div class=div>찾는 장소</div>
				<div>
					<select class="op" name="find">
					<option value='Hotel'>호텔</option>
					<option value='IncunA1'>인천공항 터미널1</option>
					<option value='IncunA2'>인천공항 터미널2</option>
					<option value='KInternational'>김포국제공항</option>
					<option value='KDomestic'>김포국내공항</option>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>찾는 장소 주소</div>
				<div><input type="text" class="alertAc" name="findadd"></div>
			</div>
			
			<div style="display: flex">
				<div class=div>찾는 날짜</div>
				<input type="text" class="alertAc datepicker1" name="findady">
			</div>
			
			<div style="display: flex">
				<div class=div>찾는 시간</div>
				<div>
					<select class="op" name="findtime" required oninput="setCustomValidity('')">
					<%for(int i=32; i < 42; i++){ %>
						<option value="<%=time[i]%>"><%=time[i]%></option>
					<%} %>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>찾는 장소 연락처</div>
				<div><input type="text" class="alertAc" name="findphone"></div>
			</div>
			
			<div style="display: flex">
				<div class=div>항공편명</div>
				<div><input type="text" class="alertAc"name="mainapname"></div>
			</div>
			<div style="display: flex">
				<div class=div>요청사항</div>
				<div><textarea rows="14" cols="80" name=textarea4></textarea></div>
			</div>
			<input type="button" value="작성 완료" id="submitbaggage" style="color: white; background-color:rgba(0,200,200,0.7); width: 100px; ">
		</div>
		<input type="hidden" value="<%=session.getAttribute("userid") %>" name="valid4">
	</div>
	 </form>
 	</div>
	 
	<div class="main_right">
	    <div class="mypage">
	       MY PAGE
	       <hr>
	    </div>
        <div class="list1"> 예약내역</div><br>
        <div class="list2"> 알림 신청 내역</div><br>
        <div class="list3"> 친구 초대하기</div><br>
        <div class="list4"> 회원정보 변경</div><br>
        <div class="list5"> 1:1 문의하기</div><br>
        <div class="list6"> 이용후기</div><br>
	</div>
	
</div>		
	<script>
			
		$(function() {
			
			$.datepicker.setDefaults({
				showOn:'both',
				buttonImage: 'hotelimg/CAL02.png',
				buttonImageOnly: true,
				dateFormat: 'yy-mm-dd',
				prevText: '이전 달',
				nextText: '다음 달',
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				showMonthAfterYear: true,
				yearSuffix: 'Year'
			});
			
			$('#popmenu').change(function(){
				var state = $('#popmenu option:selected').val();
				
				if(state == 'pickup'){
					$("#rlxk").css("display","none");
					$(".incunpickuppop").css("display","none");
					$(".baggagepop").css("diplay","none");
					$(".pickuppop").css("display","block");
				}else if(state == 'other'){
					$("#rlxk").css("display","block");
					$(".incunpickuppop").css("display","none");
					$(".baggagepop").css("display","none");
					$(".pickuppop").css("display","none");
				}else if(state == 'incunpickup'){
					$("#rlxk").css("display","none");
					$(".incunpickuppop").css("display","block");
					$(".baggagepop").css("diplay","none");
					$(".pickuppop").css("display","none");
				}else if(state == 'baggage'){
					$("#rlxk").css("display","none");
					$(".incunpickuppop").css("display","none");
					$(".baggagepop").css("display","block");
					$(".pickuppop").css("display","none");
				}else{
					
				}
			});
			$(".datepicker1").datepicker();
			$(".datepicker1").datepicker().css("top","30px");
			
			$("span:contains('5,000원')").css({color:"red"});
			$("span:contains('11,000원')").css({color:"red"});
			$("span:contains('500,000원')").css({color:"red"}); 
	
			
			$("#submitother").click(function(){
				var maintopmenu = $("[name='maintopmenu']").val();
				if(maintopmenu == 'other'){
					
					if($("[name='reservation1']").val()=="noclick"){
						alert("관련 예약을 선택해 주십시오");
						$("input[name='reservation1']").focus();
						return false;
					}
					
					if($("[name='name']").val()==""){
						alert("제목을 입력해 주세요");
						$("input[name='reservation1']").focus();
						return false;
					}
					
					if($("[name='textarea1']").val()==""){
						alert("요청사항을 입력해 주세요");
						$("input[name='reservation1']").focus();
						return false;
					}
				otheraction.submit();
				}
				
			});
			
			$("#submitpickup").click(function(){
				var maintopmenu = $("[name='maintopmenu']").val();
				if(maintopmenu == 'pickup'){
					if($("[name='reservation2']").val()=="noclick"){
						alert("관련 예약을 선택해 주십시오");
						$("input[name='reservation2']").focus();
						return false;
					}						
					if($("[name='phone1']").val()==""){
						alert("숫자를 입력해 주십시오");
						$("input[name='phone1']").focus();
						return false;
					}
					if($("[name='phone2']").val()==""){
						alert("숫자를 입력해 주십시오");	
						$("input[name='phone2']").focus();
						return false;
					}
					if($("[name='phone3']").val()==""){
						alert("숫자를 입력해 주십시오");	
						$("input[name='phone3']").focus();
						return false;
					}
					if($("[name='phone4']").val()==""){
						alert("숫자를 입력해 주십시오");	
						$("input[name='phone4']").focus();
						return false;
					}
					if($("[name='pickuppeople']").val()==""){
						alert("인원 수를 입력해 주십시오");	
						$("input[name='pickuppeople']").focus();
						return false;
					}
					if($("[name='arrivedate']").val()==""){
						alert("도착 날짜를 입력해 주십시오");	
						$("input[name='arrivedate']").focus();
						return false;
					}
					if($("[name='arrivetime']").val()==""){
						alert("도착 시간를 입력해 주십시오");	
						$("input[name='arrivetime']").focus();
						return false;
					}
					if($("[name='arriveAP']").val()==""){
						alert("도착 공항명을 입력해 주십시오");	
						$("input[name='arriveAP']").focus();
						return false;
					}
					if($("[name='arriveAPname']").val()==""){
						alert("도착 공항편을 입력해 주십시오");	
						$("input[name='arriveAPname']").focus();
						return false;
					}
					if($("[name='startdate']").val()==""){
						alert("출발 날짜를 입력해 주십시오");	
						$("input[name='startdate']").focus();
						return false;
					}
					if($("[name='starttime']").val()==""){
						alert("출발 시간을 입력해 주십시오");	
						$("input[name='starttime']").focus();
						return false;
					}
					if($("[name='startAP']").val()==""){
						alert("출발 공항명을 입력해 주십시오");	
						$("input[name='startAP']").focus();
						return false;
					}
					if($("[name='startAPname']").val()==""){
						alert("출발 항공명을 입력해 주십시오");	
						$("input[name='startAPname']").focus();
						return false;
					}
					pickupaction.submit();	
				}
			});
			
			$("#submitincunpickup").click(function(){
				var maintopmenu = $("[name='maintopmenu']").val();
				if(maintopmenu == 'incunpickup'){
					if($("[name='reservation3']").val()=="noclick"){
						alert("관련 예약을 선택해 주십시오");
						$("input[name='reservation2']").focus();
						return false;
					}						
					if($("[name='startadd']").val()==""){
						alert("출발지 주소를 입력해 주십시오");
						$("input[name='startadd']").focus();
						return false;
					}
					if($("[name='arriveadd']").val()==""){
						alert("도착지 주소를 입력해 주십시오");
						$("input[name='arriveadd']").focus();
						return false;
					}
					if($("[name='reservationdate']").val()==""){
						alert("예약 날짜를 입력해 주십시오");
						$("input[name='reservationday']").focus();
						return false;
					}
					if($("[name='baggagenum']").val()==""){
						alert("수하물 갯수를 입력해 주십시오");
						$("input[name='baggagenum']").focus();
						return false;
					}
					incunpickupaction.submit();	
				}
			});
			
			$("#submitbaggage").click(function(){
				var maintopmenu = $("[name='maintopmenu']").val();
				if(maintopmenu == 'baggage'){
					if($("[name='reservation4']").val()=="noclick"){
						alert("관련 예약을 선택해 주십시오");
						$("input[name='reservation2']").focus();
						return false;
					}						
					if($("[name='entrustadd']").val()==""){
						alert("맡기실 주소를 입력해 주십시오");
						$("input[name='entrustadd']").focus();
						return false;
					}
					if($("[name='entrustdate']").val()==""){
						alert("맡기실 날짜를 입력해 주십시오");
						$("input[name='entrustdate']").focus();
						return false;
					}
					if($("[name='entrustphone']").val()==""){
						alert("맡기실 주소 연락처를 입력해 주십시오");
						$("input[name='entrustphone']").focus();
						return false;
					}
					if($("[name='findadd']").val()==""){
						alert("찾으실 주소를 입력해 주십시오");
						$("input[name='findadd']").focus();
						return false;
					}
					if($("[name='finddate']").val()==""){
						alert("찾으실 날짜를 입력해 주십시오");
						$("input[name='finddate']").focus();
						return false;
					}
					if($("[name='findphone']").val()==""){
						alert("찾으실 주소 연락처를 입력해 주십시오");
						$("input[name='findphone']").focus();
						return false;
					}
					if($("[name='mainapname']").val()==""){
						alert("항공편명을 입력해 주십시오");
						$("input[name='mainapname']").focus();
						return false;
					}
				}
				baggageaction.submit();
			});
			
		});
		
		 //내일 해야될거 클릭으로 바꿔서 하기
	</script>
	
</body>
</html>