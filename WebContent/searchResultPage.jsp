<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hotel.search.*, java.util.* ,hotel.ceo.*, hotel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
		*,html,body{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			}
		.wrap{
			width: 100%;
		}
		.header{
			background-color: rgba( 234, 232, 224,0.9);
			padding-top: 20px;
			border: 1px solid black;
			border-radius: 5px;
			width: 1150px;
			height: 100px;
			display: flex;
			margin: 0 auto;
			margin-top: 80px;
			justify-content: space-around;
		}
		.body{
			width: 1150px;
			display: flex;
			margin: 0 auto;
		}
		.aside1_1{
			font-size: 17px;
			font-weight: bolder;
		}
		.aside1_2{
			color: dodgerblue;
			font-size: 14px;
		}
		.aside1_3{
			border: 1px solid gray;
			border-radius: 10px;
			text-align: center;
			padding: 2px;
			background-color: white;
			width: 70px;
			height: 30px;
			color: dodgerblue;
		}
		.aside1_4{
			padding-top: 5px;
			padding-bottom: 5px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.1);
			font-size: 13px;
		}
		.aside2{
			padding-top: 5px;
			padding-bottom: 5px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		}
		.aside3{
			padding-top: 5px;
			padding-bottom: 5px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		}
		.aside4{
			padding-top: 5px;
			padding-bottom: 5px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		}
		.aside5{
			padding-top: 5px;
			padding-bottom: 5px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		}
		.aside6{
			padding-top: 5px;
			padding-bottom: 5px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		}
		.aside7{
			padding-top: 5px;
			padding-bottom: 5px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		}
		.aside8{
			padding-top: 5px;
			padding-bottom: 5px;
			font-size: 13px;
		}
		.filter{
			color: dodgerblue;
			font-weight: bolder;
		}
		aside{
			width: 200px;
			background-color: rgba(245,244,240,0.9); 
			padding: 10px;
		}
		section{
			width: 935px;
			margin-left: 10px;
		}
		.search{
			font-size: 20px;
			font-weight: bold;

		}
		.title_right{
			cursor: pointer;
			padding-top: 30px;
		}
		.title{
			padding-bottom: 5px;
		}
		.article1_1{
			font-size: 20px;
			font-weight: bolder;
			padding-top: 5px;
			padding-bottom: 5px;
		}
		.article1{
			width: 935px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.3);
			padding-bottom: 10px;
			position: relative;
			height: 70px;
		}
		li{
			list-style: none;
		}
		.article1_2>ul{
			display: flex;
			justify-content: space-between;
		}
		.article1_2 li{
			position: relative;
		}
		.article1_2>ul>li>ul{
			height: 0;
			position: absolute;
			overflow: hidden;
			transition: height 0.5s;
			background-color: white;
		}
		.article1_2>ul>li:hover>ul{
			width: 80px;
			height: 100px;
		}
		.cancleinfo{
			margin-top: 10px;
			margin-bottom: 10px;
			background-color: rgb(218,233,204);
			height: 70px;
			padding: 10px;
			border-radius: 5px;
		}
		.cancleinfo1{
			color: green;
			font-weight: bolder;
		}
		.article2{
			width: 935px;
			border-radius: 4px;
			border: 1px solid rgba(0, 0, 0, 0.1);
			margin-bottom: 10px;
		}
		.article1_2{
			justify-content: space-around;
		}
		.article2:hover{
			background-color: rgb(233,240,250);
			border: 1px solid skyblue;
			box-shadow: 2px 2px rgb(167,194,235);
			border-radius: 4px;
		}
		.article2_title{
			display: flex;
			justify-content: space-between;
		}
		.article3{
			padding-bottom: 50px;
			padding-top: 10px;
		}
		.article3_2{
			font-weight: 100;
			font-size: 13px;
		}
		.title{
			color: royalblue;
			font-weight: bolder;
			text-decoration: underline;
			font-size: 20px;
		}
		.price{
			font-size: 12px;
		}
		.address{
			color: royalblue;
			font-weight: bolder;
			text-decoration: underline;
		}
		span{
			color: royalblue;
			font-weight: bolder;
			text-decoration: underline;
		}
		.ad{
			color: green;
			font-weight: bolder;
		}
		.icon{
			display: inline;
			color: rgb(254,186,2);
		}
		.iconGrey{
			display: inline;
			color: rgb(100,100,100);
		}
		.note{
			border: 1px solid black;
			background-color: darkgray;
		}
		.score1{
			color: royalblue;
			font-size: 17px;
			display: flex;
		}
		.score3{
		text-align: center;
			background-color: cornflowerblue;
			color: white;
			width: 26px;
			height: 26px;
			padding: 1px;
		}
		.price2{
			font-weight: bolder;
			font-size: 18px;
		}
		.price4{
			color: green;
			font-weight: bolder;
			padding-bottom: 10px;
		}
		.choice{
			padding-left: 100px;
		}
		.time{
			background-color: darkgray;
		}

		.title_left{
			padding-top: 35px;
			padding-right: 40px;
		}
		footer{
	        background-color: black;
	        color: gainsboro;
	        height: 270px;
	        width: 100%;
	        background: linear-gradient(
	            to bottom,
	            rgba(0, 0, 0, 0.80) 20%,
	            rgba(0, 0, 0, 0.85) 60%,
	            rgba(0, 0, 0, 0.9) 80%
	          );
		}
		.footer{

			color: gainsboro;
			height: 270px;
			width: 100%;
			
			height: 270px;
			width: 1150px;
			margin: 0 auto;
		}
		.footer_up{
			display: flex;
			padding: 30px;
		}
		.footer_bottom{
			display: flex;
		}
		.footer_right{
			padding-left: 285px;
		}
		.left_mid{
			padding-top: 10px;
			padding-left: 10px;
		}
		.button{
			background-color: rgba(21,107,193,1);
			color: white;
			border: none;
			font-size: 17px;
			width: 40px;
			border-radius: 5px;
			box-shadow: 2px 2px black;
		}
		.footer_bottom1{
			padding-left: 40px;
		}
		.footer_bottom2{
			padding-left: 120px;
		}
		.botton:hover{
			background-color: cornflowerblue;
		}
		td{
			padding: 5px;
		}

		#slider-range{
			width:190px;
		}
	 	.showbox{
			width: 200px;
			height: 200px;
			position: relative;
		   overflow: hidden;
		}
		.box{
			width: 800px;
			height: 200px;
			position: absolute;
			display: flex;
		}
		.box>div{
			width: 200px;
			height: 200px;
			background-size: cover;
		}
		.btn1{
			/*���ڰ� Ŭ ���� ���� �ö����, ���ڰ� ���� ���� �Ʒ��� �������ϴ�*/
			z-index: 10;
			position: absolute;
			left: 0;
			top: 80px;
			width: 40px;
			height: 40px;
			display: none;
		}
		.btn2{
			z-index: 10;
			position: absolute;
			right: 0;
			top: 80px;
			width: 40px;
			height: 40px;
			display: none;
		}
		.heart{
			width: 100%;
			height: 100%;
			
			z-index: 10;
			top: 5px;
			right: 5px;
			cursor: pointer;
		}
		#topheader{
			width: 100%;
			height: 80px;
			position: fixed;
			top: 0;
			left: 0;
			z-index: 5;
			background-color: rgba(0,0,0,0.7);
		}
		/*�ΰ�*/
		#hotellogo{
			cursor:pointer;
			background-size:contain;
			background-repeat: no-repeat;
			margin: 20px auto;
			padding-bottom: 10px;
			width: 270px;
			height: 70px;
		}
		.whiteLogo{
			background-image: url(img/logo_white.png);
		}
		.nowLogin{
			position: absolute;
			width: auto;
			height: 35px;
			right: 2%;
			top: 25%;
		}
		/*�α��ι�ư*/
		.popLogin{
			cursor:pointer;
			position: absolute;
			width: 80px;
			height: 35px;
			
			border: 1px solid white;
			background-color: transparent;
			
			right: 2%;
			top: 25%;
			
			color: white;
		}
		/*�α׾ƿ�/���������� ��ư*/
		.topbtnframe{
			cursor:pointer;
			width: 80px;
			height: 35px;
			border: 1px solid white;
			background-color: transparent;
			
			color: white;
		}
		/* �α��� ���â */
		.modal{
			position: fixed;
			width: 100%;
			height: 100vh;
			top: 0;
			left: 0;
			background-color: rgba(0,0,0,0.3);
			display: none;
			z-index: 5;
		}
		#modalLogin{
			opacity: 0;
			display: flex;
			width: 750px;
			height: 500px;
			margin: 0 auto;
			background-color: white;
			position: absolute;
			left: 25%;
			top: 25%;
			z-index: -20;
		}
		.pageleft{
			width: 375px;
			margin: 40px;
			line-height:500%;
		}
		.ment{
			text-align: center;
			line-height:150%;
			font-size: 20px;
			padding-bottom: 30px;
			padding-top: 30px;
		}
		#id{
			width: 240px;
			height: 40px;
			background-color: rgba(244,244,244,0.9);
			border-style: none;
			padding: 5px 10px;
			font-size: 15px;
			margin-bottom: 10px;
		}
		#pw{
			width: 240px;
			height: 40px;
			background-color: rgba(244,244,244,0.9);
			border-style: none;
			padding: 5px 10px;
			font-size: 15px;
			margin-bottom: 15px;
		}
		#login {
			width: 260px;
			height: 45px;
			
			margin-top: 5px;

			font-size: 15px;
			text-transform: uppercase;
			letter-spacing: 2.5px;

			color: #fff;
			background-color: #2EE59D;
			border: none;
			border-radius: 5px;
			box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
			transition: all 0.3s ease 0s;
			cursor: pointer;
			outline: none;
			font-weight: bold;
		}
		#login:hover {
			background-color: #fff;
			color: #2EE59D;
			box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.2);
		}
		#pw+div{
			margin-top:10px;
			font-size: 13px;
		}
		.pageright{
			width: 375px;
			background-color: rgba(244,244,244,0.9);
			position: relative;
		}
		#btn{
			cursor:pointer;
			position: absolute;
			top: 10px;
			right: 10px;
			font-size: 25px;
			color: #aaa;
		}
		#join{
			position: relative;
			top: 18px;
			left: 13%;
			width: 260px;
			height: 45px;
			
			font-size: 15px;
			text-transform: uppercase;
		  	letter-spacing: 2.5px;
			
			color: #fff;
			background-color: deepskyblue;
			border: none;
			border-radius: 5px;
			box-shadow: 0px 8px 15px rgba(31, 195, 255, 0.5);
			transition: all 0.3s ease 0s;
			cursor: pointer;
			outline: none;
			font-weight: bold;
		}
		#join:hover {
		  background-color: #fff;
		  box-shadow: 0px 8px 15px rgba(31, 195, 255, 0.2);
		  color: deepskyblue;
		}
		.pageright_top{
			margin-top: 68px;
			text-align: center;
			font-size: 20px;
		}
		.pageright_mid{
			font-size: 12px;
			text-align: center;
			padding-top: 10px;
			padding-bottom: 10px;
		}
		.pageright_bottom>table{
			margin: 0 auto;
			line-height: 175%;
		}
	</style>
</head>
<body>	
	<%
		// ����, ���̵�/��й�ȣ �Է¿� �������� ��쿡 login����� �ѵα� ���� �̸� ���� �޾Ƶд�.
		// �� ���� �ϴܿ��� ���ϴ�
		Object is_loginSuccess= request.getAttribute("wrong");
	
		if(is_loginSuccess != null){%>
			<script>alert("�������� ���� ���̵��̰ų�, �߸��� ��й�ȣ�Դϴ�.");</script>
		<%}
		Vector<HTDataDTO> member = (Vector<HTDataDTO>)request.getAttribute("searchResult");

		String exRoom = "";
		//������� 1���� ���´ٸ� ���ܹ�(���� �Ұ����� ��)�� �����Ѵ�.
		if(member.size() != 0){
			Vector<Integer> exceptRoom = member.get(0).getExceptRoom();
			//����Ұ����� ���� �����Ѵٸ� /�� �����ڷ� �߰��صд� 
			for(int i=0; i<exceptRoom.size(); i++){
				exRoom = exRoom + exceptRoom.get(i)+"/";
			}
		}
		//searchAction���� ���ǿ� �����ߴ� ���� ����ش�
		HTSearchDTO searchDto = (HTSearchDTO)session.getAttribute("searchInfo");
		session.setAttribute("searchResult", member);
	%>
	
	<div class="wrap">
	
		<!-- �ΰ� �� �α��� ó�� -->
		<div id="topheader">
			<div id="hotellogo" class="whiteLogo"></div>
	
			<%if(session.getAttribute("userid") != null){ %>	
				<form action="logoutpage.do" class="nowLogin">
					<%-- <%=session.getAttribute("userid") %>�� �ݰ����ϴ�. --%>
					<input type="button" value="My Page" class="topbtnframe" onclick="goMypage()">
					<input type="submit" value="Logout" class="topbtnframe"><br>
					<input type="hidden" name="thisPage" value="search">
				</form>
			<%}else{%>
				<input type="button" value="Login" class="popLogin">
			<%} %>
		</div>
	    <header>
	    
	    <!-- �α��� ��ư ������ �ÿ� ������� ���â -->
	    <div id="modalLogin">
				<div class="pageleft">
						<div class="info">
							<div class="ment">
								���� �α����ϰ�<br> ȸ�� ���� Ư���� �����ϼ���!
							</div>
							<hr>
							<div class="ment">
								<form action="loginpage.do" method=post>
									<input type="text" placeholder="���̵�" id="id" name="id"> 
									<input type="text" placeholder="��й�ȣ" id="pw" name="pw">
									<div>��й�ȣ�� ��ﳪ�� ��������? <a href="Find.jsp">���⼭ </a>�缳�� �ϼ���.</div>
									<input type="submit" value="�α���" id="login">
									<input type="hidden" name="thisPage" value="search">
								</form>
							</div>
							
						</div>
				</div>
				<div class="pageright">
					<div class="modalLoginExit" id="btn">
						<i class="fas fa-times-circle"></i>
					</div>
					<div class="pageright_top">������ ȸ���� �ƴϽŰ���?</div>
					<div class="pageright_mid">
						<b>ȸ������</b> �� ������ ��� <br>
						ȣ���� <b>������</b>�� �����غ�����.
						<hr style="width: 280px; margin-top: 24px; margin-left:auto; margin-right:auto;">
					</div>
					<div class="pageright_bottom">
						<table>
							<tr>
								<td><i class="fas fa-concierge-bell"></i></td>
								<td>ȣ�� ��� �˸� ����</td>
							</tr>
							<tr>
								<td><i class="fas fa-suitcase-rolling"></i></td>
								<td>ȸ�� ���� Ư��</td>
							</tr>
							<tr>
								<td><i class="fas fa-search-dollar"></i></td>
								<td>������ Ư�� ��ǰ</td>
							</tr>
							<tr>
								<td><i class="fas fa-users"></i></td>
								<td>ģ���� ���ø���Ʈ ����</td>
							</tr>
							<tr>
								<td><i class="fas fa-hotel"></i></td>
								<td>�ֱ� �˻� ��� Ȯ��</td>
							</tr>
						</table>
					</div>
					<input type="button" value="ȸ������" id="join" onclick="signup()">
				</div>
			</div>	
		<div class="modal"></div>
	   
	    
	    
	    <form>
		     <div class="header">
		       <div class="location">
		        ������, ���� �ü� �Ǵ� ���帶ũ <br>
		        <input type="text" name="location" value="<%= searchDto.getLocation()%>">
		       </div>
		       <div class="checkin">
		        üũ�� <br>
		        <input type="text" name="checkIn" value="<%= searchDto.getCheckIn()%>">
		       </div>
		       <div class="checkout">
		         üũ�ƿ� <br>
		         <input type="text" name="checkOut" value="<%= searchDto.getCheckOut()%>">  
		       </div>
		       <div class="room">
		           �ο� <br>
		          <input type="text" name="personnel" value="<%= searchDto.getNum()%>">
		       </div>
		       
		       <div class="btn">
		        <input type="submit" value="�˻�" class="button">
		       </div>
		      </div>
		   </form> 
		</header>
		
		<div class="body">
	        <aside>
		          <div class="aside1">
		              <div class="aside1_1">
		                  �˻� ��� ���͸�:
		              </div>
		              <div class="aside1_2">
		                  ���� ��� �����  
		              </div>
		              <div class="aside1_3">
		                 <i class="fas fa-times"></i>5����
		              </div>
		              <div class="aside1_4">
		                  2,326�� ȣ�� ���� �� ����Ʈ
		              </div>
		          </div>
		          <div class="aside2">
		              <i class="fas fa-chevron-down"></i>�˻��� �̸�
		              <input type="search" placeholder="���� �ü� �̸�"><i class="fas fa-arrow-circle-right"></i>
		          </div>
		          <div class="aside3">
		              <ul><i class="fas fa-chevron-down"></i>�α�����</ul>
		                  <li>�����ħ�Ļ�</li>
		                  <li>������</li>
		                  <li>����WiFi</li>
		                  <li>����(����)</li>
		          </div>
		          <div class="aside4">
		              <i class="fas fa-angle-down"></i>��� �� ���� <br>
		              <input type="checkbox" name="cancle" value="cancle">�������
		          </div>
		          <div class="aside5">
		              ���� <br>
		              <div class="stars">
		           		 <img src="SearchResource/star_gray.png" class="star">
		           		 <img src="SearchResource/star_gray.png" class="star">
		           		 <img src="SearchResource/star_gray.png" class="star">
		           		 <img src="SearchResource/star_gray.png" class="star">
		           		 <img src="SearchResource/star_gray.png" class="star">
		              </div>
		          </div>
		          <div class="aside6">
		              ��������
		          </div>
		          <div class="aside7">
		              ����
		
		            <p></p>
		             <input type="text" id="amount" readonly style="border:0; color:black; font-weight:bold; background-color: rgba(245,244,240,0.9);">
		            <div id="slider-range"></div>
		            
		          </div>
		          <div class="aside8">
		              Hotels.com���� Ư�� ���� <br>
		              <i class="fas fa-check"></i>Hotels.com���� ��� �����ᰡ ���� <br>
		              <i class="fas fa-check"></i>���� ���� <br>
		              <i class="fas fa-check"></i>��ȭ �� ������ ������ ����:
		              02-3483-5360
		          </div>
	        </aside>
        <section>
           <div class="article1">
               <div class="article1_1">
                   ����, �ѱ�
                </div>
            </div>
                <div class="cancleinfo">
                   <div class="cancleinfo1">
                   <i class="fas fa-location-arrow"></i>
                    ���� ��ҷ� ��ȹ ���浵 �����ϰ�!
                    </div>  
                    ��ȹ ���濡�� �Ƚ��� �� �ֵ��� ����� ����� �� �ִ� ���� �ü� ������ �����մϴ�.
                </div>
            
            <!--========================================================================-->
            <%
	            String ceoids=(String)session.getAttribute("ceoid");
				CeoDAO dao = new CeoDAO();
				Vector<HotelmainimgDTO> hotelmainimg =dao.hotelmainimg(ceoids);
			%>
            <!-- �˻������ �����Ѵٸ� -->
            <%if(member.size() != 0){%>
            	<form action="HotelDetails.do" name="SearcchForm" method="post">
					<% for(int i=0; i<member.size(); i++){%>
						<div class="article2">
			               <div class="article2_title">
			                <div class="showbox">
								<img src=<%=StaticValue.saveFolder%>/<%=hotelmainimg.get(0).getHotelfilname()%> class="heart">
								<div class="box">
									<div style="background-image: url(SearchResource/hilton.jpg);"></div>
								</div>
								<img src="SearchResource/leftArrow.png" class="btn1">
								<img src="SearchResource/rightArrow.png" class="btn2">
							</div>
			                 <div class="title_right">
			                 	<input type="hidden" value="<%=member.get(i).getIdx() %>" class="hotelIdx">
			                   <div class="title">
			                    <%= member.get(i).getName() %>
			                   </div>
			                   <!-- ����� -->
			                   <div class="icon">
				                   <%for(int j=0; j < member.get(i).getGrade(); j++){ %>
				                	   <i class="fas fa-star"></i>
				                  <%}%>
			                    </div>
			                    <!-- ȸ���� -->
			                    <div class="iconGrey">
				                   <%for(int j=0; j < (5-member.get(i).getGrade()); j++){ %>
				                	   <i class="fas fa-star"></i>
				                  <%}%>
			                    </div>
			                    <!-- 4�� �̻��� ȣ�ڿ� ���� -->
			                    <% if(member.get(i).getGrade() >= 4){ %>
			                    	<div class="icon">
			                       		<i class="fas fa-thumbs-up"></i>
			                  		 </div>
			                    <% } %>
			                   
			                   <div class="address">
			                   <%= member.get(i).getAddress() %>
			                   </div>
			                   <div class="room">
			                    	<%-- <%=room.get(i).getRoomType() %> --%>
			                       <i class="fas fa-user"></i>
			                       <i class="far fa-user"></i>
			                   </div>
			                   <div class="bed">
			                      	 ħ�� 1��(�ʴ��� ����ħ�� 1��)
			                   </div>
			                   <div class="ad">
			                       ��� ������ �Ƚ� ����! ���� ������ ������� �����غ�����.
			                   </div>
			                 </div>
			                 <div class="title_left">
			                  <div class="score">
			                   <div class="score1">
			                       <div class="score1_1">
									<%if(member.get(i).getGrade() >= 4.5f){%>
										�ſ�����
									<%}else if(member.get(i).getGrade() >= 3.5f){%>
										����
									<%}else if(member.get(i).getGrade() >= 2.5f){%>
										����
									<%}else if(member.get(i).getGrade() >= 1.5f){%>
										����
									<%}else{%>
										�ſ� ����
									<%}%>
			                       	 &nbsp;
			                       </div>
			                       <div class="score3">
			                       	<%= member.get(i).getGrade() %>
			                   	   </div>
			                   </div>   
			                   <div class="score2">
			                       ----�� �̿� �ı�
			                       
			                   </div>
			                   </div>
			                   <div class="price">
			                      <div class="price1">
			                           1��, ���� 1��
			                       </div>
			                       <div class="price2">
			                          <%--  &#36;<%=room.get(i).getRoomPrice() %> --%>
			                       </div>
			                       <div class="price3">
			                           	���� �� ��Ÿ ��� ����
			                       </div>
			                       <div class="price4">
			                          	 �������
			                           	������ �ʿ� ����
			                       </div>
			                   </div>
			                 </div>
			               </div>
			            </div>
				
					<%}
				}%>
			
				<input type="hidden" name="exceptRoom" value="<%= exRoom%>">
				<input type="hidden" name="HotelIdx" id="myHotelIdx">
            </form>
            
            
            
            

            <!--========================================================================-->
            
            <div class="article3">
               <div class="article3_1">
                   �� ���� ȣ���� ���ðھ��? <span>����, �ѱ��� ���� ���� ȣ�� ��� ����</span>
               </div>
               <div class="article3_2">
                    �޸� ������� �ʴ� �� ��� ������ ���Ǵ� 1�� �����Դϴ�. 
                    ���� ���ݰ� ���� ����� ������ �ݾ��̸� �̿� ��Ȳ�� ���� ���� ���� ���ΰ� �޶����ϴ�.
                    <br>
                    * ���� �׾��� ����� �� ���� �ü����� �����Ͽ� �����ϴ� ǥ�� ����Դϴ�. 
                    ���� �񱳴� ���� 30�ϰ� �� ���� �ü��� ����� �������� �մϴ�.
               </div>
            </div>

        </section>
        </div>
    </div>
    
    <footer>
      <div class="footer">
       <div class="footer_up">
            <div class="footer_left">
                <div class="left_up">
                   <table>
                        <tr>
                           <td><i class="fas fa-h-square"></i>������ �Ұ�</td>
                           <td><i class="fas fa-bullhorn"></i>���� ����</td>
                           <td><i class="fas fa-question"></i>���� ���� ����</td>  
                        </tr>
                        <tr>
                           <td><i class="far fa-file-alt"></i>�̿� ���</td>
                           <td><i class="fas fa-lock"></i>����������޹�ħ</td>
                           <td><i class="fas fa-user-friends"></i>���� ä��</td>
                        </tr>
                    </table>
                </div>
                <div class="left_mid">
                   <i class="fas fa-map-marker-alt"></i>
                    �α� ������     Ǫ�� �ٳ�
                </div>
            </div>
            <div class="footer_right">
                contact <br>
                ��ȭ: 1577 - 9056    |   �̸���: info@evasion.co.kr <br>
                ������ ������ � �ð�: <br>
                9AM ~ 6PM (������ ~ �ݿ���, ������ ����) <br>
                ����/���޹���: ad@evasion.co.kr <br>
                �ּ�: ����Ư���� �߱� ������ 33 �žƱ��� 304ȣ.
            </div>
      </div>
        <div class="footer_bottom">
            <div class="footer_bottom1">
                (��)��������   ��ǥ��: ����� ���� ���� 
                2013-���� �߱�-1277  |   211-88-68189 <br><br>
                COPYRIGHT 2011 - 2020 BONVOYAGE INC. ALL RIGHTS RESERVED.
            </div>
            <div class="footer_bottom2">
                FIND US ON
                <i class="fab fa-instagram fa-3x"></i>
                <i class="fab fa-facebook-square fa-3x"></i>
                <i class="fab fa-twitter-square fa-3x"></i>
            </div>
        </div>
      </div>
    </footer>
	
	<script>
		$(function() {
			//���� ���� �����̴� �Լ�
			$("#slider-range").slider({
				range: true,
				min: 0,
				max: 1000000,
				values: [50000, 150000],
				slide: function(event, ui) {
					$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
				}
			});
			$("#slider-range2").slider({
				range: true,
				min: 0,
				max: 5,
				values: [2, 5],
				slide: function(event, ui) {
					$("#amount2").val("" + ui.values[0] + " - " + ui.values[1]);
				}
			});
			$("#amount2").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));
			
			//�̹��� �¿��ư
			$(".btn1").click( function(){
					var box = $(this).prev();
					box.stop().animate({left:"-200px"},500,function(){
					var tmp = box.children(":first").detach();
					box.append(tmp);
					box.css("left","0");
				});
			});
			$(".btn2").click(function(){
				var box = $(this).prev().prev();
				var tmp = box.children(":last").detach();
				box.css("left","-200px");
				box.prepend(tmp);
				box.stop().animate({left:"0"},500);
			});
			
			$(".showbox").mouseenter(function(){
				$(this).children().next().fadeIn();
				$(this).children().next().next().fadeIn();
			});
			$(".showbox").mouseleave(function(){
				$(".btn1").stop().fadeOut();
				$(".btn2").stop().fadeOut();
			});
			
			//��Ʈǥ��
			var isLike = false; 
			$(".heart").click(function(){
				if(!isLike){ //���� isLike�� false��� �̹��� ����
					$(this).attr("src", "SearchResource/heart_full.png").stop().hide().fadeIn();
					isLike=true; //t=true�� �ٲٱ�
				}else{
					$(this).attr("src", "SearchResource/heart_empty.png");
					isLike=false;
				}
			});
			
			//��������
			$(".star").click(function(){
				$(this).attr("src", "SearchResource/star_yellow.png");
				$(this).prevAll().attr("src", "SearchResource/star_yellow.png");
				$(this).nextAll().attr("src", "SearchResource/star_gray.png");
			});
			
			//ȣ���� �������� ���, ���� idx�� ��� ���� ���������� ���������� ����� �� �ֵ��� �Ѵ�.
			$(".title_right").click(function(){
				var hotelIdx = $(this).find('.hotelIdx').val();
				$("#myHotelIdx").val(hotelIdx);
				SearcchForm.submit();
			});
			
			
			/* �α��� �˾�â */
			$(".popLogin").click(function(){
				$(".modal").fadeIn(300, function(){
					$("#modalLogin").animate({opacity: "1"},300);
					$("#modalLogin").css('z-index','20');
					$("#modalLogin").draggable();
				});
			});
			$(".modalLoginExit").click(function(){
				$("#modalLogin").css('z-index','-20');
				$("#modalLogin").animate({opacity: "0"},300);
				$(".modal").fadeOut(500);
			});
			$("#hotellogo").click(function(){
				location.href = "mainpage.do";
				<%session.removeAttribute("searchResult");%>
			});
			
		});
	</script>
	
	<script type="text/javascript">
		function goMypage() {
			location.href = "mypage.do";
		}
	</script>
	
</body>
</html>