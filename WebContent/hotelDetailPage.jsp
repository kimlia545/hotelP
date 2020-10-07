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
	*,html,body{margin: 0;padding: 0;box-sizing: border-box; font-family: 나눔고딕;}
	.wrap{
		width:100%;
		margin-left: 10%;
		margin-right: 10%;
		margin-top: 80px;
	}
	.top{width:80%;display: flex;}
	.roomImg{width:40%;margin: 10px;position: relative;}
	.roomImg>img{width: 100%}
    	/* 슬라이드CSS*/
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
   	/* 사장님한마디 CSS */
   	.content_wrap {
          clear:both;
          width: 100%; 
          display:block; 
          overflow:hidden; 
          padding:5px;
          background-color: gainsboro;
          font-size: 12px;            
          line-height:130%; /* 글자크기의 130%이므로 대략 15.6px */
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
   	/* 시놉시스 더보기 */
   	.SynopsisText {
          width: 100%;
          height: 15.6px;
          /*webkit브라우저를 제외한 나머지 브라우저를 위한 처리*/
          /* 줄간격이 15.6px이며 3줄만 보여지기를 원함으로 곱하기 3을 하여 높이를 지정*/
          overflow: hidden; /*영역을 벗어나는 내용은 안보여지게 처리*/
          /*webkit브라우저*/
          display: -webkit-box;
          -webkit-line-clamp: 3;
          -webkit-box-orient: vertical;
       }
       /* 별점CSS */
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
	/*로고*/
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
	/*로그인버튼*/
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
	/*로그아웃/마이페이지 버튼*/
		.topbtnframe{
			cursor:pointer;
			width: 80px;
			height: 35px;
			border: 1px solid white;
			background-color: transparent;
			
			color: white;
		}
		/* 로그인 모달창 */
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
	// 직전, 아이디/비밀번호 입력에 실패했을 경우에 login모달을 켜두기 위해 미리 값을 받아둔다.
	// 이 값은 하단에서 씁니다
	Object is_loginSuccess= request.getAttribute("wrong");
	
	if(is_loginSuccess != null){%>
		<script>alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");</script>
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
		<h2 style="text-align: center;">객실 이용 안내</h2>
		<div style="border-bottom: 1px solid gainsboro; margin-left: 10px;">
			<ul style="margin-left: 10px;">기본정보
				<li>2인 기준 최대 2인</li>
				<li>객실+욕실</li>
			</ul>
		</div>
		<div  style="border-bottom: 1px solid gainsboro; margin-left: 10px;">
			<ul style="margin-left: 10px;">편의시설
				<li>침대,TV,에어컨,개인금고,전화기,냉장고,커피포트,비데,용실용품</li>
			</ul>
		</div>
		<div class="exit">닫기</div>
	</div>
</div>
	<!-- 로고 및 로그인 처리 -->
		<div id="topheader">
			<div id="hotellogo" class="whiteLogo"></div>
	
			<%if(session.getAttribute("userid") != null){ %>	
				<form action="logoutpage.do" class="nowLogin">
					<%-- <%=session.getAttribute("userid") %>님 반갑습니다. --%>
					<input type="button" value="My Page" class="topbtnframe" onclick="goMypage()">
					<input type="submit" value="Logout" class="topbtnframe"><br>
					<input type="hidden" name="thisPage" value="detail">
				</form>
			<%}else{%>
				<input type="button" value="Login" class="popLogin">
			<%} %>
		</div>
	
	 <!-- 로그인 버튼 눌렸을 시에 띄워지는 모달창 -->
	    <div id="modalLogin">
				<div class="pageleft">
						<div class="info">
							<div class="ment">
								지금 로그인하고<br> 회원 전용 특가로 예약하세요!
							</div>
							<hr>
							<div class="ment">
								<form action="loginpage.do" method=post>
									<input type="text" placeholder="아이디" id="id" name="id"> 
									<input type="text" placeholder="비밀번호" id="pw" name="pw">
									<div>비밀번호가 기억나지 않으세요? <a href="Find.jsp">여기서 </a>재설정 하세요.</div>
									<input type="submit" value="로그인" id="login">
									<input type="hidden" name="thisPage" value="detail">
								</form>
							</div>
							
						</div>
				</div>
				<div class="pageright">
					<div class="modalLoginExit" id="btn">
						<i class="fas fa-times-circle"></i>
					</div>
					<div class="pageright_top">아직도 회원이 아니신가요?</div>
					<div class="pageright_mid">
						<b>회원가입</b> 후 마음에 드는 <br>
						호텔을 <b>최저가</b>로 예약해보세요.
						<hr style="width: 280px; margin-top: 24px; margin-left:auto; margin-right:auto;">
					</div>
					<div class="pageright_bottom">
						<table>
							<tr>
								<td><i class="fas fa-concierge-bell"></i></td>
								<td>호텔 요금 알림 설정</td>
							</tr>
							<tr>
								<td><i class="fas fa-suitcase-rolling"></i></td>
								<td>회원 전용 특가</td>
							</tr>
							<tr>
								<td><i class="fas fa-search-dollar"></i></td>
								<td>오늘의 특가 상품</td>
							</tr>
							<tr>
								<td><i class="fas fa-users"></i></td>
								<td>친구와 위시리스트 공유</td>
							</tr>
							<tr>
								<td><i class="fas fa-hotel"></i></td>
								<td>최근 검색 기록 확인</td>
							</tr>
						</table>
					</div>
					<input type="button" value="회원가입" id="join" onclick="signup()">
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
			<!-- 상호명 -->
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
			<!-- 쿠폰 -->
			<button>쿠폰</button>
		    <!-- 사장님한마디 -->
		    <article class="content_wrap" id="synopsis">       
        		<div id="SynopsisDiv" class="SynopsisText">
        			<b>사장님 한마디</b><br><br>
        			안녕하세요 부티크호텔k 종로점입니다.
        			6월 15일 그랜드 오프닝 후 많은 사랑과 성원을 보내주신 고객분들께 깊은 감사의 말씀을 전합니다.
        			부티크호텔k 종로점의 새로운 인테리어컨셉에 많은 고객분들이 찬사를 보내주셨습니다.
        			그렇지만 각 층 5호.6호 객실의 방음이 취약하다는 고객분들의 클레임이 있었고 그리하여 지난 한주동안 방음공사를 실시하여 9월20일부로 공사가 마무리 되었습니다.
        			그동안 객실을 이용하며 방음때문에 불편함을 겪었던 고객분들께 진심으로 사과의 말씀을 전합니다.
        			앞으로도 고객님들의 소리에 귀를 기울이는 k호텔이 되도록 노력하겠습니다.감사합니다^^<br/>
               </div>
           	<a href="javascript:showplay();" class="btn_more" id="synopMore">더보기</a>
        	<input name="hidTempSynopsis" type="hidden" id="hidTempSynopsis" value="0">
    	 </article>
		</div>
	</div>
<!-- -----------
메뉴버튼
----------- -->
	<div class="center_Click">
		<button type="button" class="a"onclick="tab1">객실안내/예약</button>
		<button type="button" class="b" onclick="tab2">숙소정보</button>
		<button type="button" class="c" onclick="tab3">리뷰</button>
	</div>
	
<!------ 객실안내/예약 -->
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
	                		<div>가격</div>
	                		<div><%= v.get(i).getRoomPrice()%>원</div>
	            		</div>
	            		<div class="room_btn">
	            			<button type="button" class="guest_btn">객실 이용 안내</button>
	                		<button type="button" class="reservation_btn">예약</button>
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
    	
<!--- 숙소정보페이지 -->
	
	<article class="detail_info">
        <div class="ser_wrap">
        	<button type="button" class="category" id="default_info_tab1" onclick="fn_spread2('service')">
        		<span> 편의시설 및 서비스</span>
        	</button>
        		<section class="service" id="service">
            		<ul class="theme_wrap">
                		<li><i class="fa fa-gavel fa-4x" aria-hidden="true"></i><br>골프장</li>
                		<li><i class="fa fa-cutlery fa-4x" aria-hidden="true"></i><br>레스토랑</li>
                		<li><i class="fa fa-rss fa-4x" aria-hidden="true"></i><br>와이파이</li>
                		<li><i class="fa fa-leaf fa-4x" aria-hidden="true"></i><br>욕실용품</li>
                		<li><i class="fa fa-coffee fa-4x" aria-hidden="true"></i><br>미니바</li>
                		<li><i class="fa fa-exclamation-triangle fa-4x" aria-hidden="true"></i><br>금연</li>
                		<li><i class="fa fa-car fa-4x" aria-hidden="true"></i><br>무료주차</li>
                		<li><i class="fa fa-glass fa-4x" aria-hidden="true"></i><br>라운지</li>
                		<li><i class="fa fa-comments fa-4x" aria-hidden="true"></i><br>세미나실</li>
                		<li><i class="fa fa-television fa-4x" aria-hidden="true"></i><br>TV</li>
                		<li><i class="fa fa-connectdevelop fa-4x" aria-hidden="true"></i><br>에어컨</li>
                		<li><i class="fa fa-wheelchair fa-4x" aria-hidden="true"></i><br>장애인편의시설</li>
            		</ul>
        		</section>
        	</div>
       
        	<div class="info_wrap">	
        		<button type="button" id="default_info_tab2" onclick="fn_spread('default_info')" class="category">
        			<span> 기본 정보</span>
        		</button>
        		
        		<section class="default_info" id="default_info">
					<h3>주변정보</h3>
					<ul>
						<li>해운대 해수욕장 앞</li>
						<li>해운대역 도보 10분</li>
						<li>광안리 해변 차량 15분</li>
					</ul>
					<h3>공지사항</h3>
					<ul>
						<li><font color="#0652ff">연박 예약 시, 체크인 시 프론트에 "연박" 여부 사전고지 필수</font></li></ul>
					<h3>기본 정보</h3>
					<ul>
						<li>체크인 : 15:00 | 체크아웃 : 11:30</li><li>무료 Wi-Fi</li><li>전 객실 금연</li><li>Bath Amenity (치약, 칫솔 유료)</li></ul>
					<h3>인원 추가 정보</h3>
					<ul>
						<li><font color="#0652ff">전 객실 최대 성인 3인 또는 성인 2인 + 소인 2인까지 이용 가능 (유료)</font></li>
						<li>기준인원 외 추가 시, 1인 72,600원 (8세 이상~성인), 7세 미만 무료 (씨메르 객실 제외)</li>
						<li>기본 포함 사항 : 씨메르 및 수영장, 키즈 빌리지 포함 / 신관 이용 시, 소파 베드 제공 </li>
						<li>씨메르 : 1인 33,000원 (성인), 16,500원 (49개월 이상~초등학생), 49개월 미만 무료</li>
						<li>침대 추가 : 인원 추가비용에 포함 (신관 이용시 쇼파베드 제공)</li>
						<li>현장 결제</li>
					</ul>
					<h3>객실 정보</h3>
					<ul><li>[디럭스 온돌] 객실 토요일 및 특정 공휴일 이용 시, 추가요금 발생 (30,000원/현장결제)</li></ul>

					<h3>투숙객 혜택</h3>
					<ul>
						<li>씨메르 (성인 2인), 야외오션 풀 & 파라다이스 키즈 빌리지 (성인 2인+소인 2인) 무료 제공</li>
						<li><b>설레는 봄, 특별혜택! 4월 15일까지 씨메르 무제한 입장</b></li>
					</ul>
					<h3>부대시설 정보</h3>
					<ul>
						<li>파라다이스 키즈빌리지 / 본관 지하 1층</li>
						<li>On The Plate (레스토랑)</li>
						<li>닉스 그릴 (레스토랑) / 신관 2층 </li>
						<li>남풍 (중식 레스토랑)</li>
						<li>사까에 (일식 레스토랑)</li>
						<li>파라다이스 부티끄 베이커리</li>
						<li>하바 키즈라운지</li>
						<li>크리스탈 가든</li>
						<li>골프장</li>
						<li>찰리스 (Bar) / 본관 지하 1층</li>
						<li>피트니스 센터 / 본관 4층 (남성전용), 신관 4층 / 06:00~21:00</li>
						<li>본관 사우나 / 본관 4층 / 남성전용 / 06:00~22:00</li>
						<li>신관 사우나 / 본관 4층 / 여성전용 / 06:00~22:00 </li>
						<li>오션스파 씨메르 (스파) / 본관 4층 / 스파존 08:00~22:00, 키즈존 11:00~20:00 / 씨메르 1인 33,000원 (48개월 이상~성인), 16,500원 (48개월 미만) / 외부고객 이용불가</li>
						<li>야외 수영장 / 신관 </li>
						<li>플레이스테이션 존 / 10:00~20:00</li>
						<li>라운지 파라다이스 (신관) / (월~목) 14세 이상 출입 가능 (성인 전용 라운지), (금~일) 49개월 이상 출입 가능 (어린이 동반 패밀리 라운지) / All Day Service (라운지 조식, 티 서비스, 해피 아워) 제공 / 호텔 사정에 의해 변동될 수 있습니다 </li>
						<li><b>[부대시설 휴장 및 재오픈, 영업시간 변경 안내]</b></li>
						<li>-휴장</li>
						<li>실내사우나 / 수영장 / 피트니트센터 / 라운지 : ~2020년 4월 15일까지 휴장</li>
						<li>키즈빌리지 / 뷔페 : ~2020년 4월 29일까지 휴장</li>
						<li>-레져 부대시설 재오픈 </li>
						<li>씨메르 : 2020년 4월 16일 / 11:00~20:00</li>
						<li>남자 사우나, 여자 사우나, 수영장, 피트니스 센터, 실내 골프 : 2020년 4월 16일</li>
						<li>본관 및 신관 라운지 (EXE) : 2020년 4월 16일 (신관 통합 라운지 운영)</li>
						<li>키즈 빌리지, LEO 체험 프로그램 : 2020년 4월 30일</li>
					</ul>
					<h3>조식 정보</h3>
					<ul>
						<li>On The Plate / 본관 1층 / 06:30~10:30</li>
						<li>주중 (일~목), 금요일 : 인원 추가 시 1인 42,000원 (13세 이상~성인), 29,000원 (12세 미만)</li>
						<li>토요일, 공휴일 전날 : 인원 추가 시 1인 52,000원 (13세 이상~성인), 29,000원 (12세 미만)</li>
						<li>위 금액은 조식 사전 예약에 한합니다 </li><li>현장 사전결제 및 프론트 문의</li>
					</ul>
					<h3>취소 및 환불 규정</h3>
					<ul>
						<li><b>[비수기]</b></li>
						<li>체크인 기준 2일 전 18시까지 : 100% 환불</li>
						<li>체크인 기준 2일 전 18시이후~1일 전 18시까지 : 50% 환불 </li>
						<li>체크인 기준 1일 전 18시이후~당일 및 No-show : 환불불가</li>
						<li><b>[성수기]</b></li>
						<li>체크인일 기준 5일전 18시까지 : 100% 환불</li>
						<li>체크인일 기준 5일전 18시이후~당일 및 No-show : 환불불가</li>
						<li><b><font color="#CA0101">[24시간 코지스테이 패키지], [핫딜 특가], [4월! 조식&얼리버드 특가], [3월! 핫딜 특가], [MD픽! 특가-조식], [MD Pick! 특가], [3월! 조식&얼리버드 특가], [연박할인] [힐링투나잇 패키지], [2인 조식] 객실</font></font></b></li>
						<li>체크인일 기준 5일전 18시까지 : 100% 환불</li>
						<li>체크인일 기준 5일전 18시이후~당일 및 No-show : 환불불가</li>
						<li>취소, 환불시 수수료가 발생할 수 있습니다</li>
					</ul>

					<h3>확인사항 및 기타</h3>
					<ul>
						<li><b>체크인 시 Deposit(보증금)을 요구할 수 있고, 퇴실 시 전액 환불됩니다</li>
						<li>(단, 유료서비스 이용 및 기물파손 시 청구될 수 있음)</b></li>
						<li>최대인원 초과시 입실 불가합니다</li>
						<li>위의 정보는 호텔의 사정에 따라 변경될 수 있습니다</li>
						<li>해당 이미지는 실제와 상이 할 수 있습니다</li>
						<li>체크인 시 배정 또는 베드타입 미기재 상품은 특정객실과 베드타입을 보장하지 않습니다</li>
						<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
						<li>미성년자는 보호자 동반없이 이용하실 수 없습니다</li>
					</ul>
        		</section>
     		</article>
     	</div>
     	<!-------------- 리뷰	 -->
     	<div class="review_wrap">
     		<article>
				<div class="reviewbox">
					<div class="user">
					<h3><i class="fas fa-h-square"></i>아이디</h3>
					2020.10.2
					</div>
				<div class="write"> 
					<br>
						<i class="fas fa-star"></i>
			 			<i class="fas fa-star-half-alt"></i>
			 			<i class="far fa-star"></i>
						평점 5.0/5 <br>
						<h3>제목 가성비 값 </h3>
					내용 완전 좋아요 위치도 맘에 들어요 내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요
					내용 완전 좋아요 위치도 맘에 들어요 내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요	
				</div>
			</div>
			<div class="reviewbox">
					<div class="user">
					<h3><i class="fas fa-h-square"></i>아이디</h3>
					2020.10.2
					</div>
				<div class="write"> 
					<br>
						<i class="fas fa-star"></i>
			 			<i class="fas fa-star-half-alt"></i>
			 			<i class="far fa-star"></i>
						평점 5.0/5 <br>
						<h3>제목 가성비 값 </h3>
					내용 완전 좋아요 위치도 맘에 들어요 내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요
					내용 완전 좋아요 위치도 맘에 들어요 내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요내용 완전 좋아요 위치도 맘에 들어요	
				</div>
			</div>
		</article>
		<input type="button" value="이용 후기 모두 보기" id="check">
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
                           <td><i class="fas fa-h-square"></i>에바종 소개</td>
                           <td><i class="fas fa-bullhorn"></i>공지 사항</td>
                           <td><i class="fas fa-question"></i>자주 묻는 질문</td>  
                        </tr>
                        <tr>
                           <td><i class="far fa-file-alt"></i>이용 약관</td>
                           <td><i class="fas fa-lock"></i>개인정보취급방침</td>
                           <td><i class="fas fa-user-friends"></i>인재 채용</td>
                        </tr>
                    </table>
                </div>
                <div class="left_mid">
                   <i class="fas fa-map-marker-alt"></i>
                    인기 여행지     푸켓 다낭
                </div>
            </div>
            <div class="footer_right">
                contact <br>
                전화: 1577 - 9056    |   이메일: info@evasion.co.kr <br>
                에바종 고객센터 운영 시간: <br>
                9AM ~ 6PM (월요일 ~ 금요일, 공휴일 제외) <br>
                광고/제휴문의: ad@evasion.co.kr <br>
                주소: 서울특별시 중구 정동길 33 신아기념관 304호.
            </div>
      </div>
        <div class="footer_bottom">
            <div class="footer_bottom1">
                (주)본보야지   대표자: 에드몽 위그 제라르 
                2013-서울 중구-1277  |   211-88-68189 <br><br>
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
    
     //더보기 토글
    function showplay() {
        var flag = $('#hidTempSynopsis');
        var SynopsisDiv = $('#SynopsisDiv');
        var flagValue = flag.val();
        if (flag != null) {
            if (flagValue == "0") {
                SynopsisDiv.css("height", "auto");
                SynopsisDiv.css("font-size", "12px");
                SynopsisDiv.css("display", "block");
                $("#synopMore").text("닫기");
                flag.val("1");
            }
            else {
                SynopsisDiv.css("height", "46.5px");
                SynopsisDiv.css("display", "-webkit-box");
                $("#synopMore").text("더보기");
                flag.val("0");
            }
        }
        else {
            alert("[더보기] 추가 정보가 없습니다.");
        }
    }

    </script>
    
<script type="text/javascript">
$(document).ready(function() {
	$('.room_info').show(); //페이지를 로드할 때 표시할 요소
	$('.detail_info').hide(); //페이지를 로드할 때 숨길 요소
	$('.review_wrap').hide();
	
	$('.a').click(function(){
		$ ('.detail_info').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.room_info').show(); //클릭 시 두 번째 요소 표시
		$('.review_wrap').hide();
		return false;
	});
	$('.b').click(function(){
		$ ('.room_info').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.detail_info').show(); //클릭 시 두 번째 요소 표시
		$('.review_wrap').hide();
		return false;
	});
	$('.c').click(function(){
	$ ('.room_info').hide(); //클릭 시 첫 번째 요소 숨김
	$ ('.detail_info').hide(); //클릭 시 두 번째 요소 숨김
	$ ('.review_wrap').show(); //클릭 시 두 번째 요소 표시
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
    		alert("로그인이 필요한 서비스입니다.");
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
    /* 로그인 팝업창 */
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