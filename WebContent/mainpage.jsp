<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hotel.*,hotel.login.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!--Font awesome-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<!--Google Font-->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<!--JQuery-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
	crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Hotel Main</title>
	<style>
	*, body, html{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			
		}
		#wrap{
			width: 100%;
			height: 100vh;
		}
	header{
			width: 100%;
			height: 80px;
			position: fixed;
			top: 0;
			left: 0;
			z-index: 5;
			background-color: transparent;
		}
		/*�ΰ�*/
		#logo{
			background-size:contain;
			background-repeat: no-repeat;
			margin: 20px auto;
			padding-bottom: 10px;
			width: 270px;
			height: 70px;
		}
		/*��ũ�� ���� �ΰ�*/
		.whiteLogo{
			background-image: url(img/logo_white.png);
		}
		/*��ũ�� ���� �ΰ�*/
		.blackLogo{
			background-image: url(img/logo_black.png);
		}
		/*��ܸ޴�*/
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
			
			border: 1px solid black;
			background-color: transparent;
			
			right: 2%;
			top: 25%;
			
			color: black;
		}
	.topbtnframe{
			width: 80px;
			height: 35px;
			border: 1px solid black;
			background-color: transparent;
		
		}
		.nowLogin{
			position: absolute;
			width: auto;
			height: 35px;
			
			right: 2%;
			top: 25%;
		}
		/*Form*/
		table{
			margin: 20px auto;
		}
		.IntroTxt{
			color: white;
		}
		.IntroTxt>p:nth-child(1){
			text-align: center;
			font-size: 20px;
		}
		.IntroTxt>p:nth-child(2){
			text-align: center;
			font-size: 10px;
		}
		.textbox{
			color:white;
		}
		.imgbox{
			color:white;
		}
		.p4textbox{
			color:white;
		}
		.p4textbox>div{
			color:white;
		}
		
	/*Modal �α���*/
		.modal{
			position: fixed;
			width: 100%;
			height: 100vh;
			top: 0;
			left: 0;
			background-color: rgba(0,0,0,0.3);
			display: none;
			z-index: 1;
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
			z-index: -10;
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
		/*�α׾ƿ�/���������� ��ư*/
		.topbtnframe{
			width: 80px;
			height: 35px;
			border: 1px solid black;
			background-color: transparent;
			
			color: black;
		}
		
			/*Fixed �����̹���*/
		#backimg{
			background-image: url(Source/page2/background_02.png);
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
			width: 100%;
			height: 100vh;
			position: fixed;
			z-index: -5;
		}
		/*��ü ������ ���� class*/
		.pageoption{
			width: 100%;
			height: 100vh;
			overflow: hidden;
		}
		/*===========================================================================*/
		#page1{
			position: relative;
		}
		#page1>video{
			object-fit: cover;
			width: 100%;
			height: 100vh;
			z-index: -100;
		}
		#page1>div{
			width: 100%;
			height: 110px;

			position: absolute;
			left: 0;
			bottom: 0px;
			
			background-color: rgba(0,0,0,0.8);
			font-family: 'Nanum Myeongjo', serif;
			font-weight:lighter;
			
			display: flex;
		}
		/*�ϴܱ���*/
		.adpack{
			display: flex;
			margin: 0 auto;
		}
		.adpack>div{
			width: 400px;
			display: flex;
		}
		.adpack>div>img{
			height:150px;
			position: relative;
			top: -40px;
		}
		.adpack span{
			font-size: 15px;
			color: white;
		}
		#drop{
			position: relative;
			right: 0;
			width: 30px;
			height: 30px;
		}
		#drop div{
			background-color: #333;
			position: absolute;
			padding: 0 5px;
			right: 15px;
		}
		/*�˻� UI*/
		.mainSearch{
			width: 100%;
			position: absolute;
			top: 150px;
		}
		.IntroTxt{
			text-align: center;
			position: relative;
		}
		table{
			margin: 20px auto;
		}
		.IntroTxt>p:nth-child(1){
			font-size: 20px;
		}
		.IntroTxt>p:nth-child(2){
			font-size: 10px;
		}

		/*===========================================================================*/
		#page2{
			position: relative;
			background-color: transparent;
			font-family: 'Nanum Myeongjo', serif;
		}
		.anibox{
			background-color: white;
		}
		.anibox:nth-child(1){
			position: absolute;
			width: 100%;
			height: 1000px;
		}
		.anibox:nth-child(2){
			position: absolute;
			right: 0;
			width: 1000px;
			height: 100vh;
		}
		/*�ڽ��׵θ���� �ִϸ��̼�*/
		.squareAni1{
			position: absolute;
			left: 213px;
			top: 213px;
			
			width: 220px;
			height: 7px;
			background-color: white;
		}
		.squareAni2{
			position: absolute;
			left: 0px;
			top: 220px;
			
			width: 7px;
			height: 252px;
			background-color: white;
		}
		.squareAni3{
			position: absolute;
			left: 0px;
			top: 0px;
		
			height: 7px;
			background-color: white;
		}
		.squareAni4{
			position: absolute;
			left: 213px;
			top: 0px;
			
			width: 7px;
			height: 0px;
			background-color: white;
		}
		/*12, vol���� div*/
		.pointfont{
			position: relative;
			width: 220px;
			height: 220px;
			overflow: hidden;
		}
		.textbox{
			position: absolute;
			left: 20%;
			top: 25%;
			width: 300px;
			z-index: 3;
		}
		/*10*/
		#num10{
			padding: 45px;
			font-size: 120px;
			font-weight: bold;
		}
		#percent{
			display: inline-block;
			position: absolute;
			right: 5px;
			bottom: 35px;
			
			font-size: 40px;
			font-weight: bold;
			transform:rotate(90deg);
		}
		#headTitle{
			white-space: nowrap;
			font-size: 50px;
		}
		#headTitle+div{
			white-space: nowrap;
		}
		/*������*/
		.moretext{
			position: absolute;
			bottom: 25px;
			left: -20px;
			font-weight: bold;
			font-size: 15px;
			z-index: 2;
		}
		.morebox{
			margin-top: 20px;
			width: 70px;
			height: 70px;
			position: relative;
			overflow: hidden;
		}
		.moreAni1{
			position: absolute;
			left: 0px;
			top: 0px;
			
			width: 0px;
			height: 7px;
			background-color: #555;
		}
		.moreAni2{
			position: absolute;
			left: 63px;
			top: 0px;

			width: 7px;
			height: 0px;
			background-color: #555;
		}
		.moreAni3{
			position: absolute;
			left: 70px;
			top: 63px;

			width: 70px;
			height: 7px;
			background-color: #555;
		}
		.moreAni4{
			position: absolute;
			left: 0px;
			top: 70px;

			width: 7px;
			height: 70px;
			background-color: #555;
		}
        /*===========================================================================����*/
        .modal2{
			position: fixed;
			width: 100%;
			height: 100vh;
			top: 0;
			left: 0;
			background-color: rgba(0,0,0,0.3);
			display: none;
			z-index: 1;
		}

        .box{
			
			width: 500px;
            text-align: center;
            font-weight: bolder;
            position: fixed;
            top: 25%;
			left: 50%;
            display: none;
			z-index: 50;
			border: 2px solid white;
        }
        .box_top{
            padding-top: 20px;
            background-color: navy;
            color: white;
            font-size: 30px;
            height: 130px;
        }
        .span{
           font-size:45px;
           color:lightblue;
            
        }
        .box_mid{
            height: 350px;
            background-color: skyblue;
        }
        .box_bottom{
             height: 100px;
             background-color: skyblue;
            color: white;
        }
        .coupon{
            width: 300px;
            height: 200px;
            background-color: white;
            border-radius: 10px;
            border: 4px solid black;
            padding: 10px;
            position: absolute;
            top: 200px;
            left: 100px;
        }
		.coupon_top{
			color: black;
		}
        .coupon_mid{
            font-size: 50px;
			color: black;
        }
        .coupon_bottom{
            font-size: 20px;
            color: gray;
        }
        .modalExit{
			width:20px;
			height:20px;
			position: absolute;
			top: 10px;
			right:40px;
			font-size: 40px;
		}
		/*===========================================================================*/
		#page3{
			font-family: 'Nanum Myeongjo', serif;
			position: relative;
			background-color: rgba(0,0,0,0.5);
		}
		.anibox2{
			background-color: white;
		}
		.anibox2:nth-child(1){
			position: absolute;
			left: 0;
			bottom: 0;
			width: 100%;
			height: 0px;
		}
		.anibox2:nth-child(2){
			position: absolute;
			right: 0;
			width: 0px;
			height: 100vh;
		}
		/*�̹���*/
		.imgbox>div{
			margin-top: 10px;
			position: relative;
			overflow: hidden;
		}
		.imgbox>div>div{
			position: relative;
			top: 400px;
		}
		.imgbox>div div div{
			position: relative;
			top: 100px;
		}
		.imgbox{
			position: absolute;
			top: 20%;
			left: 850px;
			width: 500px;
		}
		/*�̹��� (1)*/
		.imgbox div:nth-child(1) div div:nth-child(1){
			position: absolute;
			left: -15px;
			top: 15px;
			width: 50px;
			height: 20px;
			transform: rotate(90deg);
		}
		.imgbox div:nth-child(1) div div:nth-child(2){
			position: relative;
			left: 20px;
			top: 0px;
			
			width: 250px;
			height: 160px;
			
			background-image: url(Source/page3/123.jpg);
			background-repeat: no-repeat;
			background-size: cover;
		}
		.imgbox div:nth-child(1) div div:nth-child(3){
			font-size: 20px;
			position: absolute;
			left: 280px;
			top: 10px;
			width: 300px;
			height: 20px;
		}
		.imgbox div:nth-child(1) div div:nth-child(4){
			font-size: 15px;
			position: absolute;
			left: 280px;
			top: 45px;
			width: 300px;
			height: 20px;
		}
		/*�̹��� (2)*/
		.imgbox div:nth-child(2) div div{
			margin-left: 100px;
		}
		.imgbox div:nth-child(2) div div:nth-child(1){
			position: absolute;
			left: -15px;
			top: 15px;
			width: 50px;
			height: 20px;
			transform: rotate(90deg);
		}
		.imgbox div:nth-child(2) div div:nth-child(2){
			position: relative;
			left: 20px;
			top: 0px;
			
			width: 150px;
			height: 200px;
			background-image: url(Source/page3/ad02.jpg);
			background-repeat: no-repeat;
			background-size: cover;
		}
		.imgbox div:nth-child(2) div div:nth-child(3){
			font-size: 20px;
			position: absolute;
			left: 180px;
			top: 10px;
			width: 300px;
			height: 20px;
		}
		.imgbox div:nth-child(2) div div:nth-child(4){
			font-size: 15px;
			position: absolute;
			left: 180px;
			top: 45px;
			width: 300px;
			height: 20px;
		}
		/*�̹��� (3)*/
		.imgbox div:nth-child(3) div div:nth-child(1){
			position: absolute;
			left: -15px;
			top: 15px;
			width: 50px;
			height: 20px;
			transform: rotate(90deg);
		}
		.imgbox div:nth-child(3) div div:nth-child(2){
			position: relative;
			left: 20px;
			top: 0px;
			width: 150px;
			height: 200px;
			background-image: url(Source/page3/ad03.jpg);
			background-repeat: no-repeat;
			background-size: cover;
		}
		.imgbox div:nth-child(3) div div:nth-child(3){
			font-size: 20px;
			position: absolute;
			left: 180px;
			top: 10px;
			width: 300px;
			height: 200px;
		}
		.imgbox div:nth-child(3) div div:nth-child(4){
			font-size: 15px;
			position: absolute;
			left: 180px;
			top: 70px;
			width: 300px;
			height: 20px;
		}
		/*===========================================================================*/
		#page4{
			position: relative;
			background-color: white;
		}
		.p4back{
			background-image: url("Source/page4/backpic.jpg");
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			width: 100%;
			height: 650px;
			margin: 0 auto;
			z-index: -1;
		}
		.p4textbox{
			position: absolute;
			left: 25%;
			top: 12%;
			width: 400px;
			color: black;
            font-weight: bolder;
		}
		.p4textbox div:nth-child(1)>div:nth-child(1){
			position: relative;
			top: 0;
			left: 0;
			
			background-image: url(Source/page4/txt_cjnow.png);
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			
			width: 210px;
			height: 150px;
		}
		.p4textbox>div:nth-child(1){
			padding-top: 30px;
			padding-left: 13px;
			position: relative;
			
			width: 230px;
			height: 230px;
			
			overflow: hidden;
		}
		.p4textbox>div:nth-child(2){
			font-family: 'Nanum Myeongjo', serif;
			white-space: nowrap;
			margin-top:50px;
			font-size: 40px;
		}
		.p4textbox>div:nth-child(3){
			position: absolute;
			left: -10px;
			bottom: 25px;
			white-space: nowrap;
			font-family: 'Nanum Myeongjo', serif;
			font-size: 15px;
			z-index: 3;
		}
		/*�ִϸ��̼�*/
		.p4textbox div:nth-child(1)>div:nth-child(2){
			position: absolute;
			left: 0px;
			top: 0px;
			
			width: 0px;
			height: 7px;
			background-color: white;
		}
		.p4textbox div:nth-child(1)>div:nth-child(3){
			position: absolute;
			left: 223px;
			top: 0px;
			
			width: 7px;
			height: 0px;
			background-color: white;
		}
		.p4textbox div:nth-child(1)>div:nth-child(4){
			position: absolute;
			left: 230px;
			top: 223px;
			
			width: 230px;
			height: 7px;
			background-color: white;
		}
		.p4textbox div:nth-child(1)>div:nth-child(5){
			position: absolute;
			left: 0px;
			top: 230px;
			width: 7px;
			height: 230px;
			background-color: white;
		}
		/*������¼����¼��*/
		.p4newsbox{
			position: absolute;
			left: 30%;
			top: 600px;
			width: 700px;
			display: flex;
			justify-content: space-around;
		}
		.p4newsbox div{
			margin: 0 5px;
		}
		.p4newsbox>div:nth-child(1) div:nth-child(2){
			background-image: url(Source/page4/pic1.jpg);
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			width: 200px;
			height: 300px;
		}
		.p4newsbox>div:nth-child(2)>div:nth-child(2){
			position: relative;
			top: 200px;
			background-image: url(Source/page4/pic2.jpg);
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			width: 200px;
			height: 300px;
		}
		.p4newsbox>div:nth-child(3)>div:nth-child(2){
			background-image: url(Source/page4/pic3.jpg);
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			width: 200px;
			height: 300px;
		}
		.p4newsbox>div:nth-child(4)>div:nth-child(2){
			position: relative;
			top: 200px;
			background-image: url(Source/page4/pic4.jpg);
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			width: 200px;
			height: 300px;
		}
		/*===========================================================================*/
		#page5{
			position: relative;
			background-color: #fff;
		}
		#videobg3{
			margin: 50%;
			object-fit: cover;
			width: 10%;
			height: 10vh;
			
		}
		#videobg{
			z-index:-100;
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
         .footer_bottom1{
            padding-left: 40px;
        }
        .footer_bottom2{
            padding-left: 120px;
        }

        
		#newsletter{
			width: 100%;
			height: 200px;
			position: relative;
			left: 0;
			bottom: 0;
			background-color: #333;
		}
		@media(max-width:1024px){

		}
		@media(max-width:768px){
			
		}
		@media(max-width:600px){
			
		}
		
		
		
	</style>
</head>
<body>
<body style="overflow: hidden">
	<div id="wrap">
		<header>
			<div id="logo" class="whiteLogo"></div>
			<%
				HotelDAO dao = new HotelDAO();
				ceologinDTO dto = new ceologinDTO();
				String whatid = (String)session.getAttribute("userid");	
				dto = dao.ceoselect(whatid);
				String whatceo =(String)session.getAttribute("ceoid");	
			%>
		
			 <%
				// ����, ���̵�/��й�ȣ �Է¿� �������� ��쿡 login����� �ѵα� ���� �̸� ���� �޾Ƶд�.
				// �� ���� �ϴܿ��� ���ϴ�
				Object is_loginSuccess= request.getAttribute("wrong");
				
				if(is_loginSuccess != null){%>
					<script>alert("�������� ���� ���̵��̰ų�, �߸��� ��й�ȣ�Դϴ�.");</script>
				<%}if(session.getAttribute("ceoid") != null){%>
				<form action="logoutpage.do" class="nowLogin">
					<%=session.getAttribute("ceoid") %> ����� �ݰ����ϴ�.
					<input type="button" value="���� ���" onclick="roomInsertpage()">
					<input type="button" value="My Page" class="topbtnframe" onclick="goMypage()">
					<input type="submit" value="Logout" class="topbtnframe"><br>
					<input type="hidden" name="thisPage" value="main">
					<%-- <marquee width="200" height="25"><%=session.getAttribute("ceoid")%> ����� �ݰ����ϴ�.</marquee> --%>
				</form>
				<%}else if(session.getAttribute("userid") != null){ %>	
				<form action="logoutpage.do" class="nowLogin">
					<%=session.getAttribute("userid") %> �� �ݰ����ϴ�.
					<input type="button" value="My Page" class="topbtnframe" onclick="goMypage()">
					<input type="submit" value="Logout" class="topbtnframe"><br>
					<input type="hidden" name="thisPage" value="main">
					<%-- <marquee width="200" height="25"><%=session.getAttribute("userid")%> �� �ݰ����ϴ�.</marquee> --%>
				</form>
				<%}else{%>
				<input type="button" value="Login" class="popLogin">
			<%} %> 
		
		</header>
		<div id="backimg"></div>
		<!--=======
		====================================================================================-->
		<!--�˻��� ��� �Ѱ��� ������-->
		<div id="page1" class="pageoption">
		<video id="videobg" preload="auto" autoplay="true" loop="loop" muted volume="0">
				<source src="img/Sea_main_1.mp4" type="video/mp4">
		</video>
		<form action="SearchAction.do" method="post" class="mainSearch" >
			<div class="IntroTxt">
				<p>ȣ��, ����Ʈ, ȣ���� ��</p>
				<p>�� ���� 200���� �̻��� �پ��� ���Ҹ� ����Ʈ ������� �����ϼ���!</p>
			</div>
			
			<table style="z-index:100;">
				<tr>
					<td>��ġ</td>
					<td><input type="text" name="location"></td>
				</tr>
				<tr>
					<td>�Խ���</td>
					<td><input type="text" id="datepicker1" name="checkIn"></td>
				</tr>
				<tr>
					<td>�����</td>
					<td><input type="text" id="datepicker2" name="checkOut"></td>
				</tr>
				<tr>
					<td>�ο�</td>
					<td><input type="text" name="personnel"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="��ȸ�ϱ�" style="width: 100%"></td>
				</tr>
			</table>
		</form>
	
	
		<div class="adbox">
				<div class="adpack">
					<div>
						<img src="Source/page1/ad01.png" alt="">
						<span><br><br>�������� �����ϰ�<br>��ũ�� Ư���� �޾ƺ�����!</span>
					</div>
					<div>
						<img src="Source/page1/ad02.png" alt="">
						<span><br><br>�ڷγ����̷���(COVID-19)<br>���� ����ȳ�����</span>
					</div>
					<div>
						<img src="Source/page1/ad03.png" alt="">
						<span><br><br>������ ����<br>���� ���� ���</span>
					</div>
					<div id="drop">
						<div id="dropup">
							<i class="fas fa-angle-up fa-2x"></i>
						</div>
						<div id="dropdown">
							<i class="fas fa-angle-down fa-2x"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<div id="page2" class="pageoption">
			<div class="anibox"></div>
			<div class="anibox"></div>
			
			<!--�ؽ�Ʈ-->		
			<div class="textbox">
				<div class="pointfont">
					<div class="squareAni1"></div>
					<div class="squareAni2"></div>
					<div class="squareAni3"></div>
					<div class="squareAni4"></div>
					<div id="num10"> 10</div>
					<div id="percent">%</div>
				</div>
				<div id="headTitle"><br>���� ���� ���� ����</div>
				<div>��� ȣ�ڿ��� ��밡���� ǳ���� ���� ����<br>��� ȣ���� ��Ư�� ��������</div>
				
				<div class="moretext">�����ޱ� ��</div>
				<div class="morebox">
					<div class="moreAni1"></div>
					<div class="moreAni2"></div>
					<div class="moreAni3"></div>
					<div class="moreAni4"></div>
				</div>
			</div>
			
			 <div class="box">
            <div class="box_top">
                BIG SALE<br>
                <div class="span">EVENT</div>
                <div class="modalExit">
					<i class="fas fa-times-circle"></i>
				</div>
            </div>
            <div class="box_mid">
                <div class="coupon">
                    <div class="coupon_top">
                        COUPON
                    </div><br>
                    <div class="coupon_mid">
                        10,000
                    </div><br>
                    <div class="coupon_bottom">
                        5���� �̻� ����� ��� ����
                    </div>
                </div> 
            </div>
            <div class="box_bottom">
                &#42;������ ȸ�������� �ߺ� ������� �ʽ��ϴ�. <br><br>
                &#42;��� ���� �� ������ ȸ�����Ը� ����Ǵ� �����Դϴ�.

            </div>

        </div>
        <div class="modal2"></div>


		</div>
		
		<!--===================�������===============================-->
       
		<!--===============================================================================-->
		<div id="page3" class="pageoption">
			<div class="anibox2"></div>
			<div class="anibox2"></div>
			
			<!--�̹���-->
			
			<div class="imgbox">
				<div>
					<div>
						<div>No.01</div>
						<div></div>
						<div>�α� ������ ��õ </div>
						<div> ������ �� </div>
					</div>
				</div>
				<div>
					<div>
						<div>No.02</div>
						<div></div>
						<div>���� �뼼, ������ ����</div>
						<div> ������ �� </div>
					</div>
				</div>
				<div>
					<div>
						<div>No.03</div>
						<div></div>
						<div>���������� �ٻ��ϰ�!<br>�߱���� �ȴ� ���￩��</div>
						<div> ������ �� </div>
					</div>
				</div>
			</div>
		</div>
		
		<!--===============================================================================-->
		<div id="page4" class="pageoption">
			<!--����̹���-->
			<div class="p4back"></div>
			
			<!--����-->
			<div class="p4textbox">
				<div>
					<div></div>
					
					<div class="p4squareani1"></div>
					<div class="p4squareani1"></div>
					<div class="p4squareani1"></div>
					<div class="p4squareani1"></div>
				</div>
				<div>�׸�ȣ��, �������� ������ ����<br>���⿡ ���� ���� ���ߴ�</div>
				
				<div>������ ��</div>
				<div class="morebox">
					<div class="moreAni1"></div>
					<div class="moreAni2"></div>
					<div class="moreAni3"></div>
					<div class="moreAni4"></div>
				</div>
			</div>
			
			<!--������¼��-->
			<div class="p4newsbox">
				<div>
					<div></div>
					<div></div>
					<div></div>
				</div>
				<div>
					<div></div>
					<div></div>
					<div></div>
				</div>
				<div>
					<div></div>
					<div></div>
					<div></div>
				</div>
				<div>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
		
		<!--===============================================================================-->
		<div id="page5" class="pageoption">
			<video id="videobg3" preload="auto" autoplay="true" loop="loop" muted volume="0">
				<source src="Source/page5/travel.mp4" type="video/mp4">
			</video>
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
									<input type="hidden" name="thisPage" value="main">
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

	<script type="text/javascript">
		function signup(){
			location.href = "signup.do";
		}
		function goMypage() {
			location.href = "mypage.do";
		}
		function roomInsertpage(){
			location.href = "roomInsertpage.do";
		}
	</script>
	
	
	<script>
		/* �޷� ���� */
		$.datepicker.setDefaults({
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
		$(function() {
			
			$("#datepicker1").datepicker();
			$("#datepicker2").datepicker();
		});
		
		
		$(function(){
			/* �α��� �˾�â */
			$(".popLogin").click(function(){
				$(".modal").fadeIn(300, function(){
					$("#modalLogin").animate({opacity: "1"},300);
					$("#modalLogin").css('z-index','2');
					$("#modalLogin").draggable();
				});
			});
			$(".modalLoginExit").click(function(){
				$("#modalLogin").css('z-index','-10');
				$("#modalLogin").animate({opacity: "0"},300);
				$(".modal").fadeOut(500);
			});
		});
	</script>
	
			<!--===============================================================================-->
	<!--                                    ��ũ��Ʈ                                    -->
	<!--===============================================================================-->
	
	
	
	
	
	
	
	
	<script>
		$(document).ready(function(){
			
			var elm = ".pageoption";
			var cnt = $(elm).length;
			var nowPage = 2;
			var delta = 0;
			
			//������¡�� ��, ���� �������� 1�̸� �߾��������ش�.
			$( window ).resize( function() {
				if((nowPage ==2 && delta>0) || (nowPage ==1 && delta<0) || (nowPage == 3 && delta<0)){
					$("#logo").css("margin", "0 auto");
				}
				else{
					//alert(delta + " : " +nowPage);
				}
			} );
			
			//���콺 �� �Ǵ� ��ũ�� ������ �߻��ϴ� ���� �Լ��� �����Ѵ�
			$(elm).on("mousewheel DOMMouseScroll", function(e){
				//���� �������� �̺�Ʈ ���� �ٸ� ������ ���� �ʵ��� ���� �޼ҵ�
				e.preventDefault();
				var E = e.originalEvent;
				if(E.detail){
					delta=E.detail*-40;
				}
				else{
					delta=E.wheelDelta;
					if(window.opera){
						delta = -delta;	
					}
				}
				
				//���콺�� ������ ���
				if(delta<0){
					if($(this).index() != cnt+2){
						var next = $(this).next().offset().top;
						$("html, body").stop().animate({
							scrollTop: next
						},800);
					}
					//�̹� ��ũ���� ������ ���Ķ�(index) -1�� ������ �ִϸ��̼� ����
					if($(this).index() == 2){
						//1>2������
						//������ ��ȯȿ��
						$(".anibox:nth-child(1)").stop().animate({
							height: "0"
						},1000);
						$(".anibox:nth-child(2)").stop().animate({
							width: "0"
						},1000);
						//�޴��� ���󺯰�
						$("#logo").addClass("blackLogo");
						$("header").stop().animate({
							backgroundColor: "rgba(255,255,255,0.8)",
							height: "70px"
						},500);
						$("#logo").stop().animate({
							paddingBottom: "0px",
							margin: "5px 20px",
							width: "270px",
							height: "50px"
						},800, function(){
							//�ݹ����� �׵θ��ִϸ��̼� square1~4 + �����⿡�� �׵θ� �ִϸ��̼� more1~4
							$("#page2 .moreAni1").stop().animate({
								width: "70px"
							},200);
							$("#page2 .squareAni1").stop().animate({
								left:"0px"
							},200,function(){
								$("#page2 .moreAni2").stop().animate({
									height: "70px"
								},200);
								$("#page2 .squareAni2").stop().animate({
									top:"0px"
								},200, function(){
									$("#page2 .moreAni3").stop().animate({
										left: "0px"
									},200);
									$("#page2 .squareAni3").stop().animate({
											width: "252px"
										},200, function(){
											$("#page2 .moreAni4").stop().animate({
												top: "0px"
											},200);
											$("#page2 .squareAni4").stop().animate({
												height: "120px"
											},200);
										});
									});
								});
							});
					}
					else if($(this).index() == 3){
						//2>3������
						//12�� ��¼�� �ѽ� 3������������ �߰�
						$(".textbox").css("position", "fixed");
						
						//3p���� �̹��� ���� ���ٴ� ���� �����
						$(".imgbox>div>div").animate({
							top: "200px"
						},300, function(){
							$(".imgbox>div:nth-child(1)>div").stop().animate({
								top: "0px"
							},300);
							$(".imgbox>div:nth-child(2)>div").stop().animate({
								top: "0px"
							},500);
							$(".imgbox>div:nth-child(3)>div").stop().animate({
								top: "0px"
							},600);
						});
						
					}
					else if($(this).index() == 4){
						//3>4������
						
						//3p���� �̹��� ���� ���ٴ� �ø��� �����
						$(".imgbox>div>div").animate({
							top: "0px"
						},100, function(){
							$(".imgbox>div:nth-child(1)>div").stop().animate({
								top: "-200px"
							},300);
							$(".imgbox>div:nth-child(2)>div").stop().animate({
								top: "-200px"
							},500);
							$(".imgbox>div:nth-child(3)>div").stop().animate({
								top: "-200px"
							},600);
						});
						
						//����ڽ� �ִϸ��̼� ö��
						$(".anibox2:nth-child(1)").stop().animate({
							height: "1000px"
						},1000);
						$(".anibox2:nth-child(2)").stop().animate({
							width: "1000px"
						},1000, function(){
							//�׸��׵θ� �ִϸ��̼� �ʱ�ȭ
							$("#page2 .squareAni1").css("left","213px");
							$(".squareAni2").css("top","220px");
							$(".squareAni3").css("width","0px");
							$(".squareAni4").css("height","0px");
							
							$("#page2 .moreAni1").css("width","0px");
							$("#page2 .moreAni2").css("height","0px");
							$("#page2 .moreAni3").css("left","70px");
							$("#page2 .moreAni4").css("top","70px");
						});
						
						//�׵θ� �ִϸ��̼� ���ۺ��� ���°� 
						$(".p4textbox div:nth-child(1)>div:nth-child(2)").stop().animate({
							width:"227px"
						},300, function(){
							$(".p4textbox div:nth-child(1)>div:nth-child(3)").stop().animate({
								height:"227px"
							},300, function(){
								$(".p4textbox div:nth-child(1)>div:nth-child(4)").stop().animate({
									left:"0px"
								},300, function(){
									$(".p4textbox div:nth-child(1)>div:nth-child(5)").stop().animate({
										top:"0px"
									},300,function(){
										$(".p4textbox div:nth-child(1)>div:nth-child(2)").stop().animate({
											left: "230px"
										},300,function(){
											$(".p4textbox div:nth-child(1)>div:nth-child(3)").stop().animate({
												top: "230px"
											},300,function(){
												$(".p4textbox div:nth-child(1)>div:nth-child(4)").stop().animate({
													width:"0px"
												},300, function(){
													$(".p4textbox div:nth-child(1)>div:nth-child(5)").stop().animate({
														height:"0px"
													},300);
												});
											});
										});
									});
								});
							});
						});

						//������ �׵θ� �ִϸ��̼� more1~4
						$("#page4 .moreAni1").stop().animate({
							width: "70px"
						},400,function(){
							$("#page4 .moreAni2").stop().animate({
								height: "70px"
							},400, function(){
								$("#page4 .moreAni3").stop().animate({
									left: "0px"
								},400, function(){
									$("#page4 .moreAni4").stop().animate({
										top: "0px"
									},400);
								});
							});
						});

						//news �ضߴ°�
						$(".p4newsbox>div:nth-child(2)>div:nth-child(2)").stop().animate({
							top: "0px"
						},1000);
						$(".p4newsbox>div:nth-child(4)>div:nth-child(2)").stop().animate({
							top: "0px"
						},1000);
	
						//12�� ��¼�� ����
						$(".textbox").fadeOut();						
					}
					else if($(this).index() == 5){
						//4>5������
						$("#page5").stop().animate({
							backgroundColor: "#5b949a"
						},1000);
						
						//�������°� �ʱ�ȭ
						$(".p4textbox div:nth-child(1)>div:nth-child(2)").css("left","0");
						$(".p4textbox div:nth-child(1)>div:nth-child(2)").css("width","0");
						$(".p4textbox div:nth-child(1)>div:nth-child(3)").css("height","0");
						$(".p4textbox div:nth-child(1)>div:nth-child(3)").css("top","0");
						$(".p4textbox div:nth-child(1)>div:nth-child(4)").css("left","230px");
						$(".p4textbox div:nth-child(1)>div:nth-child(4)").css("width","230px");
						$(".p4textbox div:nth-child(1)>div:nth-child(5)").css("top","230px");
						$(".p4textbox div:nth-child(1)>div:nth-child(5)").css("height","230px");
						//������׸� �ʱ�ȭ
						$("#page4 .moreAni1").css("width","0px");
						$("#page4 .moreAni2").css("height","0px");
						$("#page4 .moreAni3").css("left","70px");
						$("#page4 .moreAni4").css("top","70px");
						
						//news �ضߴ°� �÷���
						$(".p4newsbox>div:nth-child(2)>div:nth-child(2)").stop().animate({
							top: "-200px"
						},1000);
						$(".p4newsbox>div:nth-child(4)>div:nth-child(2)").stop().animate({
							top: "-200px"
						},1000);
						
						$("#videobg3").stop().animate({
							width: "100%",
							height: "100vh",
							margin: "0"
						},1000);
					}
				}
				//====================================================================================
				//���콺�� �÷��� ���
				//====================================================================================
				else{
					
					//���콺�� �ø���, �߾ӿ� ���ߵ��� �ϱ� ���� ��������
					var elWidth = $(window).width() / 2;
					elWidth -= 150;
					
					if($(this).index() != 1){
						var prev = $(this).prev().offset().top;
						$("html, body").stop().animate({
							scrollTop: prev
						},800);
					}
					if($(this).index()==3){
						//2>1������
						$(".anibox:nth-child(1)").stop().animate({
							height: "1000px"
						},1000);
						$(".anibox:nth-child(2)").stop().animate({
							width: "1000px"
						},1000);
						//�޴��� ���󺯰�
						$("header").stop().animate({
							backgroundColor: "transparent",
						},500);
						$("#logo").stop().animate({
							paddingBottom: "10px",
							marginLeft: elWidth+"px" ,
							width: "270px",
							height: "70px"
						},1000, function(){
							//�׸��׵θ� �ִϸ��̼� �ʱ�ȭ
							$("#page2 .squareAni1").css("left","213px");
							$("#page2 .squareAni2").css("top","220px");
							$("#page2 .squareAni3").css("width","0px");
							$("#page2 .squareAni4").css("height","0px");
							
							$("#page2 .moreAni1").css("width","0px");
							$("#page2 .moreAni2").css("height","0px");
							$("#page2 .moreAni3").css("left","70px");
							$("#page2 .moreAni4").css("top","70px");
						});
						$("#logo").removeClass("blackLogo");
						
						
						
						//12�� ��¼�� 1������������ �ȶ߰�
						$(".textbox").css("position", "absolute");
						//�ִϸ��̼��� ���� �����ϰ�.. �ΰ� margin�� auto�� �������
						$("#logo").css("margin", "auto");
					}
					else if($(this).index()==4){
						//3>2������
						//3p���� �̹��� ���� ���ٴ� �ø��� �����
						$(".imgbox>div>div").animate({
							top: "0px"
						},300, function(){
							$(".imgbox>div:nth-child(1)>div").stop().animate({
								top: "200px"
							},300);
							$(".imgbox>div:nth-child(2)>div").stop().animate({
								top: "200px"
							},500);
							$(".imgbox>div:nth-child(3)>div").stop().animate({
								top: "200px"
							},600);
						});
						
					}
					
					else if($(this).index()==5){
						//4>3������
						$(".textbox").fadeIn(1000);
						
						//3p���� �̹��� ���� ���ٴ� ���� �����
						$(".imgbox>div>div").animate({
							top: "-200px"
						},200, function(){
							$(".imgbox>div:nth-child(1)>div").stop().animate({
								top: "0px"
							},300);
							$(".imgbox>div:nth-child(2)>div").stop().animate({
								top: "0px"
							},500);
							$(".imgbox>div:nth-child(3)>div").stop().animate({
								top: "0px"
							},600);
						});
						
						//�׸��׵θ� �ִϸ��̼�
						$(".anibox2:nth-child(1)").stop().animate({
							height: "0"
						},1000);
						$(".anibox2:nth-child(2)").stop().animate({
							width: "0"
						},1000,function(){
							$("#page2 .moreAni1").stop().animate({
								width: "70px"
							},200);
							$("#page2 .squareAni1").stop().animate({
								left:"0px"
							},200,function(){
								$("#page2 .moreAni2").stop().animate({
									height: "70px"
								},200);
								$("#page2 .squareAni2").stop().animate({
									top:"0px"
								},200, function(){
									$("#page2 .moreAni3").stop().animate({
										left: "0px"
									},200);
									$("#page2 .squareAni3").stop().animate({
											width: "252px"
										},200, function(){
										$("#page2 .moreAni4").stop().animate({
												top: "0px"
											},200);
										$("#page2 .squareAni4").stop().animate({
											height: "120px"
										},200);
									});
								});
							});
						});
						
						//�������°� �ʱ�ȭ
						$(".p4textbox div:nth-child(1)>div:nth-child(2)").css("left","0");
						$(".p4textbox div:nth-child(1)>div:nth-child(2)").css("width","0");
						$(".p4textbox div:nth-child(1)>div:nth-child(3)").css("height","0");
						$(".p4textbox div:nth-child(1)>div:nth-child(3)").css("top","0");
						$(".p4textbox div:nth-child(1)>div:nth-child(4)").css("left","230px");
						$(".p4textbox div:nth-child(1)>div:nth-child(4)").css("width","230px");
						$(".p4textbox div:nth-child(1)>div:nth-child(5)").css("top","230px");
						$(".p4textbox div:nth-child(1)>div:nth-child(5)").css("height","230px");
						//������׸� �ʱ�ȭ
						$("#page4 .moreAni1").css("width","0px");
						$("#page4 .moreAni2").css("height","0px");
						$("#page4 .moreAni3").css("left","70px");
						$("#page4 .moreAni4").css("top","70px");
						
						//news �ضߴ°� �������
						$(".p4newsbox>div:nth-child(2)>div:nth-child(2)").stop().animate({
							top: "200px"
						},1000);
						$(".p4newsbox>div:nth-child(4)>div:nth-child(2)").stop().animate({
							top: "200px"
						},1000);
					}
					else if($(this).index()==6){
						//5>4������
						$("#page5").stop().animate({
							backgroundColor: "#fff"
						},1000);
						
						//������ �׵θ� �ִϸ��̼� more1~4
						$("#page4 .moreAni1").stop().animate({
							width: "70px"
						},400,function(){
							$("#page4 .moreAni2").stop().animate({
								height: "70px"
							},400, function(){
								$("#page4 .moreAni3").stop().animate({
									left: "0px"
								},400, function(){
									$("#page4 .moreAni4").stop().animate({
										top: "0px"
									},400);
								});
							});
						});
						
						//�׵θ� �ִϸ��̼� ���ۺ��� ���°� 
						$(".p4textbox div:nth-child(1)>div:nth-child(2)").stop().animate({
							width:"227px"
						},300, function(){
							$(".p4textbox div:nth-child(1)>div:nth-child(3)").stop().animate({
								height:"227px"
							},300, function(){
								$(".p4textbox div:nth-child(1)>div:nth-child(4)").stop().animate({
									left:"0px"
								},300, function(){
									$(".p4textbox div:nth-child(1)>div:nth-child(5)").stop().animate({
										top:"0px"
									},300,function(){
										$(".p4textbox div:nth-child(1)>div:nth-child(2)").stop().animate({
											left: "230px"
										},300,function(){
											$(".p4textbox div:nth-child(1)>div:nth-child(3)").stop().animate({
												top: "230px"
											},300,function(){
												$(".p4textbox div:nth-child(1)>div:nth-child(4)").stop().animate({
													width:"0px"
												},300, function(){
													$(".p4textbox div:nth-child(1)>div:nth-child(5)").stop().animate({
														height:"0px"
													},300);
												});
											});
										});
									});
								});
							});
						});
						//news �ضߴ°�
						$(".p4newsbox>div:nth-child(2)>div:nth-child(2)").stop().animate({
							top: "0px"
						},1000);
						$(".p4newsbox>div:nth-child(4)>div:nth-child(2)").stop().animate({
							top: "0px"
						},1000);
						
						$("#videobg3").stop().animate({
							width: "10%",
							height: "10vh",
							margin: "50%"
						},1000);
					}
				}
			});
			
		});
	</script>
	<script>
        $(function(){
			/* �α��� �˾�â */
			$(".moretext").click(function(){
                
				$(".modal2").fadeIn(300, function(){
					$(".box").fadeIn(500);
					
					$(".box").draggable();
				});
			});
			$(".modalExit").click(function(){
				$(".box").fadeOut(300, function(){
					$(".modal2").fadeOut(500);
				});
			});
		});
    </script>
	
	
</body>
</html>