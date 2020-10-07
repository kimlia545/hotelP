<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/jquery.form.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style type="text/css">
	*,html,body{
		box-sizing: border-box;
	}

	.topbar{
		width: 1100px;
		height: 430px;
	}
	.centerbar{
		height: 200px;
	}
	#hotelimgpreview{
		display: none;
	}
	#hotelimgpreview img{
		width: 500px;
		height: 405px;
	}
	.guestimg{
		display: none;
	}
	.guestimg img{
		
		width: 300px;
		height: 200px;
	}
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
           -webkit-line-clamp: 0;
           -webkit-box-orient: vertical;
        }
	
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
	
	.theme_wrap{display: flex;}
   .ser_wrap>button{width:100%;height: 50px;text-align: left;}
   .ser_wrap>button>span{margin-left: 10px;}
   .category{width:100%;height: 50px;text-align: left;margin-bottom: 10px;border: none;}
   .category>span{margin-left: 10px;}
   .theme_wrap>li{margin:0 auto;text-align: center;list-style: none;}
   .theme_wrap>li>i{display:inline; margin:0 auto;}
   
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
  }
</style>
</head>
<body>
<form action="roominsertpageaction.do" method="post" enctype=multipart/form-data>
<input type="hidden" value="<%=session.getAttribute("ceoid")%>" name=ceoid>
<div style="border: 1px solid black; padding: 15px; width: 1150px; margin: 0 auto;" >
	<div style="display: flex" class ="topbar">
		<div style="width: 503px; border: 1px solid black;">
			<div id="hotelimgpreview" ><img src="#"/><br/><a href="#">Remove</a></div>
			<input type="file" name="hotelimg" id="hotelimg">
		</div>
		<div>
			<div style="width:300; margin-right: 10px; margin-left: 10px; ">
				<input type="text" placeholder="호텔 이름" name="hotelname"><br><br>
			 	<img src="hotelimg/star_gray.png">
			 	<img src="hotelimg/star_gray.png">
			 	<img src="hotelimg/star_gray.png">
			 	<img src="hotelimg/star_gray.png">
			 	<img src="hotelimg/star_gray.png">
			 	 <br><br>
			 	<input type="text" placeholder="호텔주소" name="hoteladdress"><br><br><br>
			 	
			 </div>
		</div>
		<br>
		<div style="width: 350px">객실 수 
			<input type="text" placeholder="방 갯수 " name="roomamount" class="roomamount" value="1">
			<input type="button" value="객실 생성" name=roomin id="addroom">
		
		</div><br>
	</div>
	
	<div class="center_Click" style="width: 1100px;height: 75px">
		<button type="button" class="a"onclick="tab1">객실안내/예약</button>
		<button type="button" class="b" onclick="tab2">숙소정보</button>
		<button type="button" class="c" onclick="tab3">리뷰</button>
	</div>
<div class="room_info">
	<table style="border: 1px solid black; width: 1105px; padding: 5px; border-collapse: collapse;">		
			<tr>
				<td rowspan="5" style="width: 300px;height: 200px; border: 1px solid black;">
					<div class="guestimg">
						<img src="#"/>
						<br/>
						<a href="#">Remove</a>
					</div>
					<input type="file" name="roomimg0" class="roomimg">
				</td>
				<td><input type="text" placeholder="객실타입" name="roomtype0" style="font-weight: bold; height: 30px; width: 150px"></td>
				<td><input type="text" placeholder="최소 투숙객 " name="minguest0" style="width: 75px"> ~ <input type="text" placeholder="최대 투숙객" name="maxguest0" style="width: 75px"></td>	
			</tr>
			
			<tr style="margin-left: 20px;">
				<td style="width: 560px; margin-left: 20px;">가격</td>
				<td><input type="text" placeholder="객실 가격" name="roomprice0"></td>
			</tr>
			
			<tr>
				<td colspan="1"><input type="text" placeholder="객실 수" name="guestroomamount" style="width: 150px"></td>
			</tr>
			
			<tr>
				<td class="guest_btn" colspan="2" style="height:50px;"><input type="button" value="객실 이용 안내" style="width: 800px; height: 40px"></td>
				
			</tr>
				
			<tr>	
				<td colspan='2' style=height:50px;><input type='button' value='예약' style='width: 800px; height: 40px'></td>	
			</tr>
		</table>
		<div id="rooms"></div>
	<input type="submit" value="작성 완료">
</div>

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
		</article>
		<input type="button" value="이용 후기 모두 보기" id="check">
	</section>
    </div>
</div>
</form>


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



<script type="text/javascript">
	$(function(){
		$('#hotelimg').on('change', function() {
		    
		    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
		    
		    //배열에 추출한 확장자가 존재하는지 체크
		    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		        resetFormElement($(this)); //폼 초기화
		        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
		    } else {
		        file = $('#hotelimg').prop("files")[0];
		        blobURL = window.URL.createObjectURL(file);
		        $('#hotelimgpreview img').attr('src', blobURL);
		        $('#hotelimgpreview').slideDown(); //업로드한 이미지 미리보기 
		        $(this).slideUp(); //파일 양식 감춤
		    }
		});
		
		$('#hotelimgpreview a').bind('click', function() {
		    resetFormElement($('#hotelimg')); //전달한 양식 초기화
		    $('#hotelimg').slideDown(); //파일 양식 보여줌
		    $(this).parent().slideUp(); //미리 보기 영역 감춤
		    return false; //기본 이벤트 막음
		});
		
		
		//동적으로 추가 된 요소에 첨부 이벤트에 이벤트 위임
		$("body").on('change','.roomimg',function() {
			ext = $(this).val().split('.').pop().toLowerCase(); //확장자

		    //배열에 추출한 확장자가 존재하는지 체크
		    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		        resetFormElement($(this)); //폼 초기화
		        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
		    } else {
		    	
		        file = $(this).prop("files")[0];
		        blobURL = window.URL.createObjectURL(file);
		        
		        $(this).prev(".guestimg").children("img").attr('src', blobURL);
		        $(this).prev().slideDown();
		        
		       // $('.guestimg img').attr('src', blobURL);
		       // $('.guestimg').slideDown(); //업로드한 이미지 미리보기 
		        $(this).slideUp(); //파일 양식 감춤
		    } 
		});
	
		$('.guestimg a').bind('click', function() {
		    resetFormElement($('.roomimg')); //전달한 양식 초기화
		    $('.roomimg').slideDown(); //파일 양식 보여줌
		    $(this).parent().slideUp(); //미리 보기 영역 감춤
		    return false; //기본 이벤트 막음
		});
		
		
		
		
		
		
		
		$("#addroom").click(function(){
			var roomamount =$(".roomamount").val();
			$("#rooms").empty();
			for(var i=1;i<roomamount;i++){ 			
				var txt ="<br>"
					txt +="<table style='border: 1px solid black; width: 1100px; padding: 5px; border-collapse: collapse;'>";		
					txt +="<tr>";
					txt +="<td rowspan='5' style='width: 300px;height: 200px; border: 1px solid black;'><div class='guestimg'><img src='#'/><br/><a href=''#'>Remove</a></div><input type='file' name='roomimg"+i+"' class='roomimg'></td>";
					txt +="<td><input type='text' placeholder='객실타입' name='roomtype"+i+"' style='font-weight: bold; height: 30px; width: 150px'></td>";
					txt +="<td><input type='text' placeholder='최소 투숙객' name='minguest"+i+"' style='width: 75px'> ~ <input type='text' placeholder='최대 투숙객' name='maxguest"+i+"' style='width: 75px'></td>";	
					txt +="</tr>";
					txt +="<tr style='margin-left: 20px;'>";
					txt +="<td style='width: 570px; margin-left: 20px;'>가격</td>";
					txt +="<td><input type='text' placeholder='객실 가격' name='roomprice"+i+"'></td>";
					txt +="<tr><td colspan='1'><input type='text' placeholder='객실 수' name='guestroomamount"+i+" style='width: 150px'></td></tr>";
					txt +="</tr>";
					txt +="<tr>";
					txt +="<td colspan='2' style=height:50px;><input type='button' value='객실 이용 안내' style='width: 800px; height: 40px'></td>";
					txt +="</tr>";
					txt +="<tr>";
					txt +="<td colspan='2' style=height:50px;><input type='button' value='예약' style='width: 800px; height: 40px'></td>";
					txt +="</tr>";
					txt +="</table>";
					$("#rooms").append(txt);
			} 		
						
		});
	
	});
	function resetFormElement(e) {
	    e.wrap('<form>').closest('form').get(0).reset(); 
	    //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
	    //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
	    //DOM에서 제공하는 초기화 메서드 reset()을 호출
	    e.unwrap(); //감싼 <form> 태그를 제거
	}
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
	function fn_spread(id){
		var getID = document.getElementById(id);
		getID.style.display=(getID.style.display=='none') ? 'block' : 'none'; }

	function fn_spread2(id){
		var getID = document.getElementById(id);
		getID.style.display=(getID.style.display=='none') ? 'block' : 'none'; }
</script>

</body>
</html>