<%@page import="java.util.Vector"%>
<%@page import="hotel.search.*,hotel.*, hotel.ceo.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<ink rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
	*,html,body{margin: 0;padding: 0;box-sizing: border-box; font-family: �������;}
	.wrap{
		width:100%;
		margin-left: 10%;
		margin-right: 10%;
		margin-top: 80px;
	}
	.top{width:80%;display: flex;}
	.roomImg{width:40%;margin: 10px;position: relative;}
	.roomImg>img{width: 100%}
    	/* �����̵�CSS*/
   	.mySlides {display: none;}
	#firstSlide{display:block;}
	.cursor {cursor: pointer;}
	.prev,.next {
 			cursor: pointer;
 			position: absolute;
 			top: 40%;
 			width: auto;
 			padding: 16px;
 			margin-top: -50px;
 			color: white;
 			font-weight: bold;
 			font-size: 20px;
 			border-radius: 0 3px 3px 0;
 			user-select: none;
 			-webkit-user-select: none;
	}
	.next {right: 0;border-radius: 3px 0 0 3px;}
	.prev:hover,.next:hover {background-color: rgba(0, 0, 0, 0.8);}
	.numbertext {color: #f2f2f2;font-size: 12px;padding: 8px 12px;position: absolute;top: 0;}
	.caption-container {text-align: center;background-color: #222;padding: 2px 16px;color: white;}
	.row:after {content: "";display: table;clear: both;}
	.column {float: left;width: 16.66%;}
	.demo {opacity: 0.6;}
	.active,.demo:hover {opacity: 1;}
		
    .roomName{width:60%; margin: 10px;}
   	.adress_Font{font-size: 10px; color: gray;}
   	/* ������Ѹ��� CSS */
   	.content_wrap {
          clear:both;
          width: 100%; 
          display:block; 
          overflow:hidden; 
          padding:5px;
          background-color: gainsboro;
          font-size: 12px;            
          line-height:130%; /* ����ũ���� 130%�̹Ƿ� �뷫 15.6px */
          /* height:60%; */
          min-height:160px;     
   	}
   	.btn_more {            
          display:block;
          padding:27px 0 0 0; 
          margin:20px 0 0 0;
          text-align:center; 
          font-size:12px; 
          color:#000;
          }
   	/* �ó�ý� ������ */
   	.SynopsisText {
          width: 100%;
          height: 15.6px;
          /*webkit�������� ������ ������ �������� ���� ó��*/
          /* �ٰ����� 15.6px�̸� 3�ٸ� �������⸦ �������� ���ϱ� 3�� �Ͽ� ���̸� ����*/
          overflow: hidden; /*������ ����� ������ �Ⱥ������� ó��*/
          /*webkit������*/
          display: -webkit-box;
          -webkit-line-clamp: 3;
          -webkit-box-orient: vertical;
       }
       /* ����CSS */
 		.star-rating {width:304px; }
 		.star-rating,.star-rating span {
 			display:inline-block;
 			height:55px; 
 			overflow:hidden;
 			background:url(img/star.png)no-repeat; }
 		.star-rating span{
 			background-position:left bottom;
 			line-height:0; vertical-align:top; }
 		.service{font-size: 10px;}
   
   	.center_Click{width: 80%; display: flex;margin-top: 10px;margin-bottom: 10px;}
   	.center_Click>button{width:100%;}
   	.center_Click>button{
 			background:#1b1b1b;
 			color:#fff;
 			border:none;
 			position:relative;
 			height:60px;
 			font-size:1.6em;
 			padding:0 2em;
 			cursor:pointer;
 			transition:800ms ease all;
 			outline:none;
	}
	.center_Click>button:hover{background:#fff;color:#1b1b1b;}
	.center_Click>button:before,button:after{
 			content:'';
 			position:absolute;
 			top:0;
 			right:0;
 			height:2px;
 			width:0;
 			background: #1b1b1b;
 			transition:400ms ease all;
	}
	.center_Click>button:after{right:inherit;top:inherit;left:0;bottom:0;}
		.center_Click>button:hover:before,button:hover:after{width:100%;transition:800ms ease all;}
	.center{width: 80%;}
  
	.room_info{width:100%;border: 1px solid black; margin-bottom: 20px;}
	.room_info>.margin{margin: 10px;display: flex; border: 1px solid gray;}
	.img_room{width:50%;height:200px;margin: 10px;}
	.img_room>img{width:100%; height: 200px;}
	.room_info>.information{width:60%;}
	.information{width:50%; margin-left: 10px;}
	.information>.room_Name{height: 60px}
	.information>.price{height: 40px; display:flex;justify-content: space-between;}
	.information>.room_btn{width: 100%;height: 100px;}
	.room_btn>button{width:100%; height: 50px;background-color: #1b1b1b; color: white}
	.popup {display: none;position: fixed;width: 100%;height: 100%;background: rgba(0,0,0,0.9); z-index:1;}
	.popmenu {position: absolute;left: 50%;top: 50%;transform: translate(-50%,-50%);width: 400px;height: 400px;background: #fff;}
	.popmenu>div{margin-bottom: 20px; font-size: 10px;}
	.popmenu>div>ul{margin-bottom: 20px;}
	.exit {position: absolute;left: 50%;bottom: 10px;transform: translate(-50%,0);width: 60px;height: 30px;text-align: center;line-height: 30px;background: #007AAE;cursor: pointer;}

   
   .theme_wrap{display: flex;}
   .ser_wrap>button{width:100%;height: 50px;text-align: left;}
   .ser_wrap>button>span{margin-left: 10px;}
   .category{width:100%;height: 50px;text-align: left;margin-bottom: 10px;border: none;}
   .category>span{margin-left: 10px;}
   .theme_wrap>li{margin:0 auto;text-align: center;list-style: none;}
   .theme_wrap>li>i{display:inline; margin:0 auto;}
   
   .info_wrap{}
   .default_info{background-color: gainsboro;margin:20px;padding:20px;}
   .default_info>ul{margin-left: 20px; font-size: 10px;margin-top: 10px;margin-bottom: 10px;}
   .default_info>ul>li{}
   .info_wrap>button{width:100%;margin-top: 10px;}

	.reviewbox{
		display: flex;
		width: 80%;
		height: 200px; 
		border: 1px solid black;
	}
	.user{
		border: 1px solid black;
		width: 20%;
		padding-top: 10px;
		padding-left: 10px;
		
	}
	.write{
		padding-left: 20px;
		width: 80%;
		overflow:scroll;
	}
	#check{
		margin-top: 10px;
		margin-left: 20%;
		margin-bottom:10px;
		background-color: gray;
		color: white;
		font-size: 20px;
	}
		  	
 	footer{
        background-color: black; color: gainsboro; height: 270px; width: 100%;
        background: linear-gradient(to bottom,rgba(0, 0, 0, 0.80) 20%,rgba(0, 0, 0, 0.85) 60%,rgba(0, 0, 0, 0.9) 80%);
    }
 	.footer{height: 270px;width: 1150px;margin: 0 auto;}
    .footer_up{display: flex;padding: 30px;}
    .footer_bottom{display: flex;}
    .footer_right{padding-left: 285px;}
    .left_mid{padding-top: 10px;padding-left: 10px;}
    .button{background-color: rgba(21,107,193,1);color: white;border: none;font-size: 17px;width: 40px;border-radius: 5px;box-shadow: 2px 2px black;}
    .footer_bottom1{padding-left: 40px;}
    .footer_bottom2{padding-left: 120px;}
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
	String ceoids=(String)session.getAttribute("ceoid");
	CeoDAO dao = new CeoDAO();
	Vector<HotelmainimgDTO> hotelmainimg =dao.hotelmainimg(ceoids);
	
	Vector<HotelroomimgDTO> hotelroomimg =dao.Hotelroomimg(hotelmainimg.get(0).getHotelmainnumber());
	
	HTDataDTO dto = (HTDataDTO)request.getAttribute("hotelInfo");
	Vector<HTRoomDataDTO> v = (Vector<HTRoomDataDTO>)request.getAttribute("roomInfo");
	
	session.setAttribute("hotelInfo", dto);
	session.setAttribute("roomInfo", v);
%>

<%=session.getAttribute("userId") %>
<div class="popup">
	<div class="popmenu">
		<h2 style="text-align: center;">���� �̿� �ȳ�</h2>
		<div style="border-bottom: 1px solid gainsboro; margin-left: 10px;">
			<ul style="margin-left: 10px;">�⺻����
				<li>2�� ���� �ִ� 2��</li>
				<li>����+���</li>
			</ul>
		</div>
		<div  style="border-bottom: 1px solid gainsboro; margin-left: 10px;">
			<ul style="margin-left: 10px;">���ǽü�
				<li>ħ��,TV,������,���αݰ�,��ȭ��,�����,Ŀ����Ʈ,��,��ǿ�ǰ</li>
			</ul>
		</div>
		<div class="exit">�ݱ�</div>
	</div>
</div>
	<!-- �ΰ� �� �α��� ó�� -->
		<div id="topheader">
			<div id="hotellogo" class="whiteLogo"></div>
	
			<%if(session.getAttribute("userid") != null){ %>	
				<form action="logoutpage.do" class="nowLogin">
					<%-- <%=session.getAttribute("userid") %>�� �ݰ����ϴ�. --%>
					<input type="button" value="My Page" class="topbtnframe" onclick="goMypage()">
					<input type="submit" value="Logout" class="topbtnframe"><br>
					<input type="hidden" name="thisPage" value="detail">
				</form>
			<%}else{%>
				<input type="button" value="Login" class="popLogin">
			<%} %>
		</div>
	
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
									<input type="hidden" name="thisPage" value="detail">
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
		
<div class="wrap">

<!-- 	---------------------------------------------------------------------------------------------------------
	 TOP
	--------------------------------------------------------------------------------------------------------- -->
	 
	
	<div class="top">
		<div class="roomImg">
  				<img src=<%=StaticValue.saveFolder%>/<%=hotelmainimg.get(0).getHotelfilname()%>>

 
  		</div>
		<div class="roomName">
			<!-- ��ȣ�� -->
			<h3><%= dto.getName()%></h3>
			<div class="wrap-star">
				<div class="icon">
                <% for(int i=0; i< dto.getGrade(); i++){%>
                	<img src="SearchResource/star_yellow.png">
                <%}%>
                <% for(int i=0; i<5-dto.getGrade(); i++){ %>
                	<img src="SearchResource/star_gray.png">
                <%} %>	
                
                       
                </div>
    			<!-- <div class='star-rating'>
        			<span style ="width:100%"></span>
    			</div> -->
			</div>
			<div class="adress_Font"><%= dto.getAddress()%></div>
			<!-- ���� -->
			<button>����</button>
		    <!-- ������Ѹ��� -->
		    <article class="content_wrap" id="synopsis">       
        		<div id="SynopsisDiv" class="SynopsisText">
        			<b>����� �Ѹ���</b><br><br>
        			�ȳ��ϼ��� ��Ƽũȣ��k �������Դϴ�.
        			6�� 15�� �׷��� ������ �� ���� ����� ������ �����ֽ� ���е鲲 ���� ������ ������ ���մϴ�.
        			��Ƽũȣ��k �������� ���ο� ���׸��������� ���� ���е��� ���縦 �����ּ̽��ϴ�.
        			�׷����� �� �� 5ȣ.6ȣ ������ ������ ����ϴٴ� ���е��� Ŭ������ �־��� �׸��Ͽ� ���� ���ֵ��� �������縦 �ǽ��Ͽ� 9��20�Ϻη� ���簡 ������ �Ǿ����ϴ�.
        			�׵��� ������ �̿��ϸ� ���������� �������� �޾��� ���е鲲 �������� ����� ������ ���մϴ�.
        			�����ε� ���Ե��� �Ҹ��� �͸� ����̴� kȣ���� �ǵ��� ����ϰڽ��ϴ�.�����մϴ�^^<br/>
               </div>
           	<a href="javascript:showplay();" class="btn_more" id="synopMore">������</a>
        	<input name="hidTempSynopsis" type="hidden" id="hidTempSynopsis" value="0">
    	 </article>
		</div>
	</div>
<!-- -----------
�޴���ư
----------- -->
	<div class="center_Click">
		<button type="button" class="a"onclick="tab1">���Ǿȳ�/����</button>
		<button type="button" class="b" onclick="tab2">��������</button>
		<button type="button" class="c" onclick="tab3">����</button>
	</div>
	
<!------ ���Ǿȳ�/���� -->
	<div class="center">
		<form action="HTReservedPageAction.do" name="rvform" method="post">	
			<article class="room_info">
				
	            <% for(int i=0; i<v.size(); i++){  %>
	             <div class="margin">
					<div class="img_room">
	        			<img src="<%=StaticValue.saveFolder%>/<%=hotelroomimg.get(i).getFilname()%>">
	        		</div>	
	        		<div class="information">
	            		<div class="room_Name">
	            			<h3><%= v.get(i).getRoomType() %></h3>
	            		</div>
	            		<div class="price">
	                		<div>����</div>
	                		<div><%= v.get(i).getRoomPrice()%>��</div>
	            		</div>
	            		<div class="room_btn">
	            			<button type="button" class="guest_btn">���� �̿� �ȳ�</button>
	                		<button type="button" class="reservation_btn">����</button>
	                		<input type="hidden" value="<%= v.get(i).getRoomNum()%>">
	            		</div>
	            	</div>	
	            </div>
	            
	            <%}%>
	              
	    	</article>
	    	<input type="hidden" name="roomNum" id="myRoomNum">
	    	<input type="hidden" name="hotelIndex" value="<%= dto.getIdx()%>">
	    	<input type="hidden" name="userID" value="<%=session.getAttribute("userid")%>">
    	 </form>
    	
<!--- �������������� -->
	
	<article class="detail_info">
        <div class="ser_wrap">
        	<button type="button" class="category" id="default_info_tab1" onclick="fn_spread2('service')">
        		<span> ���ǽü� �� ����</span>
        	</button>
        		<section class="service" id="service">
            		<ul class="theme_wrap">
                		<li><i class="fa fa-gavel fa-4x" aria-hidden="true"></i><br>������</li>
                		<li><i class="fa fa-cutlery fa-4x" aria-hidden="true"></i><br>�������</li>
                		<li><i class="fa fa-rss fa-4x" aria-hidden="true"></i><br>��������</li>
                		<li><i class="fa fa-leaf fa-4x" aria-hidden="true"></i><br>��ǿ�ǰ</li>
                		<li><i class="fa fa-coffee fa-4x" aria-hidden="true"></i><br>�̴Ϲ�</li>
                		<li><i class="fa fa-exclamation-triangle fa-4x" aria-hidden="true"></i><br>�ݿ�</li>
                		<li><i class="fa fa-car fa-4x" aria-hidden="true"></i><br>��������</li>
                		<li><i class="fa fa-glass fa-4x" aria-hidden="true"></i><br>�����</li>
                		<li><i class="fa fa-comments fa-4x" aria-hidden="true"></i><br>���̳���</li>
                		<li><i class="fa fa-television fa-4x" aria-hidden="true"></i><br>TV</li>
                		<li><i class="fa fa-connectdevelop fa-4x" aria-hidden="true"></i><br>������</li>
                		<li><i class="fa fa-wheelchair fa-4x" aria-hidden="true"></i><br>��������ǽü�</li>
            		</ul>
        		</section>
        	</div>
       
        	<div class="info_wrap">	
        		<button type="button" id="default_info_tab2" onclick="fn_spread('default_info')" class="category">
        			<span> �⺻ ����</span>
        		</button>
        		
        		<section class="default_info" id="default_info">
					<h3>�ֺ�����</h3>
					<ul>
						<li>�ؿ�� �ؼ����� ��</li>
						<li>�ؿ�뿪 ���� 10��</li>
						<li>���ȸ� �غ� ���� 15��</li>
					</ul>
					<h3>��������</h3>
					<ul>
						<li><font color="#0652ff">���� ���� ��, üũ�� �� ����Ʈ�� "����" ���� �������� �ʼ�</font></li></ul>
					<h3>�⺻ ����</h3>
					<ul>
						<li>üũ�� : 15:00 | üũ�ƿ� : 11:30</li><li>���� Wi-Fi</li><li>�� ���� �ݿ�</li><li>Bath Amenity (ġ��, ĩ�� ����)</li></ul>
					<h3>�ο� �߰� ����</h3>
					<ul>
						<li><font color="#0652ff">�� ���� �ִ� ���� 3�� �Ǵ� ���� 2�� + ���� 2�α��� �̿� ���� (����)</font></li>
						<li>�����ο� �� �߰� ��, 1�� 72,600�� (8�� �̻�~����), 7�� �̸� ���� (���޸� ���� ����)</li>
						<li>�⺻ ���� ���� : ���޸� �� ������, Ű�� ������ ���� / �Ű� �̿� ��, ���� ���� ���� </li>
						<li>���޸� : 1�� 33,000�� (����), 16,500�� (49���� �̻�~�ʵ��л�), 49���� �̸� ����</li>
						<li>ħ�� �߰� : �ο� �߰���뿡 ���� (�Ű� �̿�� ���ĺ��� ����)</li>
						<li>���� ����</li>
					</ul>
					<h3>���� ����</h3>
					<ul><li>[�𷰽� �µ�] ���� ����� �� Ư�� ������ �̿� ��, �߰���� �߻� (30,000��/�������)</li></ul>

					<h3>������ ����</h3>
					<ul>
						<li>���޸� (���� 2��), �߿ܿ��� Ǯ & �Ķ���̽� Ű�� ������ (���� 2��+���� 2��) ���� ����</li>
						<li><b>������ ��, Ư������! 4�� 15�ϱ��� ���޸� ������ ����</b></li>
					</ul>
					<h3>�δ�ü� ����</h3>
					<ul>
						<li>�Ķ���̽� Ű������� / ���� ���� 1��</li>
						<li>On The Plate (�������)</li>
						<li>�н� �׸� (�������) / �Ű� 2�� </li>
						<li>��ǳ (�߽� �������)</li>
						<li>�� (�Ͻ� �������)</li>
						<li>�Ķ���̽� ��Ƽ�� ����Ŀ��</li>
						<li>�Ϲ� Ű������</li>
						<li>ũ����Ż ����</li>
						<li>������</li>
						<li>������ (Bar) / ���� ���� 1��</li>
						<li>��Ʈ�Ͻ� ���� / ���� 4�� (��������), �Ű� 4�� / 06:00~21:00</li>
						<li>���� ��쳪 / ���� 4�� / �������� / 06:00~22:00</li>
						<li>�Ű� ��쳪 / ���� 4�� / �������� / 06:00~22:00 </li>
						<li>���ǽ��� ���޸� (����) / ���� 4�� / ������ 08:00~22:00, Ű���� 11:00~20:00 / ���޸� 1�� 33,000�� (48���� �̻�~����), 16,500�� (48���� �̸�) / �ܺΰ� �̿�Ұ�</li>
						<li>�߿� ������ / �Ű� </li>
						<li>�÷��̽����̼� �� / 10:00~20:00</li>
						<li>����� �Ķ���̽� (�Ű�) / (��~��) 14�� �̻� ���� ���� (���� ���� �����), (��~��) 49���� �̻� ���� ���� (��� ���� �йи� �����) / All Day Service (����� ����, Ƽ ����, ���� �ƿ�) ���� / ȣ�� ������ ���� ������ �� �ֽ��ϴ� </li>
						<li><b>[�δ�ü� ���� �� �����, �����ð� ���� �ȳ�]</b></li>
						<li>-����</li>
						<li>�ǳ���쳪 / ������ / ��Ʈ��Ʈ���� / ����� : ~2020�� 4�� 15�ϱ��� ����</li>
						<li>Ű������� / ���� : ~2020�� 4�� 29�ϱ��� ����</li>
						<li>-���� �δ�ü� ����� </li>
						<li>���޸� : 2020�� 4�� 16�� / 11:00~20:00</li>
						<li>���� ��쳪, ���� ��쳪, ������, ��Ʈ�Ͻ� ����, �ǳ� ���� : 2020�� 4�� 16��</li>
						<li>���� �� �Ű� ����� (EXE) : 2020�� 4�� 16�� (�Ű� ���� ����� �)</li>
						<li>Ű�� ������, LEO ü�� ���α׷� : 2020�� 4�� 30��</li>
					</ul>
					<h3>���� ����</h3>
					<ul>
						<li>On The Plate / ���� 1�� / 06:30~10:30</li>
						<li>���� (��~��), �ݿ��� : �ο� �߰� �� 1�� 42,000�� (13�� �̻�~����), 29,000�� (12�� �̸�)</li>
						<li>�����, ������ ���� : �ο� �߰� �� 1�� 52,000�� (13�� �̻�~����), 29,000�� (12�� �̸�)</li>
						<li>�� �ݾ��� ���� ���� ���࿡ ���մϴ� </li><li>���� �������� �� ����Ʈ ����</li>
					</ul>
					<h3>��� �� ȯ�� ����</h3>
					<ul>
						<li><b>[�����]</b></li>
						<li>üũ�� ���� 2�� �� 18�ñ��� : 100% ȯ��</li>
						<li>üũ�� ���� 2�� �� 18������~1�� �� 18�ñ��� : 50% ȯ�� </li>
						<li>üũ�� ���� 1�� �� 18������~���� �� No-show : ȯ�ҺҰ�</li>
						<li><b>[������]</b></li>
						<li>üũ���� ���� 5���� 18�ñ��� : 100% ȯ��</li>
						<li>üũ���� ���� 5���� 18������~���� �� No-show : ȯ�ҺҰ�</li>
						<li><b><font color="#CA0101">[24�ð� ���������� ��Ű��], [�ֵ� Ư��], [4��! ����&�󸮹��� Ư��], [3��! �ֵ� Ư��], [MD��! Ư��-����], [MD Pick! Ư��], [3��! ����&�󸮹��� Ư��], [��������] [���������� ��Ű��], [2�� ����] ����</font></font></b></li>
						<li>üũ���� ���� 5���� 18�ñ��� : 100% ȯ��</li>
						<li>üũ���� ���� 5���� 18������~���� �� No-show : ȯ�ҺҰ�</li>
						<li>���, ȯ�ҽ� �����ᰡ �߻��� �� �ֽ��ϴ�</li>
					</ul>

					<h3>Ȯ�λ��� �� ��Ÿ</h3>
					<ul>
						<li><b>üũ�� �� Deposit(������)�� �䱸�� �� �ְ�, ��� �� ���� ȯ�ҵ˴ϴ�</li>
						<li>(��, ���Ἥ�� �̿� �� �⹰�ļ� �� û���� �� ����)</b></li>
						<li>�ִ��ο� �ʰ��� �Խ� �Ұ��մϴ�</li>
						<li>���� ������ ȣ���� ������ ���� ����� �� �ֽ��ϴ�</li>
						<li>�ش� �̹����� ������ ���� �� �� �ֽ��ϴ�</li>
						<li>üũ�� �� ���� �Ǵ� ����Ÿ�� �̱��� ��ǰ�� Ư�����ǰ� ����Ÿ���� �������� �ʽ��ϴ�</li>
						<li>�ش� ���ǰ��� ����, ����ᰡ ���Ե� �ݾ��Դϴ�</li>
						<li>�̼����ڴ� ��ȣ�� ���ݾ��� �̿��Ͻ� �� �����ϴ�</li>
					</ul>
        		</section>
     		</article>
     	</div>
     	<!-------------- ����	 -->
     	<div class="review_wrap">
     		<article>
				<div class="reviewbox">
					<div class="user">
					<h3><i class="fas fa-h-square"></i>���̵�</h3>
					2020.10.2
					</div>
				<div class="write"> 
					<br>
						<i class="fas fa-star"></i>
			 			<i class="fas fa-star-half-alt"></i>
			 			<i class="far fa-star"></i>
						���� 5.0/5 <br>
						<h3>���� ������ �� </h3>
					���� ���� ���ƿ� ��ġ�� ���� ���� ���� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ����䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���举�� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ����
					���� ���� ���ƿ� ��ġ�� ���� ���� ���� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ����䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���举�� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ����	
				</div>
			</div>
			<div class="reviewbox">
					<div class="user">
					<h3><i class="fas fa-h-square"></i>���̵�</h3>
					2020.10.2
					</div>
				<div class="write"> 
					<br>
						<i class="fas fa-star"></i>
			 			<i class="fas fa-star-half-alt"></i>
			 			<i class="far fa-star"></i>
						���� 5.0/5 <br>
						<h3>���� ������ �� </h3>
					���� ���� ���ƿ� ��ġ�� ���� ���� ���� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ����䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���举�� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ����
					���� ���� ���ƿ� ��ġ�� ���� ���� ���� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ����䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���举�� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ���䳻�� ���� ���ƿ� ��ġ�� ���� ����	
				</div>
			</div>
		</article>
		<input type="button" value="�̿� �ı� ��� ����" id="check">
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
                COPYRIGHT @ 2011 - 2020 BONVOYAGE INC. ALL RIGHTS RESERVED.
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
	<!-- ------------------------------------------------------------------------------------------------------- -->
</div>

<script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("demo");
      var captionText = document.getElementById("caption");
      
      if (n > slides.length) {slideIndex = 1;}
      if (n < 1) {slideIndex = slides.length;}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";
      dots[slideIndex-1].className += " active";
      captionText.innerHTML = dots[slideIndex-1].alt;
    }
    
     //������ ���
    function showplay() {
        var flag = $('#hidTempSynopsis');
        var SynopsisDiv = $('#SynopsisDiv');
        var flagValue = flag.val();
        if (flag != null) {
            if (flagValue == "0") {
                SynopsisDiv.css("height", "auto");
                SynopsisDiv.css("font-size", "12px");
                SynopsisDiv.css("display", "block");
                $("#synopMore").text("�ݱ�");
                flag.val("1");
            }
            else {
                SynopsisDiv.css("height", "46.5px");
                SynopsisDiv.css("display", "-webkit-box");
                $("#synopMore").text("������");
                flag.val("0");
            }
        }
        else {
            alert("[������] �߰� ������ �����ϴ�.");
        }
    }

    </script>
    
<script type="text/javascript">
$(document).ready(function() {
	$('.room_info').show(); //�������� �ε��� �� ǥ���� ���
	$('.detail_info').hide(); //�������� �ε��� �� ���� ���
	$('.review_wrap').hide();
	
	$('.a').click(function(){
		$ ('.detail_info').hide(); //Ŭ�� �� ù ��° ��� ����
		$ ('.room_info').show(); //Ŭ�� �� �� ��° ��� ǥ��
		$('.review_wrap').hide();
		return false;
	});
	$('.b').click(function(){
		$ ('.room_info').hide(); //Ŭ�� �� ù ��° ��� ����
		$ ('.detail_info').show(); //Ŭ�� �� �� ��° ��� ǥ��
		$('.review_wrap').hide();
		return false;
	});
	$('.c').click(function(){
	$ ('.room_info').hide(); //Ŭ�� �� ù ��° ��� ����
	$ ('.detail_info').hide(); //Ŭ�� �� �� ��° ��� ����
	$ ('.review_wrap').show(); //Ŭ�� �� �� ��° ��� ǥ��
	return false;
	});
});
$(document).ready(function(){
    $(".guest_btn").click(function(){
        $(".popup").fadeIn();
    });
    $(".popup").click(function(){
        $(".popup").fadeOut();
    });
    $(".reservation_btn").click(function(){
    	
    	<%if(session.getAttribute("userid")== null){%>
    		alert("�α����� �ʿ��� �����Դϴ�.");
    	<%}else{%>
    		var roomNum = $(this).next().val();
    		$("#myRoomNum").val(roomNum);
    		<%
	    		session.removeAttribute("hotelInfo");
				session.removeAttribute("roomInfo");
    		%>
    		rvform.submit();
    	<%}%>
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
		<%
			//session.removeAttribute("searchInfo");
			session.removeAttribute("searchResult");
		%>
	});
});

function fn_spread(id){
	var getID = document.getElementById(id);
	getID.style.display=(getID.style.display=='none') ? 'block' : 'none'; }

function fn_spread2(id){
	var getID = document.getElementById(id);
	getID.style.display=(getID.style.display=='none') ? 'block' : 'none'; }

</script>
</body>
</html>