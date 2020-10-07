<%@page import="hotel.search.*"%>
<%@page import="hotel.login.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
		HTSearchDTO searchDto = (HTSearchDTO)session.getAttribute("searchInfo");
		HTDataDTO hotelData = (HTDataDTO)request.getAttribute("hotelData");
		HTRoomDataDTO roomData = (HTRoomDataDTO)request.getAttribute("roomData");
		loginvaleuDTO userData = (loginvaleuDTO)request.getAttribute("userData");
	%>
	
	<!-- 최저가 보장 hide  -->
	<div class="hideWrap" style="display: none; width: 100%;position: fixed;height: 100%;background: rgba(0,0,0,0.9); z-index:1;">
	<div class="hide" style="position: absolute;left: 40%;top: 40%;transform: translate(-40%,-40%);width: 600px;height: 600px;background: #fff;">
	            <div id="guarantee">
	                <h2 class="heading">최저가 보장</h2>
	                <div class="featherlight-content-scroll">
	                    <p>저희 웹사이트에서 예약한 상품이 타 예약사이트의 상품보다 더 비싼 경우, 신고하시면 가격을 조정해드립니다. 다음 요건들이 충족된 경우에만 신고가 가능합니다.</p>
	                    <ol>
	                        <li>예약 후 24시간 이내에 더 낮은 최저가 상품의 링크와 최저가를 호텔스컴바인에 보내주시기 바랍니다.</li>
	                        <li>
	                           	 최저가 상품은 다음 조건이 동일해야 합니다.
	                            <ul>
	                                <li>객실 유형</li>
	                                <li>체크인, 체크아웃 시간</li>
	                                <li>예약취소정책, 선불 결제, 식사 계획, 패키지 상품 등 예약 조건</li>
	                                <li>통화</li>
	                            </ul>
	                        </li>
	                        <li>최저가 상품은 반드시 온라인 예약이 가능한 상품이어야 하며 호텔스컴바인에서 확인 시에도 예약이 가능한 상태여야 합니다.</li>
	                        <li>멤버십 회원이나 단골 고객을 위한 상품 또는 기타 보상 제도에 따른 상품은 비교 대상이 될 수 없습니다.</li>
	                    </ol>
	                    <button type="button" style="background-color: green;color: white; margin: 20px;">닫기</button>
	                </div>
	            </div>
	        </div>
	    </div>
	<!-- 최저가 보장 hide  -->
	<!-- 전체 시작   -->   
	<div id="wrapper" style="width: 100%;">
	    <div class="body" dir="ltr" style="width: 100%;">
	        <div class="header dontprint"></div>
	    </div>
	    <div class="content--surround" style="display: flex; width: 100%; margin-left: 15%; margin-right: 15%;">
	    <div class="twinCol cf booking-page-2" style="width: 50%;">
	        <fieldset class="property-info">
	            <div class="field-surround cf" style="display: flex;">
	                <div class="property-info__image">
	                    <img src="https://media.datahc.com/Hotelier/Library/ext-LS9988634.jpg">
	                </div>
	                <div class="property-info__details fleft property-info__has-ratings" style="margin: 10px;">
	                    <div class="property-info__name"><%=hotelData.getName() %></div>
	                    <div class="property-info__address js-property-address">
	                        <i class="fa fa-map-marker fa-fw" style="font-size: 10px;color: gray;"></i>
	                        <span style="font-size: 10px;color: gray;"><%=hotelData.getAddress() %></span>
	                    </div>
	                </div>
	                <div class="inline-review-ratings" style="width: 150px;height: 75px;background-color: green; color: white;">
	                    <div class="image-gallery_reviews" style="margin: 10px;">
	                        <div class="reviews__sentiment">
	                            <i class="fa fa-1x fa-check-circle"></i>
	                            	<%if(hotelData.getGrade() >= 4.5f){%>
										매우좋음
									<%}else if(hotelData.getGrade() >= 3.5f){%>
										좋음
									<%}else if(hotelData.getGrade() >= 2.5f){%>
										보통
									<%}else if(hotelData.getGrade() >= 1.5f){%>
										나쁨
									<%}else{%>
										매우 나쁨
									<%}%>
									,<%=hotelData.getGrade() %> 
	                        </div>
	                        <div class="reviews__count" style="font-size: 10px;color: lightgray;">----개의 리뷰 기반</div>
	                    </div>
	                </div>
	            </div>
	        </fieldset>
	        <!--------------------------------------------------------------------------호텔소개 끝-->
	        <div class="highlight-message" style="background-color: green; color: white; font-size: 13px; margin: 5px;">
	            <div class="cf" style="display: flex;">
	                <i class="fa fa-check-circle fa-2x fa-fw fleft" style="margin: 4px;"></i>
	                <div class="highlightMessage-bottomline" style="margin: 10px;">
	                    스마트 초이스! - 무료 취소 가능
	                </div>
	            </div>
	            <div class="cf" style="display: flex;">
	                <i class="fa fa-credit-card fa-2x fa-fw fleft" style="margin: 4px;"></i>
	                <div class="highlightMessage-bottomline" style="margin: 10px;">
	                    미리 결제하지 않으셔도 됩니다. 호텔에서 지불하실 수 있습니다.
	                </div>
	            </div>
	        </div>
	        <!-------------------------------------------------------------------------예약자정보 시작-->
	        <div class="section__wrapper" id="js-details-section">
	            <h2 class="top">
	                <span>예약자 정보</span>
	                <span class="details-info-message" style="font-size: 10px; color: gray;">거의 완료되었습니다. * 필수 정보만 입력해 주세요.</span>
	            </h2>
	            <fieldset>
	            	<form action="HTReservationApplyAction.do" name="myForm" method="post">
		                <div class="field-surround" style="margin-top: 10px;">
		                   
		                    <div class="cf" style="display: flex;">
		                        <div class="split-column fleft">
		                            <div class="focusOnLoad required">
		                                <div class="field-label">
		                                    <label for="Name">이름</label>
		                                    <span class='requiredIndicator'>*</span>
		                                </div>
		                                <input class="Name" id="name" name="name" type="text" value="<%=userData.getName() %>" />
		                                <span class="positive-check">
		                                    <i class="fa fa-check"></i>
		                                </span>
		                            </div>
		                        </div>
		                    </div>
		                        
		                <div class="cf" >
		                    <div class="split-column fleft" style="margin-top: 10px;">
		                        <div class="required">
		                            <div class="field-label">
		                                <label for="phone">핸드폰 번호</label>
		                                <span class='requiredIndicator'>*</span>
		                            </div>
		                            <input class="Phone" id="Email" name="phone" type="text" value="<%=userData.getPhone() %>">
		                            <span class="positive-check">
		                                <i class="fa fa-check"></i>
		                            </span>
		                        </div>
		                    </div>
		                </div>
		                        
		                <div class="cf" style="margin-top: 10px;">
		                    <div class="split-column fleft">
		                        <div class=" required">
		                            <div class="field-label">
		                                <label for="Email">이메일</label>
		                                <span class='requiredIndicator'>*</span>
		                            </div>
		                            <input class="Email" id="email" name="email" type="text" value="<%=userData.getEmail() %>">
		                            <span class="positive-check">
		                                <i class="fa fa-check"></i>
		                            </span>
		                            <div class="email-confirm-message" style="color: gray; font-size: 12px;">
									이 이메일 주소로 예약 확인서가 발송됩니다.
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
	            
	            	<input type="hidden" name="hotelIdx" value="<%=hotelData.getIdx()%>">
	            	<input type="hidden" name="roomNum" value="<%=roomData.getRoomNum()%>">
	            	<input type="hidden" name="roomType" value="<%=roomData.getRoomType()%>">
	            	<input type="hidden" name="hotelName" value="<%=hotelData.getName()%>">
	            	<input type="hidden" name="checkIn" value="<%=searchDto.getCheckIn()%>">
	            	<input type="hidden" name="checkOut" value="<%=searchDto.getCheckOut()%>">
	            	<input type="hidden" name="userID" value="<%=userData.getId()%>">
	            	<input type="hidden" name="userName" value="<%=userData.getName()%>">
	            	<input type="hidden" name="price" value="<%=roomData.getRoomPrice()+roomData.getRoomPrice()/10 %>">
	            	
	            </form>
	        </fieldset>
	        </div>
	        <!-------------------------------------------------------------------------예약자정보 끝-->
	        <!-------------------------------------------------------------------------예약계실 시작-->
	        <div class="section__wrapper">
	            <h2 class="section__title">예약 객실</h2>
	            <fieldset>
	                <div class="field-surround">
	                    <div class="roomItem__info cf" style="display: flex;">
	                        <div class="roomItem__image roomItem__image--large">
	                            <img src="https://media.datahc.com/Hotelier/Library/ext-LS12599781.jpg" />
	                        </div>
	                        <div class="rate-info hc_rate" style=" margin: 10px;">
	                            <div class="roomItem__price-box fright">
	                                <div class="room-occupancy" style="font-size: 13px; color: gray;">
	                                    <span class="room-occupancy__adults" style="color:black;">
	                                        <% for(int i=0; i<roomData.getMinGuest(); i++){%>
	                                        	<i class="fa fa-user"></i>
	                                        <%}%>
	                                    </span>
	                                    <span class="room-occupancy__children" style="color:gray;">
	                                     <% for(int i=0; i<(roomData.getMaxGuest()-roomData.getMinGuest()); i++){%>
	                                        <i class="fa fa-user"></i>
	                                    <%}%>
	                                    </span>
	                                    <div><%=roomData.getMinGuest() %>~<%=roomData.getMaxGuest() %>인</div>
	                                </div>
	                                
	                                <input type="hidden" class="hc_ratePriceValue">
	                            </div>
	                            <div class="roomItem__rate-info roomItem__rate-info--no-img fleft">
	                                <div class="roomItem__rate-info--name">
	                                    <span><%=roomData.getRoomType() %></span>
	                                </div>
	                                <div class="roomItem__rate-info--view" style="margin-bottom: 10px;font-size: 12px;color: gray;">도시 전망</div>
	                                <div class="roomItem__price-info">                              
	                                    <div class="roomItem__price-info--item" style="font-size: 13px; color: green; margin-bottom: 10px">
	                                        <i class="fa fa-check-circle"></i>
	                                        <span class="FreeCancellation">무료 취소: 
	                                        <a class="helpInfoLink">
	                                       	<%=searchDto.getCheckIn()%> 오전 10:00
	                                        </a> 
	                                        	전까지 가능
	                                        </span>
	                                    </div>
	                                    <div class="extras extras--padding" style="font-size: 13px; margin-bottom: 10px; color: green;">
	                                        <div class="extras__item">
	                                            <div class="extras__icon extras__icon--v14 fleft"></div>
	                                            <div class="extras__text">와이파이 포함</div>
	                                        </div>
	                                        <div class="extras__item">
	                                            <div class="extras__icon extras__icon--v10 fleft"></div>
	                                            <div class="extras__text">전용 주차장 포함 (온사이트)</div>
	                                        </div>
	                                        <div class="extras__item">
	                                            <div class="extras__icon extras__icon--v71 fleft"></div>
	                                            <div class="extras__text">피트니스 센터 이용 가능</div>
	                                        </div>
	                                        <div class="extras__item">
	                                            <div class="extras__icon extras__icon--v145 fleft"></div>
	                                            <div class="extras__text">수영장 이용 포함</div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="roomItem__guests clear">
	                                <div class="roomItem__guest-name fleft">
	                                    <div class="field-label">
	                                        <label for="GuestSelectionViewModel_PrivateRates_0__GuestName">투숙객명</label>
	                                        <span class='requiredIndicator'>*</span>
	                                    </div>
	                                    <input class="js-guest-full-name guest-full-name" type="text" value="" />
	                                </div>
	                            </div>          
	                        </div>
	                    </div>
	                </div>
	            </fieldset>
	        </div>
	        <!-----------------------------------------------------------------------------------예약 객실 끝-->
	        <div class="section__wrapper special-requirements" id="js-specialrequirements">
	            <h2 style="margin-top: 10px; margin-bottom: 0;">특별 요청사항</h2>
	            <div style="margin-bottom: 10px; font-size: 12px; color: gray;">(단, 호텔사정에 따라 변동될 수 있습니다)</div>
	            <fieldset>
	                <div class="field-surround">
	                    <div>
	                        <textarea cols="60"  id="SpecialRequirements" name="SpecialRequirements" rows="10"></textarea>
	                    </div>
	                </div>
	            </fieldset>
	        </div>
	        <div class="button-wrap" style="margin-top: 10px; justify-content: flex-end;display: flex;">
	            <input class="fright positive-button" type="button" value="예약" onclick="rvApply()" style="background-color: green; color: white;">
	            <input class="back-nav fleft neutral-button" type="submit" value="취소"style="background-color: green; color: white;">
	        </div>
	        <!------------------------------------------------------------------------------>
	    </div>
	    <div class="booking-summary js-booking-summary" style="width: 25%;">
	        <h2 style="background-color: black; color: white; margin: 0; text-align: center;">예약 상세정보</h2>
	        <fieldset>
	            <div class="booking-summary__inner">
	                <div class="booking-summary__details" style="border-bottom: 1px solid gray;">
	                    <div class="cheackIn" style="margin-bottom: 5px;">
	                        <div class="cheackIn_label">체크인</div>
	                        <div class="InDate"><%= searchDto.getCheckIn() %> </div>
	                    </div>
	                    <div class="cheackOut">
	                        <div class="cheackOut-label">체크아웃</div>
	                        <div class="outDate"><%= searchDto.getCheckOut() %> </div>
	                    </div>
	                </div>
	
	                <div class="booking-summary__rate-breakdown">
	                    <div class="booking-summary__rate-breakdown-inner">
	                        <div class="js-room-price field-row booking-summary__section--border room-price" style="display: flex;justify-content: space-between; font-size: 15px; ">
	                            <div class="field-row__label fleft">
	                                <div class="booking-summary__promotion-room">&nbsp;</div>
	                                <span>객실 1개</span>
	                            </div>
	                            <div class="field-row__value field-row__value--right price fright">
	                                    <div class="booking-summary__promotion-room">
	                                        <strong><i class="fa fa-trophy"></i> 프로모션 딜</strong>
	                                    </div>
	                                    <div id="RoomPriceInGuestCurrency" class="js-room-price__guest-currency price__guest-currency price__guest-currency--room price__guest-currency--highlight">
	                                    </div>
	                                    <div id="RoomPriceInPropertyCurrency" class="js-room-price__local-currency price__local-currency price__local-currency--highlight" style="color: dodgerblue;">
										<%=roomData.getRoomPrice() %>원
										</div>
	                            </div>
	                        </div>
	
	                        <div class="js-extras-price field-row invisible">
	                            <div class="field-row__label fleft " style="margin-top: 5px;">추가 요금</div>
	                            <div class="field-row__value field-row__value--right price fright">
	                                <div id="ExtrasPriceInGuestCurrency" class="js-price__guest-currency price__guest-currency price__guest-currency--extras">
	                                </div>
	                                <div id="ExtrasPriceInPropertyCurrency" class="js-price__local-currency price__local-currency price__local-currency--highlight">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="field-row js-tax-price " style="display: flex;justify-content: space-between; border-bottom: 1px solid gray; margin-top: 5px;" >
	                            <div class="field-row__label fleft ">세금</div>
	                            <div class="field-row__value field-row__value--right price fright">
	                                <div id="TaxPriceInGuestCurrency_37475" class="price__guest-currency price__guest-currency--extras"></div>
	                                <div id="TaxPriceInPropertyCurrency_37475" class="price__local-currency price__local-currency--highlight" style="color: dodgerblue">
	                                   <%=roomData.getRoomPrice()/10 %>원
	                                </div>
	                            </div>
	                        </div>
	                        <div class="js-booking-summary__inclusions booking-summary__inclusions booking-summary__section--border" >
	                            <div class="label">예약 포함 내역</div>
	                            <ul class="inclusions-list" style="color: green; font-size: 12px; border-bottom: 1px solid gray;margin: 0px;margin-top: 5px;">
	                                <li class="included">와이파이</li>
	                                <li class="included">개인 전용 주차장 (온 사이트)</li>
	                                <li class="included">수영장 이용 가능</li>
	                                <li class="included">피트니스 센터 이용</li>
	                            </ul>
	                        </div>
	
	                        <div class="field-row js-booking-summary__amendments booking-summary__amendments booking-summary__section--border  hide">
	                        </div>
	                        <div class="field-row js-total-price total-price booking-summary__section--border field-row " style="display: flex; justify-content: space-between; border-bottom: 1px solid gray;">
	                            <div class="field-row__label field-row__label--large fleft"><strong>합계</strong></div>
	                            <div class="field-row__value field-row__value--large field-row__value--right price fright">
	                                <div id="TotalPriceInGuestyCurrency" class="js-price__guest-currency price__guest-currency price__guest-currency--highlight">
	                                </div>
	                                <div id="TotalPriceInPropertyCurrency" class="js-price__local-currency price__local-currency price__local-currency--highlight" style="color: dodgerblue;">
	                                 <%=roomData.getRoomPrice()+roomData.getRoomPrice()/10 %>원
	                                </div>
	                                <div id="js-guests-and-nights" class="guest-and-nights" style="font-size: 12px;color: gray;">1박</div>
	                            </div>
	                        </div>
	                        <div class="booking-summary__payment-on-arrival booking-summary__section--border field-row">
	                            <div class="field-row__label field-row__label--large fleft"><strong>선결제 금액</strong></div>
	                            <div class="field-row__value field-row__value--large field-row__value--right price fright">
	                                <div class="price__guest-currency price__guest-currency--highlight"></div>
	                                <div class="price__local-currency price__local-currency--highlight" style="color: dodgerblue;">0원</div>
	                            </div>
	                            <div class="booking-summary__payment-on-arrival-msg clear" style="color: gray;font-size: 12px">호텔에서 결제가 진행됩니다.</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </fieldset>
	
	        <div class="guarantee cf" style="background-color: greenyellow; color: white; text-align: center;">
	            <button type="button" class="price-btn" style="width: 100%; background-color: green; color: white">
	                <span class="guarantee__text"><i class="fa fa-check"></i><span>최저가 보장</span></span>
	            </button>
	        </div>
	    </div>
	</div>       
	</div>
	
	<script type="text/javascript">
		function rvApply(){
			var form = document.myForm;
			form.submit();
		}
	</script>
	
	
	<script>
	    $(document).ready(function(){
	    $(".price-btn").click(function(){
	        $(".hideWrap").fadeIn();
	    });
	    $(".hide").click(function(){
	        $(".hideWrap").fadeOut();
	    });
	});
	</script>
</body>
</html>