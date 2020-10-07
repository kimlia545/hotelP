<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,hotel.HotelDAO,hotel.HotelDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	
	#typeid{
		cursor: pointer;
	}
	.main_right{
        padding-top: 18px;
		width: 300px;
		position: absolute;
        color: rgba(0,0,0,0.7);
		left: 850px;
	}
    .mypage{
        padding-bottom: 20px;
        font-size: 20px;
        color: black;
        font-weight: bolder;
    }
    .main_right>div:hover{
		color : dodgerblue;
		cursor : pointer;
	}


    
	/* .img{
		position :fixed;
		z-index: -1;
		opacity: 0.5;
		width: 790px;
	} */
</style>
</head>
<body>
	<form action="QnApageproc.do">
	<div style="display: flex;">
	<div style="width: 800px; position: relative;">
		
		<p style="text-align: center; font-size: 23px; height:5px;">�����ϱ� �� ���ǳ��� Ȯ��</p><br>
		<p style="font-size:12px; color: rgba(100,100,100,0.7); text-align:center; position: relative; bottom:30px;">�����Ͻ� ���ڿ� �°� ���̵� Ŭ�� �󼼺��� ����</p>
		
		<table style="border-spacing:0px 5px; width: 800px; text-align: center; border:1px solid black; border-left: none; border-right: none;">
			<tr style="border-top: none;border-bottom: 2px solid black; border-collapse: collapse; border-left: none; border-right: none;">
				<td >��ȣ</td>
				<td>���� ����</td>
				<td>���� �Ͻ� ���̵�</td>
				<td>ó�� ����</td>
				<td>���� ����</td>
			</tr>
			
			<%
		
			HotelDAO dao =new HotelDAO();
			Vector<HotelDTO> mypagetotal = dao.selectmypagetotal();
			
				for(int i=0; i<mypagetotal.size(); i++){ 
			%>
			
		<tr>			
			<td style="border-top: 1px solid black; border-bottom: 1px solid black; "><%= mypagetotal.get(i).getIdx()%></td>
			<td style="border: 1px solid black;"><%= mypagetotal.get(i).getType()%></td>
			<td style="border:1px solid black; border-left:none;" id="typeid" onclick="idxInformation('<%= mypagetotal.get(i).getIdx()%>,<%= mypagetotal.get(i).getType()%>,<%= mypagetotal.get(i).getTypeid()%>')"><%= mypagetotal.get(i).getTypeid()%></td>
			<td style="border:1px solid black; border-left:none;"><%= mypagetotal.get(i).getProcess()%></td> 
			<td style="border-top: 1px solid black; border-bottom: 1px solid black;"><%= mypagetotal.get(i).getTime()%></td> 
		</tr>
		
		<%} %>
		
		</table>
		<br><br><br><br>
		<input type="submit" value="�� ����" style="left: 90%; position: relative; top: -10px;">
		<input type="hidden" id="id"  value="<%=session.getAttribute("userid")%>">
	</div>
	<div class="main_right">
	    <div class="mypage">
	       <div class="list0">MY PAGE</div>
	       <hr>
	    </div>
        <div class="list1">���೻�� �� �̿��ı�</div><br>
        <div class="list2">���� �� ��ȸ</div><br>
        <div class="list3">ȸ������ ����</div><br>
        <div class="list4">��õ ����</div><br>
	</div>
	</div>
	</form>
	
	
	<script type="text/javascript">
		
			function idxInformation(idx,type,id){
			var val = idx.split(",");
			var ids =document.getElementById('id').value;
			var box =document.getElementById('typeid');
			box.style.backgroundColor="rgba(0,200,200,0.8)";
			
			 if(ids==val[2]){
				location.href="BoardInformation.do?idx="+idx+"&type="+type;
			}else{
				alert("�߸��� ���� �Դϴ�.");
			}
			
		}
			
	</script>
	
		
	<script>
$(function(){
  $('.list0').click(function(){
    location.href = "mypage.do";
  });
  $('.list1').click(function(){
	    location.href = "historypage.do";
  });
  $('.list2').click(function(){
	    location.href = "QnApage.do";
  });
  $('.list3').click(function(){
	    location.href = "loginupdate.do";
 });
  $('.list4').click(function(){
	    location.href = "Invitefriends.do";
 });
 
});
	</script>
	
</body>
</html>