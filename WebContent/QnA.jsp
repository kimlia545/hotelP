

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
		font-family: �������;
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
	
	.fa-input { font-family: FontAwesome, ��Helvetica Neue��, Helvetica, Arial, sans-serif; }
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
		  <p class="main_left_top1">�� �� �� ��</p><p class="main_left_top2">�����Ͻ� ������ �������ּ���.</p>
	</div>
	<hr size="4px" color="black">
	<div class=main style="display: flex;">
		<!-- <form name="frm"> -->
		
		<table>
			<tr class=top>
				<td class=a>���� ����</td>	
		 		<td>
		 		
			 		<select id="popmenu" name="maintopmenu">
					  <option value='other' id="other">��Ÿ</option>
					  <option value='pickup' id="pickup">���� ���� �Ⱦ� ����</option>
					  <option value='incunpickup' id="incunpickup">��õ ���� �Ⱦ� ����'</option>
					  <option value='baggage' id="baggage">���Ϲ� ��۳���</option>
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
				<td class=a sty>���� ����</td>	
		 		<td><select class="op" name="reservation1" required oninput="setCustomValidity('')">
				  <option value='noclick'>---- ���� ���� ���� ----</option>
				  <option value='BReservation'>���� ��</option>
				</select></td>
			</tr>
			<tr>
				<td class=a>����</td>	
		 		<td><input type="text" class="alertAc" required oninput="setCustomValidity('')"  name="name"></td>
			</tr>
			<tr>
				<td class=a  >��û����</td>	
		 		<td><textarea rows="14" cols="80" name=textarea1></textarea></td>
			</tr>
		</table>
		<input type="button" value="�ۼ� �Ϸ�" id="submitother" style="color: white; background-color:rgba(0,200,200,0.7); width: 100px; ">
	</div>
	<input type="hidden" value="<%=session.getAttribute("userid") %>" name="valid">
	</form>
	
	<form action="consulting.do" name ="pickupaction">
	<div class=pickuppop style="padding-top: 10px;">
	<input type="hidden" value="pickup" name=TT>
		<div style="width: 750px; display: flex">
			<div class=div>���� ����</div>
			<div>
				<select class="op" name="reservation2" required oninput="setCustomValidity('')">
					<option value='noclick'>---- ���� ���� ���� ----</option>
					<option value='BReservation'>���� ��</option>
				</select>
			</div>
		</div>
		
		<div>
			<div class=div>��޽� ����ó</div>
			<div>
				 <input type="text" class="alertAc PH"   name= phone1 > 
				 (������ȣ) -
				 <input type="text" class="alertAc PH"   name= phone2 > - 
				 <input type="text" class="alertAc PH"   name= phone3 > - 
				 <input type="text" class="alertAc PH"   name= phone4 >
				 
			</div>
		</div>
		
		<div>
			<div class=div>�ο� ��</div>
			<div>
				<input type="text" class="alertAc"   name=pickuppeople onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
				<input type="radio" name="trip" value="RoundTrip" checked="checked">�պ�
				<input type="radio" name="trip" value="One-wayTrip">��	
			</div>
		</div><br>
		
		
		<div>�װ� ���� (�����)</div><br>
		<div>
			<div class=div>���� ��¥ / �ð�</div>
			<div><input type="text" class="alertAc datepicker1" name="arrivedate"> / �ð� <input type="text" class="alertAc"  name=arrivetime></div>
		</div>	
	
		<div>
			<div class=div>���� ���� ��</div>
			<div><input type="text" class="alertAc"   name="arriveAP"></div>
		</div>	
		
		<div>
			<div class=div>�װ��� ��</div>
			<div><input type="text" class="alertAc"   name="arriveAPname"></div>
		</div>	
		<br>
		<div>�װ� ���� (�ͱ���)</div>
		<br>
		<div>
			<div class=div>��� ��¥&nbsp;&nbsp; / �ð�</div>
			<div><input type="text" class="alertAc datepicker1" name="startdate"> / �ð� <input type="text" class="alertAc"  name="starttime"></div>
		</div> 	
			
		<div>
			<div class=div>��� ���� ��</div>
			<div><input type="text" class="alertAc" name="startAP"></div>
		</div>	
		
		<div>
			<div class=div>�װ��� ��</div>
			<div><input type="text" class="alertAc"  name="startAPname"></div>
		</div>	
		
		<div>
			<div class=div>��û ����</div>
			<div><textarea rows="14" cols="80"name="textarea2"></textarea></div>
		</div>
		<input type="button" value="�ۼ� �Ϸ�" id="submitpickup" style="color: white; background-color:rgba(0,200,200,0.7); width: 100px; ">		
	</div>
	<input type="hidden" value="<%=session.getAttribute("userid") %>" name="valid">
	</form>
	
	
	
	
	
	
	
	
	
	
	<form action="consulting.do" name ="incunpickupaction">
	<div class=incunpickuppop style="width: 760px; padding-top:10px; background-color: rgba(179,217,255,0.3)">
	<input type="hidden" value="incunpickup" name=TT>
		<div style="width: 720px;height:400px; ;background-color: rgba(255,255,255,0.5); overflow:scroll; overflow-x:hidden; position:relative; left: 20px;">
			<div style="width:700px;">
				<p style="text-align: center; font-weight: bold; font-size: 23px;">��õ�������� �Ⱦ� ����</p>
				<p style="text-align: center; color: rgba(0,200,200,0.8)">������X ���̿�����</p><br>
				<p style="text-align: center;">�Ⱦ� ���񽺸� ���� ������ ���ϰ� ��������. ���̿����� ������ ���Բ��� �����Ͻ� �ð��� �����Ͻ� ��ҷ� ã�ư��ϴ�. ������ ������ �� ������ ��õ�������ױ���, ������ ��ģ �ڿ� ��õ�������׿��� ������! ���� �����̶� ���� ����ϰ� �Ƹ��ٿ� �߾��� �˴ϴ�.</p>
				<div style="font-size:17px; height:30px; padding:5px; font-weight:bold; color: white; background-color: rgba(0,200,200,0.8)">��ǰ ����</div>
				<ol>
					<li>�����̾���: ��� �ô�ī�Ϲ� �Ǵ� ���� �׷��彺Ÿ����<br>�ο��� ���� ���� ������ ���� ���񽺷� �ִ� 8�α��� ���� �� ��� �̵��� �� �ֽ��ϴ�.</li>
					<li>��������: ��� ī�Ϲ߸����� �Ǵ� ���� �׷��彺Ÿ����������<br>ǰ�� �ְ� ����� �������� ���Ͻô� ������ ���� ���񽺷� �ִ� 8�α��� ���� �� ��� �̵��� �� �ֽ��ϴ�. �⺻���� ���� ȸȭ�� ������ ��簡 �����˴ϴ�.</li>
					
				<ul style="list-style: none; position:relative; right: 30px;">
					<li>- �������� �̿� �� �����̾��� �̿� ��ݿ��� <span>11,000��</span>�� �߰��˴ϴ�</li>
					<li>- ���ƿ� ī��Ʈ�� ������ ��ǰ���� ��ġ�� �� ������, �պ� �̿� �� �����ص帳�ϴ�.</li>
					<li>- ���� �̿� ������ ���� �ּ� 5�� ���� �����ϼž� �մϴ�.</li>
					<li>- ��õ�������� ��������� ��ǰ�̸� ���� ��õ�� ������ �����ǿ����� �̿��� �� �ֽ��ϴ�.</li>
					<li style="color: red">- ������ ���� �̿� ���� ���忡�� �������� �����ϼž� �մϴ�.</li>
					<li style="color: red">- ���� ������ ���� ���� �뺸 ���� ����ᰡ ������ �� �ֽ��ϴ�.</li>
				</ul>
				</ol><br>
				<table class=incuntb style="width:670px;  position:relative; left: 20px;border-collapse: collapse; ">
					<tr style="background-color: rgba(0,0,0,0.8);color: white;">
						<td style="width: 300px;text-align: center; font-weight: bold;">����</td>
						<td style="width: 120px;text-align: center;font-weight: bold;">�����̾���</td>
						<td style="width: 120px;text-align: center;font-weight: bold;">�����</td>			
					</tr>
					<tr>
						<td>����, ��õ, ������, ����, ���빮, ����, ��õ, ����, ����, ����</td>
						<td>76,000 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>���, �߱�, ����, ����</td>
						<td>81,500 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>����, ����, ���빮, ����, ����</td>
						<td>87,000 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>����, ���</td>
						<td>92,500 ��</td>
						<td class=won>�� 11,000��</td>
					</tr>
					<tr>
						<td>�߶�, ����, ����, ����</td>
						<td>92,500 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>��õ��</td>
						<td>65,000 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>������ (ǳ��, ���)</td>
						<td>65,000 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>������ (���,������)</td>
						<td>70,500 ��</td>
						<td class=won>�� 5,000��</td>
					</tr>
					<tr>
						<td>�����</td>
						<td>65,000 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>���� (����)</td>
						<td>81,500 ��</td>
						<td class=won>�� 9,000��</td>
					</tr>
					<tr>
						<td>���� (���籸)</td>
						<td>70,500��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>�ϻ��</td>
						<td>70,500 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>��õ��</td>
						<td>87,000 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>�����</td>
						<td>70,500 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>���ֽ�</td>
						<td>114,500 ��</td>
						<td class=won>�� 10,000��</td>
					</tr>
					<tr>
						<td>������</td>
						<td>103,500 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>������</td>
						<td>76,000 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>�����ֽ�</td>
						<td>114,500 ��</td>
						<td class=won>�� 12,000��</td>
					</tr>
					<tr>
						<td>����õ��</td>
						<td>114,500 ��</td>
						<td class=won>�� 11,000��</td>
					</tr>
					<tr>
						<td>������</td>
						<td>103,500 ��</td>
						<td class=won>�� 10,000��</td>
					</tr>
					<tr>
						<td>������</td>
						<td>92,500 ��</td>
						<td class=won>�� 10,000��</td>
					</tr>
					<tr>
						<td>�Ȼ�� (�ܿ���)</td>
						<td>70,500 ��</td>
						<td class=won>�� 9,000��</td>
					</tr>
					<tr>
						<td>�Ȼ�� (��ϱ�)</td>
						<td>76,000 ��</td>
						<td class=won>�� 9,000��</td>
					</tr>
					<tr>
						<td>�ȼ���</td>
						<td>147,500 ��</td>
						<td class=won>�� 15,000��</td>
					</tr>
					<tr>
						<td>�Ⱦ��</td>
						<td>76,000 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>���ֽ�</td>
						<td>98,000 ��</td>
						<td class=won>�� 11,000��</td>
					</tr>
					<tr>
						<td>�����</td>
						<td>125,500 ��</td>
						<td class=won>�� 14,000��</td>
					</tr>
					<tr>
						<td>���ν� (ó�α�)</td>
						<td>109,000 ��</td>
						<td class=won>�� 11,000��</td>
					</tr>
					<tr>
						<td>���ν� (���ﱸ,������)</td>
						<td>98,000 ��</td>
						<td class=won>�� 10,000��</td>
					</tr>
					<tr>
						<td>�ǿս�</td>
						<td>81,500 ��</td>
						<td class=won>�� 10,000��</td>
					</tr>
					<tr>
						<td>�����ν�</td>
						<td>92,500 ��</td>
						<td class=won>�� 11,000��</td>
					</tr>
					<tr>
						<td>��õ��</td>
						<td>136,500 ��</td>
						<td class=won>�� 12,000��</td>
					</tr>
					<tr>
						<td>���ֽ�</td>
						<td>92,500 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>���ֽ� (������)</td>
						<td>103,500 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
					<tr>
						<td>���ý�</td>
						<td>136,500 ��</td>
						<td class=won>�� 12,000��</td>
					</tr>
					<tr>
						<td>��õ��</td>
						<td>125,500 ��</td>
						<td class=won>�� 11,000��</td>
					</tr>
					<tr>
						<td>�ϳ���</td>
						<td>125,500 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>ȭ����</td>
						<td>103,500 ��</td>
						<td class=won>�� 10,000��</td>
					</tr>
					<tr>
						<td>ȭ���� (��ź)</td>
						<td>114,500 ��</td>
						<td class=won>�� 11,000��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>158,500 ��</td>
						<td class=won>�� 12,000��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>147,500 ��</td>
						<td class=won>�� 7,000��</td>
					</tr>
					<tr>
						<td>���ֱ�</td>
						<td>158,500 ��</td>
						<td class=won>�� 12,200��</td>
					</tr>
					<tr>
						<td>��õ��</td>
						<td>136,500 ��</td>
						<td class=won>�� 8,000��</td>
					</tr>
				</table>								
			</div><br><br>
			<div style="font-size:17px; height:30px; padding:5px; font-weight:bold; color: white; background-color: rgba(0,200,200,0.8)">��� �� ȯ�� ����</div>
			<br><div>���� ��� �ð� 3�� ���� ���� 5�ñ��� ������ �����͸� ���� ����� �� ������ ���Ŀ��� ȯ�� �Ұ����մϴ�. ������ ������ ��ð� �ܿ��� ���̿����� �����͸� ���� ����Ͻ� �� �ֽ��ϴ�.
				<ul style="list-style: none; right: 20px; position: relative; font-size: 15px ">
					<li>- ������: 1577-90xx / ��ð�: ���� 9:00~18:00</li>
					<li>- �׷���ǻ�͹� ������: 1544-71xx / ��ð�: ���� 08:00~02:00</li>
				</ul>			
			 </div>
		</div>
		<br><br>
		<div style="width: 700px; display: flex">
			<div class=div>���� ����</div>
			<div>
				<select class="op" name=reservation3 >
					<option value='noclick'>---- ���� ���� ���� ----</option>
					<option value='BReservation'>���� ��</option>
				</select>
			</div>
		</div>
		
		<div style="width: 700px; display: flex">
			<div class=div>���� ����</div>
			<div>
				<select class="op" name="carben" required oninput="setCustomValidity('')">
					<option value='PBAN'>�����̾���</option>
					<option value='RBAN'>��������</option>
				</select>
			</div>
		</div>
		
		<div style="display: flex;width: 700px; ">
			<div class=div>����� �ּ�</div>
			<div><input type="text" class="alertAc"  name="startadd"></div>
		</div>
		
		<div style="display: flex;width: 700px;">
			<div class=div>������ �ּ�</div>
			<div><input type="text" class="alertAc"  name="arriveadd"></div>
		</div> 
		
		<div  style="display: flex;width: 700px; ">
			<div class=div>���� ��¥ / �ð�</div>
			<div>
				<div class=div style="display: flex;"><input type="text" class="alertAc datepicker1"name="reservationdate"></div>
				<div >�ð� 
					<select name="reservationtime" required oninput="setCustomValidity('')">
						<%for(int i=0; i < time.length; i++){ %>
							<option value="<%=time[i]%>"><%=time[i]%></option>
						<%} %>
					</select>
				</div>
			</div>
		</div>
		<div style="display: flex">
			<div class=div>�ο���</div>
			<div>
				<select class="op" name=incunpickuppeople style="height: 20px" required oninput="setCustomValidity('')">
					<%
						for(int i=1; i <=8; i++){ %>
						<option value="<%=i%>"><%=i%></option>
					<%} %>
				</select>��
			</div>
		</div>
		<div style="display: flex">
			<div class=div>���Ϲ� ����</div>
			<div><input type="text" class="alertAc" name="baggagenum" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></div>
		</div>
		<div style="display: flex">
			<div class=div>��û ����</div>
			<div><textarea rows="14" cols="80" name="textarea3"></textarea></div>
		</div>
		<input type="button" value="�ۼ� �Ϸ�" id="submitincunpickup" style="color: white; background-color:rgba(0,200,200,0.7); width: 100px; ">
	</div>
	<input type="hidden" value="<%=session.getAttribute("userid") %>" name="valid3">
	</form>
	
	
	
	
	
	
	
	
	<form action="consulting.do" name ="baggageaction">
	<div class=baggagepop style="width: 760px; padding-top:10px; background-color: rgba(179,217,255,0.3)" >
		<input type="hidden" value="baggage" name=TT>
		<div style="width: 720px;height:400px; ;background-color: rgba(255,255,255,0.5); overflow:scroll; overflow-x:hidden; position:relative; left: 20px;">
			<div style="width:700px;">
				<p style="text-align: center; font-size: 23px; font-weight: bold;">���� �� ��� ����</p>
				<p style="color:rgba(0,200,200,0.8); text-align: center;">*��ȣ�� X ��������</p><br>
				<p style="text-align: center;">���ſ� ���� �ذ� ������ �����ϼ���. 
				���￡�� �̿��� �� �ִ� ��������� ���� ���� ���ϴ� ��ҿ��� ��������
				 �����ų�, ���׿��� ���ϴ� ��ҷ� ���� �� �ִ� �� ��� �����Դϴ�.
				  ���� ���� ���̴ٸ� �� ��� ���񽺸� �̿��� ������ �������� �����ϼ���. 
				���� ��ħ ���� ���� �ñ�ø� ���Ŀ� ���׿��� ã���� �� �ֽ��ϴ�.
				<p>
				<p style="color:red; font-weight: 500; font-size: 13px; text-align: center;">*������ X �������� ���񽺴� ���� ����� ��⵵������ �̿��Ͻ� �� �ִ� �� ���� ��Ź�帳�ϴ�.</p><br>
				<div style="background-color: rgba(0,200,200,0.8); color: white; font-weight: bold; height: 30px; padding-top: 5px;">���� �̿� �� ��� �ð�</div><br>
				<div><img src="hotelimg/Zzz.jpg"></div><br>
				<p style="font-size: 14px;">* ���� ��� ���� ����: ������, ���빮��, ���α�, �߱�, ��걸, ������, ���ʱ� (�̿� ���� ���� ��� ����)</p><br>
				<div style="background-color: rgba(0,200,200,0.8); color: white; font-weight: bold; height: 30px; padding-top: 5px;">�Ⱦ� �� ���� ��ġ</div>
				<ol>
					<li>��õ / ��������</li>
					<ul style="list-style: none; right: 40px; position: relative;" >
						<li>- ��õ���� �� 1 �͹̳�: 3�� N 19 ī���� ������ ���ǳ�� ����ũ</li>
						<li>- ��õ���� �� 2 �͹̳�: 3�� H ī���� ���� �����ù�</li>
						<li>- �������� ������: 1�� �Ա��� ��ȭ�� ��Ż ����</li>
						<li>- �������� ������: 1�� ��ü�� ������ ��ȭ�� ��Ż ����</li>
					</ul>
				</ol>
				<table class=baggagetb style="border-collapse: collapse; width: 670px;">
					<tr>
						<td>����</td>
						<td>���� ��ǰ</td>
						<td>������</td>
						<td>����(5% ���� ����)</td>
					</tr>
					<tr>
						<td rowspan="3">����</td>
						<td rowspan="2">������� �� ����</td>
						<td>28��ġ ����</td>
						<td>19,000��</td>
					</tr>
					<tr>
						
						<td>28��ġ �ʰ�</td>
						<td>28,500��</td>
					</tr>
					<tr>
						<td>������ ����</td>
						<td>1�� ����</td>
						<td>4,000��</td>
					</tr>
				</table>
				<div>
					* ������ ��� ����(�ϻ� ������ ���� �ϳ� ���� �д� ��õ �Ⱦ� ��� ���� ��õ)�� �̿��� <span>5,000��</span>�� �߰��˴ϴ�.<br>
				</div><br>
				<div style="background-color: rgba(0,200,200,0.8); color: white; font-weight: bold;  height: 30px; padding-top: 5px;">��� �� ȯ�ұ���</div><br>
				<ol>
					<li>���� ��� �ð� 3�� �� ���� 5�ñ��� ������ �����͸� ���� ����� �� ������ ���Ŀ��� �Ұ����մϴ�.</li>
						<ul style="list-style: none; right: 20px; position: relative;">
							<li>- ������: 1577-9056 / ��ð�: ���� 9:00~18:00</li>
							<li>- �������� ���� ������: 1670-7496 / ��ð�: ���� 09:30~18:30</li>
						</ul>
					<li>
					���� ����Ⱑ �Ұ��׷����� ������ ������ ���, ���� ���� �̸� ȸ�翡 ������ �� ��쿡 ���ؼ� ȯ���� �����մϴ�. �׷��� �̿� ���õ� ��� ���뵵 ������ ���� ���� ä �Ϲ�����
					 ���� ��� ��û�� ��� �ܼ��������� ������ ȯ�ҿ���� �������� �ʽ��ϴ�
					 </li>
				</ol>
				<div style="background-color: rgba(0,200,200,0.8); color: white; font-weight: bold;  height: 30px; padding-top: 5px;">��� �� �нǡ��ļ� ����</div><br>
				<ol class=damage>
					<li>�Ʒ� ��õ� ǰ���� ������ �����ϰ� �ְų� �����ϴٰ� �����Ǵ� ǰ�� ���� ����� �ź��� �� �ֽ��ϴ�.
					 ���� ���� ���ǵ��� ���� �ش� ǰ���� ��� �� �߻��� ��� ���Ͽ� ��� ������ å������ �ʽ��ϴ�.</li>
					<ul style="list-style: none; right: 20px; position: relative; font-size: 15px ">
						<li>- �� �ͱݼ�, �� ��ǰ(��, ����)</li>
						<li>- ���� �� ��������(��� ������ ��ǥ �� ����)</li>
						<li>- Ÿ�ο��� �ظ� ���� �� �ִ� ��ǰ</li>
						<li>- �ļ� ���� ��ǰ</li>
						<li>- ���м� ��ǰ</li>
						<li>- ���밡 ���� ��ǰ</li>
						<li>- ����ȭ�� ȭ�й����̳� �����ż� �Ǿ�ǰ</li>
						<li>- ������ī�޶�, ��Ʈ��, �����е� �� ���ڱ��</li>
					</ul>
					<li>���Ϲ��� ��ġ�� �� �Ǵ� <span>500,000��</span> �̻��� ��� ȸ��� ����� �ź��� �� �����Ƿ�, <span>500,000��</span>�� �ʰ��ϴ� ��� ȸ��� �� ���̿� ���� ���ǰ� �̷������ �մϴ�. ���� �������� ���� ���� ���Ƿ�<span>500,000��</span> �̻��� ���Ϲ��� ����� ��û�ϴ� ��� ȸ��� ���Ϲ��� ���Ͽ� �ִ� <span>500,000��</span>�� ���ع��å�Ӹ��� �δ��մϴ�.</li>
					<li>���Ϲ��� �н� �� �ս��� �߻��� ���<span>500,000��</span>�� �ѵ��� ���å���� �δ��մϴ�. ���Ϲ��� �н� �� �ս��� �߻��� ��� ���� �ε����� ���κ��� ������ 7�� �̳��� �н� �� �սǿ� ���� �ڷḦ �������� �����ؾ� �մϴ�. ���� �ε����� ���κ��� ������ 7�� �̳��� ȸ�翡 �н� �� �սǿ� ���� ����� ��û���� ������ ȸ��� ��� å�ӵ� �δ����� �ʽ��ϴ�.</li>
					<li>�װ�����, �ڿ�����, �׷� �� �Ұ��׷����� ������ ���Ͽ� �Ͼ �н� �� �սǿ� ���ؼ��� å������ �ʽ��ϴ�. ���������� å������ ���Ϲ��� ����� �����Ǿ� ���� ���Ϲ� ���� �װ��⿡ ž���� ��� ��������� ���� ���� ������ �̿��Ͽ� ���� �������� ���Ϲ��� ����� �帳�ϴ�.</li>
				</ol>	
			</div>
		</div><br>
		
		<div class=baggagepopsub style="margin-left: 14px;">
			<div style="display: flex">
				<div class=div>���� ����</div>
				<div>
					<select class="op" name=reservation4 required oninput="setCustomValidity('')">
						<option value='noclick'>----���� ���� ����----</option>
						<option value='reservation'>���� ��</option>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>�ñ�� ���</div>
				<div>
					<select class="op" name=entrust>
					<option value='Hotel'>ȣ��</option>
					<option value='IncunA1'>��õ���� �͹̳�1</option>
					<option value='IncunA2'>��õ���� �͹̳�2</option>
					<option value='KInternational'>������������</option>
					<option value='KDomestic'>������������</option>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>�ñ�� ��� �ּ�</div>
				<div><input type="text" class="alertAc" name=entrustadd></div>
			</div>
			
			<div style="display: flex">
				<div class=div>�ñ�� ��¥</div>
				<input type="text" class="alertAc datepicker1" name="entrustdate">
			</div>
			
			<div style="display: flex">
				<div class=div>�ñ�� �ð�</div>
				<div>
					<select class="op" name=entrusttime required oninput="setCustomValidity('')">
					<%for(int i=14; i < 31; i++){ %>
						<option value="<%=time[i]%>"><%=time[i]%></option>
					<%} %>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>�ñ�� ��� ����ó</div>
				<input type="text" class="alertAc"name="entrustphone">
			</div>
			
			<div style="display: flex">
				<div class=div>ã�� ���</div>
				<div>
					<select class="op" name="find">
					<option value='Hotel'>ȣ��</option>
					<option value='IncunA1'>��õ���� �͹̳�1</option>
					<option value='IncunA2'>��õ���� �͹̳�2</option>
					<option value='KInternational'>������������</option>
					<option value='KDomestic'>������������</option>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>ã�� ��� �ּ�</div>
				<div><input type="text" class="alertAc" name="findadd"></div>
			</div>
			
			<div style="display: flex">
				<div class=div>ã�� ��¥</div>
				<input type="text" class="alertAc datepicker1" name="findady">
			</div>
			
			<div style="display: flex">
				<div class=div>ã�� �ð�</div>
				<div>
					<select class="op" name="findtime" required oninput="setCustomValidity('')">
					<%for(int i=32; i < 42; i++){ %>
						<option value="<%=time[i]%>"><%=time[i]%></option>
					<%} %>
					</select>
				</div>
			</div>
			
			<div style="display: flex">
				<div class=div>ã�� ��� ����ó</div>
				<div><input type="text" class="alertAc" name="findphone"></div>
			</div>
			
			<div style="display: flex">
				<div class=div>�װ����</div>
				<div><input type="text" class="alertAc"name="mainapname"></div>
			</div>
			<div style="display: flex">
				<div class=div>��û����</div>
				<div><textarea rows="14" cols="80" name=textarea4></textarea></div>
			</div>
			<input type="button" value="�ۼ� �Ϸ�" id="submitbaggage" style="color: white; background-color:rgba(0,200,200,0.7); width: 100px; ">
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
        <div class="list1"> ���೻��</div><br>
        <div class="list2"> �˸� ��û ����</div><br>
        <div class="list3"> ģ�� �ʴ��ϱ�</div><br>
        <div class="list4"> ȸ������ ����</div><br>
        <div class="list5"> 1:1 �����ϱ�</div><br>
        <div class="list6"> �̿��ı�</div><br>
	</div>
	
</div>		
	<script>
			
		$(function() {
			
			$.datepicker.setDefaults({
				showOn:'both',
				buttonImage: 'hotelimg/CAL02.png',
				buttonImageOnly: true,
				dateFormat: 'yy-mm-dd',
				prevText: '���� ��',
				nextText: '���� ��',
				monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
				monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
				dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
				dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
				dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
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
			
			$("span:contains('5,000��')").css({color:"red"});
			$("span:contains('11,000��')").css({color:"red"});
			$("span:contains('500,000��')").css({color:"red"}); 
	
			
			$("#submitother").click(function(){
				var maintopmenu = $("[name='maintopmenu']").val();
				if(maintopmenu == 'other'){
					
					if($("[name='reservation1']").val()=="noclick"){
						alert("���� ������ ������ �ֽʽÿ�");
						$("input[name='reservation1']").focus();
						return false;
					}
					
					if($("[name='name']").val()==""){
						alert("������ �Է��� �ּ���");
						$("input[name='reservation1']").focus();
						return false;
					}
					
					if($("[name='textarea1']").val()==""){
						alert("��û������ �Է��� �ּ���");
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
						alert("���� ������ ������ �ֽʽÿ�");
						$("input[name='reservation2']").focus();
						return false;
					}						
					if($("[name='phone1']").val()==""){
						alert("���ڸ� �Է��� �ֽʽÿ�");
						$("input[name='phone1']").focus();
						return false;
					}
					if($("[name='phone2']").val()==""){
						alert("���ڸ� �Է��� �ֽʽÿ�");	
						$("input[name='phone2']").focus();
						return false;
					}
					if($("[name='phone3']").val()==""){
						alert("���ڸ� �Է��� �ֽʽÿ�");	
						$("input[name='phone3']").focus();
						return false;
					}
					if($("[name='phone4']").val()==""){
						alert("���ڸ� �Է��� �ֽʽÿ�");	
						$("input[name='phone4']").focus();
						return false;
					}
					if($("[name='pickuppeople']").val()==""){
						alert("�ο� ���� �Է��� �ֽʽÿ�");	
						$("input[name='pickuppeople']").focus();
						return false;
					}
					if($("[name='arrivedate']").val()==""){
						alert("���� ��¥�� �Է��� �ֽʽÿ�");	
						$("input[name='arrivedate']").focus();
						return false;
					}
					if($("[name='arrivetime']").val()==""){
						alert("���� �ð��� �Է��� �ֽʽÿ�");	
						$("input[name='arrivetime']").focus();
						return false;
					}
					if($("[name='arriveAP']").val()==""){
						alert("���� ���׸��� �Է��� �ֽʽÿ�");	
						$("input[name='arriveAP']").focus();
						return false;
					}
					if($("[name='arriveAPname']").val()==""){
						alert("���� �������� �Է��� �ֽʽÿ�");	
						$("input[name='arriveAPname']").focus();
						return false;
					}
					if($("[name='startdate']").val()==""){
						alert("��� ��¥�� �Է��� �ֽʽÿ�");	
						$("input[name='startdate']").focus();
						return false;
					}
					if($("[name='starttime']").val()==""){
						alert("��� �ð��� �Է��� �ֽʽÿ�");	
						$("input[name='starttime']").focus();
						return false;
					}
					if($("[name='startAP']").val()==""){
						alert("��� ���׸��� �Է��� �ֽʽÿ�");	
						$("input[name='startAP']").focus();
						return false;
					}
					if($("[name='startAPname']").val()==""){
						alert("��� �װ����� �Է��� �ֽʽÿ�");	
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
						alert("���� ������ ������ �ֽʽÿ�");
						$("input[name='reservation2']").focus();
						return false;
					}						
					if($("[name='startadd']").val()==""){
						alert("����� �ּҸ� �Է��� �ֽʽÿ�");
						$("input[name='startadd']").focus();
						return false;
					}
					if($("[name='arriveadd']").val()==""){
						alert("������ �ּҸ� �Է��� �ֽʽÿ�");
						$("input[name='arriveadd']").focus();
						return false;
					}
					if($("[name='reservationdate']").val()==""){
						alert("���� ��¥�� �Է��� �ֽʽÿ�");
						$("input[name='reservationday']").focus();
						return false;
					}
					if($("[name='baggagenum']").val()==""){
						alert("���Ϲ� ������ �Է��� �ֽʽÿ�");
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
						alert("���� ������ ������ �ֽʽÿ�");
						$("input[name='reservation2']").focus();
						return false;
					}						
					if($("[name='entrustadd']").val()==""){
						alert("�ñ�� �ּҸ� �Է��� �ֽʽÿ�");
						$("input[name='entrustadd']").focus();
						return false;
					}
					if($("[name='entrustdate']").val()==""){
						alert("�ñ�� ��¥�� �Է��� �ֽʽÿ�");
						$("input[name='entrustdate']").focus();
						return false;
					}
					if($("[name='entrustphone']").val()==""){
						alert("�ñ�� �ּ� ����ó�� �Է��� �ֽʽÿ�");
						$("input[name='entrustphone']").focus();
						return false;
					}
					if($("[name='findadd']").val()==""){
						alert("ã���� �ּҸ� �Է��� �ֽʽÿ�");
						$("input[name='findadd']").focus();
						return false;
					}
					if($("[name='finddate']").val()==""){
						alert("ã���� ��¥�� �Է��� �ֽʽÿ�");
						$("input[name='finddate']").focus();
						return false;
					}
					if($("[name='findphone']").val()==""){
						alert("ã���� �ּ� ����ó�� �Է��� �ֽʽÿ�");
						$("input[name='findphone']").focus();
						return false;
					}
					if($("[name='mainapname']").val()==""){
						alert("�װ������ �Է��� �ֽʽÿ�");
						$("input[name='mainapname']").focus();
						return false;
					}
				}
				baggageaction.submit();
			});
			
		});
		
		 //���� �ؾߵɰ� Ŭ������ �ٲ㼭 �ϱ�
	</script>
	
</body>
</html>