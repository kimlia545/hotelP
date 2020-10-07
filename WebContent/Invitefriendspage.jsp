<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,hotel.HotelDAO,hotel.HotelDTO,hotel.mypage.RecommendedpersonDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.wrap{width: 1300px;}
	.main{
			margin: 0;
			width: 1000px;
			padding-left:300px;
		}
	.top{
			border-bottom: 2px solid black;
			display: flex;
			height: 50px;
		}
		
	.friend{
			padding-top: 10px;
			font-size: 10px;
		}
		
	.top_up{
			font-weight: bolder;
			font-size: 20px;
		}
		
	.mid{
			padding-top: 20px;
			display: flex;
			margin: 20px;
		}
	.mid_left{
			color: steelblue;
			padding-right: 30px;
		}
		
	.mid_right{
			font-size: 13px;
		}
		
	table.type11 {
    	border-collapse: separate;
    	border-spacing: 1px;
    	text-align: center;
    	line-height: 1.5;
    	margin: 20px 10px;
		}
		
	table.type11 th {
    	width: 155px;
    	padding: 10px;
    	font-weight: bold;
    	vertical-align: top;
    	color: #fff;
    	background: rgba(0,200,200,0.5) ;
		}
		
	table.type11 td {
    		width: 155px;
    		padding: 10px;
    		vertical-align: top;
   		 	border-bottom: 1px solid #ccc;
    		background: #eee;
		}

	.bottom_down{
			display: flex;
			margin: 10px;
		}
	#btn1{
			background-color: black;
			color: white;
			width: 250px;
			height: 35px;
			font-size: 18px;
			margin-right: 20px;
			padding-left: 20px;
		}
	#lab1{
			margin: 5px;
		}
	.glyph{
			position: relative;
			left: 60px;
			pointer-events: none; 
			color: white;
		}
	.main_right{
        padding-top: 18px;
        margin-left: 30px;
		width: 300px;
		
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


</style>
</head>
<body>
<%
	String sessionuserid=(String)session.getAttribute("userid");
	String sessionceoid=(String)session.getAttribute("ceoid");
%>
<div  class="wrap"style="display: flex;">
<div class="main">
	<div class="top">
		<div class="top_up"><i class="fas fa-angle-right"></i>  ģ�� �ʴ��ϱ�</div> 
		&nbsp;&nbsp;<span class="friend">ģ���� �ʴ��� ������</span>
	</div>
	<div class="mid">
		<div class="mid_left">
			<img src="hotelimg/invite_friends_icon.png">
		</div>
		<div class="mid_right">
			�������� ���� ȣ�� �ҽİ� �پ��� ������ �ٸ� �е�� ������ ��������?<br>
			���� �Ʒ� ��ũ�� ģ���� �����ϼ���!<br>
			�ʴ� ��ũ�� ���� ������ ģ������ ��� ������ 25,000���� �帳�ϴ�.<br>
			ģ���� ��ũ�� ���� ���� �� �� �� �̳� ó������ �����ϸ�,<br>
			üũ�ƿ� ���� �� ���Ե� 25,000���� �������� ���� �� �ֽ��ϴ�.<br>
			�� ���� �����ϰ� �� ���� �������� ��ƺ�����!<br>
		</div>
	</div>
	<div>���� ��õ�� ���</div>
	<table class="type11">

		<tr>
			<th scope="cols">�� ���̵� </th>
			<th scope="cols">��õ �� </th>
			<th scope="cols">�ð� </th>
		</tr>
		<%
			String codeid="";
			HotelDAO dao =new HotelDAO();
			if(sessionceoid==null){
				Vector<RecommendedpersonDTO> recommended =dao.Recommendedselect(sessionuserid);
					for(int i=0; i<recommended.size(); i++){
				if(recommended.get(i).getRecommendedin()!=null){
		%>
			
			<tr>			
				<td><%=recommended.get(i).getRecommendedin()%></td>
				<td><%=recommended.get(i).getRecommendedout()%></td>
				<td><%=recommended.get(i).getTime()%></td>  
			</tr>
		<%}}}else if(sessionuserid==null){
			
			Vector<RecommendedpersonDTO> recommended =dao.Recommendedselect(sessionceoid);
				for(int i=0; i<recommended.size(); i++){
				if(recommended.get(i).getRecommendedin()!=null){
					
				%>
			<tr>			
				<td><%=recommended.get(i).getRecommendedin()%></td>
				<td><%=recommended.get(i).getRecommendedout()%></td>
				<td><%=recommended.get(i).getTime()%></td>  
				
			</tr>
		<%}}} %>
	</table>
	
	<div class="bottom_down">
		<div style="margin-top: 100px;">
		<%if(sessionceoid==null){ 
			Vector<RecommendedpersonDTO> recommended =dao.Recommendedselect(sessionuserid);%>
			<a id="p1"><%=recommended.get(0).getCodes()%></a>
		<%}else{ 
			Vector<RecommendedpersonDTO> recommended =dao.Recommendedselect(sessionceoid);%>
			<a id="p1" ><%=recommended.get(0).getCodes()%></a>
		<%}%>
			
			
			<%-- <label id="lab1""><%=recommended.get(0).getCodes()%></label> --%>
			<span><i class="fas fa-link glyph"></i></span>
			
			<button id="btn1"  onclick="copyToClipboard('#p1')">�ڵ� ����</button>
		</div>
	</div>
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
</div>
	<script>
		function copyToClipboard(element) {
		var $temp = $("<input>");
		  $("body").append($temp);
		  $temp.val($(element).text()).select();
		document.execCommand("copy");
		  $temp.remove();
		alert("���� �Ǿ����ϴ�.");
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