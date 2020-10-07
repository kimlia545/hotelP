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
	
	<!-- ������ ���� hide  -->
	<div class="hideWrap" style="display: none; width: 100%;position: fixed;height: 100%;background: rgba(0,0,0,0.9); z-index:1;">
	<div class="hide" style="position: absolute;left: 40%;top: 40%;transform: translate(-40%,-40%);width: 600px;height: 600px;background: #fff;">
	            <div id="guarantee">
	                <h2 class="heading">������ ����</h2>
	                <div class="featherlight-content-scroll">
	                    <p>���� ������Ʈ���� ������ ��ǰ�� Ÿ �������Ʈ�� ��ǰ���� �� ��� ���, �Ű��Ͻø� ������ �����ص帳�ϴ�. ���� ��ǵ��� ������ ��쿡�� �Ű� �����մϴ�.</p>
	                    <ol>
	                        <li>���� �� 24�ð� �̳��� �� ���� ������ ��ǰ�� ��ũ�� �������� ȣ�ڽ��Ĺ��ο� �����ֽñ� �ٶ��ϴ�.</li>
	                        <li>
	                           	 ������ ��ǰ�� ���� ������ �����ؾ� �մϴ�.
	                            <ul>
	                                <li>���� ����</li>
	                                <li>üũ��, üũ�ƿ� �ð�</li>
	                                <li>���������å, ���� ����, �Ļ� ��ȹ, ��Ű�� ��ǰ �� ���� ����</li>
	                                <li>��ȭ</li>
	                            </ul>
	                        </li>
	                        <li>������ ��ǰ�� �ݵ�� �¶��� ������ ������ ��ǰ�̾�� �ϸ� ȣ�ڽ��Ĺ��ο��� Ȯ�� �ÿ��� ������ ������ ���¿��� �մϴ�.</li>
	                        <li>����� ȸ���̳� �ܰ� ���� ���� ��ǰ �Ǵ� ��Ÿ ���� ������ ���� ��ǰ�� �� ����� �� �� �����ϴ�.</li>
	                    </ol>
	                    <button type="button" style="background-color: green;color: white; margin: 20px;">�ݱ�</button>
	                </div>
	            </div>
	        </div>
	    </div>
	<!-- ������ ���� hide  -->
	<!-- ��ü ����   -->   
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
										�ſ�����
									<%}else if(hotelData.getGrade() >= 3.5f){%>
										����
									<%}else if(hotelData.getGrade() >= 2.5f){%>
										����
									<%}else if(hotelData.getGrade() >= 1.5f){%>
										����
									<%}else{%>
										�ſ� ����
									<%}%>
									,<%=hotelData.getGrade() %> 
	                        </div>
	                        <div class="reviews__count" style="font-size: 10px;color: lightgray;">----���� ���� ���</div>
	                    </div>
	                </div>
	            </div>
	        </fieldset>
	        <!--------------------------------------------------------------------------ȣ�ڼҰ� ��-->
	        <div class="highlight-message" style="background-color: green; color: white; font-size: 13px; margin: 5px;">
	            <div class="cf" style="display: flex;">
	                <i class="fa fa-check-circle fa-2x fa-fw fleft" style="margin: 4px;"></i>
	                <div class="highlightMessage-bottomline" style="margin: 10px;">
	                    ����Ʈ ���̽�! - ���� ��� ����
	                </div>
	            </div>
	            <div class="cf" style="display: flex;">
	                <i class="fa fa-credit-card fa-2x fa-fw fleft" style="margin: 4px;"></i>
	                <div class="highlightMessage-bottomline" style="margin: 10px;">
	                    �̸� �������� �����ŵ� �˴ϴ�. ȣ�ڿ��� �����Ͻ� �� �ֽ��ϴ�.
	                </div>
	            </div>
	        </div>
	        <!-------------------------------------------------------------------------���������� ����-->
	        <div class="section__wrapper" id="js-details-section">
	            <h2 class="top">
	                <span>������ ����</span>
	                <span class="details-info-message" style="font-size: 10px; color: gray;">���� �Ϸ�Ǿ����ϴ�. * �ʼ� ������ �Է��� �ּ���.</span>
	            </h2>
	            <fieldset>
	            	<form action="HTReservationApplyAction.do" name="myForm" method="post">
		                <div class="field-surround" style="margin-top: 10px;">
		                   
		                    <div class="cf" style="display: flex;">
		                        <div class="split-column fleft">
		                            <div class="focusOnLoad required">
		                                <div class="field-label">
		                                    <label for="Name">�̸�</label>
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
		                                <label for="phone">�ڵ��� ��ȣ</label>
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
		                                <label for="Email">�̸���</label>
		                                <span class='requiredIndicator'>*</span>
		                            </div>
		                            <input class="Email" id="email" name="email" type="text" value="<%=userData.getEmail() %>">
		                            <span class="positive-check">
		                                <i class="fa fa-check"></i>
		                            </span>
		                            <div class="email-confirm-message" style="color: gray; font-size: 12px;">
									�� �̸��� �ּҷ� ���� Ȯ�μ��� �߼۵˴ϴ�.
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
	        <!-------------------------------------------------------------------------���������� ��-->
	        <!-------------------------------------------------------------------------������ ����-->
	        <div class="section__wrapper">
	            <h2 class="section__title">���� ����</h2>
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
	                                    <div><%=roomData.getMinGuest() %>~<%=roomData.getMaxGuest() %>��</div>
	                                </div>
	                                
	                                <input type="hidden" class="hc_ratePriceValue">
	                            </div>
	                            <div class="roomItem__rate-info roomItem__rate-info--no-img fleft">
	                                <div class="roomItem__rate-info--name">
	                                    <span><%=roomData.getRoomType() %></span>
	                                </div>
	                                <div class="roomItem__rate-info--view" style="margin-bottom: 10px;font-size: 12px;color: gray;">���� ����</div>
	                                <div class="roomItem__price-info">                              
	                                    <div class="roomItem__price-info--item" style="font-size: 13px; color: green; margin-bottom: 10px">
	                                        <i class="fa fa-check-circle"></i>
	                                        <span class="FreeCancellation">���� ���: 
	                                        <a class="helpInfoLink">
	                                       	<%=searchDto.getCheckIn()%> ���� 10:00
	                                        </a> 
	                                        	������ ����
	                                        </span>
	                                    </div>
	                                    <div class="extras extras--padding" style="font-size: 13px; margin-bottom: 10px; color: green;">
	                                        <div class="extras__item">
	                                            <div class="extras__icon extras__icon--v14 fleft"></div>
	                                            <div class="extras__text">�������� ����</div>
	                                        </div>
	                                        <div class="extras__item">
	                                            <div class="extras__icon extras__icon--v10 fleft"></div>
	                                            <div class="extras__text">���� ������ ���� (�»���Ʈ)</div>
	                                        </div>
	                                        <div class="extras__item">
	                                            <div class="extras__icon extras__icon--v71 fleft"></div>
	                                            <div class="extras__text">��Ʈ�Ͻ� ���� �̿� ����</div>
	                                        </div>
	                                        <div class="extras__item">
	                                            <div class="extras__icon extras__icon--v145 fleft"></div>
	                                            <div class="extras__text">������ �̿� ����</div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="roomItem__guests clear">
	                                <div class="roomItem__guest-name fleft">
	                                    <div class="field-label">
	                                        <label for="GuestSelectionViewModel_PrivateRates_0__GuestName">��������</label>
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
	        <!-----------------------------------------------------------------------------------���� ���� ��-->
	        <div class="section__wrapper special-requirements" id="js-specialrequirements">
	            <h2 style="margin-top: 10px; margin-bottom: 0;">Ư�� ��û����</h2>
	            <div style="margin-bottom: 10px; font-size: 12px; color: gray;">(��, ȣ�ڻ����� ���� ������ �� �ֽ��ϴ�)</div>
	            <fieldset>
	                <div class="field-surround">
	                    <div>
	                        <textarea cols="60"  id="SpecialRequirements" name="SpecialRequirements" rows="10"></textarea>
	                    </div>
	                </div>
	            </fieldset>
	        </div>
	        <div class="button-wrap" style="margin-top: 10px; justify-content: flex-end;display: flex;">
	            <input class="fright positive-button" type="button" value="����" onclick="rvApply()" style="background-color: green; color: white;">
	            <input class="back-nav fleft neutral-button" type="submit" value="���"style="background-color: green; color: white;">
	        </div>
	        <!------------------------------------------------------------------------------>
	    </div>
	    <div class="booking-summary js-booking-summary" style="width: 25%;">
	        <h2 style="background-color: black; color: white; margin: 0; text-align: center;">���� ������</h2>
	        <fieldset>
	            <div class="booking-summary__inner">
	                <div class="booking-summary__details" style="border-bottom: 1px solid gray;">
	                    <div class="cheackIn" style="margin-bottom: 5px;">
	                        <div class="cheackIn_label">üũ��</div>
	                        <div class="InDate"><%= searchDto.getCheckIn() %> </div>
	                    </div>
	                    <div class="cheackOut">
	                        <div class="cheackOut-label">üũ�ƿ�</div>
	                        <div class="outDate"><%= searchDto.getCheckOut() %> </div>
	                    </div>
	                </div>
	
	                <div class="booking-summary__rate-breakdown">
	                    <div class="booking-summary__rate-breakdown-inner">
	                        <div class="js-room-price field-row booking-summary__section--border room-price" style="display: flex;justify-content: space-between; font-size: 15px; ">
	                            <div class="field-row__label fleft">
	                                <div class="booking-summary__promotion-room">&nbsp;</div>
	                                <span>���� 1��</span>
	                            </div>
	                            <div class="field-row__value field-row__value--right price fright">
	                                    <div class="booking-summary__promotion-room">
	                                        <strong><i class="fa fa-trophy"></i> ���θ�� ��</strong>
	                                    </div>
	                                    <div id="RoomPriceInGuestCurrency" class="js-room-price__guest-currency price__guest-currency price__guest-currency--room price__guest-currency--highlight">
	                                    </div>
	                                    <div id="RoomPriceInPropertyCurrency" class="js-room-price__local-currency price__local-currency price__local-currency--highlight" style="color: dodgerblue;">
										<%=roomData.getRoomPrice() %>��
										</div>
	                            </div>
	                        </div>
	
	                        <div class="js-extras-price field-row invisible">
	                            <div class="field-row__label fleft " style="margin-top: 5px;">�߰� ���</div>
	                            <div class="field-row__value field-row__value--right price fright">
	                                <div id="ExtrasPriceInGuestCurrency" class="js-price__guest-currency price__guest-currency price__guest-currency--extras">
	                                </div>
	                                <div id="ExtrasPriceInPropertyCurrency" class="js-price__local-currency price__local-currency price__local-currency--highlight">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="field-row js-tax-price " style="display: flex;justify-content: space-between; border-bottom: 1px solid gray; margin-top: 5px;" >
	                            <div class="field-row__label fleft ">����</div>
	                            <div class="field-row__value field-row__value--right price fright">
	                                <div id="TaxPriceInGuestCurrency_37475" class="price__guest-currency price__guest-currency--extras"></div>
	                                <div id="TaxPriceInPropertyCurrency_37475" class="price__local-currency price__local-currency--highlight" style="color: dodgerblue">
	                                   <%=roomData.getRoomPrice()/10 %>��
	                                </div>
	                            </div>
	                        </div>
	                        <div class="js-booking-summary__inclusions booking-summary__inclusions booking-summary__section--border" >
	                            <div class="label">���� ���� ����</div>
	                            <ul class="inclusions-list" style="color: green; font-size: 12px; border-bottom: 1px solid gray;margin: 0px;margin-top: 5px;">
	                                <li class="included">��������</li>
	                                <li class="included">���� ���� ������ (�� ����Ʈ)</li>
	                                <li class="included">������ �̿� ����</li>
	                                <li class="included">��Ʈ�Ͻ� ���� �̿�</li>
	                            </ul>
	                        </div>
	
	                        <div class="field-row js-booking-summary__amendments booking-summary__amendments booking-summary__section--border  hide">
	                        </div>
	                        <div class="field-row js-total-price total-price booking-summary__section--border field-row " style="display: flex; justify-content: space-between; border-bottom: 1px solid gray;">
	                            <div class="field-row__label field-row__label--large fleft"><strong>�հ�</strong></div>
	                            <div class="field-row__value field-row__value--large field-row__value--right price fright">
	                                <div id="TotalPriceInGuestyCurrency" class="js-price__guest-currency price__guest-currency price__guest-currency--highlight">
	                                </div>
	                                <div id="TotalPriceInPropertyCurrency" class="js-price__local-currency price__local-currency price__local-currency--highlight" style="color: dodgerblue;">
	                                 <%=roomData.getRoomPrice()+roomData.getRoomPrice()/10 %>��
	                                </div>
	                                <div id="js-guests-and-nights" class="guest-and-nights" style="font-size: 12px;color: gray;">1��</div>
	                            </div>
	                        </div>
	                        <div class="booking-summary__payment-on-arrival booking-summary__section--border field-row">
	                            <div class="field-row__label field-row__label--large fleft"><strong>������ �ݾ�</strong></div>
	                            <div class="field-row__value field-row__value--large field-row__value--right price fright">
	                                <div class="price__guest-currency price__guest-currency--highlight"></div>
	                                <div class="price__local-currency price__local-currency--highlight" style="color: dodgerblue;">0��</div>
	                            </div>
	                            <div class="booking-summary__payment-on-arrival-msg clear" style="color: gray;font-size: 12px">ȣ�ڿ��� ������ ����˴ϴ�.</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </fieldset>
	
	        <div class="guarantee cf" style="background-color: greenyellow; color: white; text-align: center;">
	            <button type="button" class="price-btn" style="width: 100%; background-color: green; color: white">
	                <span class="guarantee__text"><i class="fa fa-check"></i><span>������ ����</span></span>
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