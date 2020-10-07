<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hotel.*,hotel.login.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<!--JQuery-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin : 0;
		padding : 0;

	}
	.main{
		width: 100%;
		height: 100%;
		
	}
	.wrap{
		width: 100%;
		height: 100%;
	}
	body:before{
	content:'';
	height:100%;
	display:inline-block;
	vertical-align:middle;
	}
	button{
		width: 200px;
		height: 100px;
		background:rgba(0,200,200,0.5);
		color:#fff;
		border:none;
		position:relative;
		font-size:1.6em;
		cursor:pointer;
		transition:800ms ease all;
		outline:none;
		border-radius: 1;
	}
	button:hover{
	  background:#fff;
	  color:#1AAB8A;
	  opacity: 0.8;
	}
	button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #1AAB8A;
	  transition:400ms ease all;
	}
	button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	video {
		position : fixed;
		top : 0; 
		left : 0;
		min-width : 100%;
		min-height : 100%;
		width : 100%;
		height : 100vh;
		z-index : -1;
		object-fit:cover;
		opacity: 0.9;
	}

	.btnalign{
		margin:  0 auto;
		padding:  0 auto;
		width: 1000px;
		position: relative;
		display: flex;
		justify-content: space-around;
		top:330px;
	}
	.toppage{
		width: 100%;
		height: 280px;
	}
    footer{
    	position:relative;
    	top:550px;
        background-color: black;
        color: gainsboro;
        height: 200px;
        width: 100%;
        font-size: 13px;
        background: linear-gradient(
            to bottom,
            rgba(0, 0, 0, 0.80) 20%,
            rgba(0, 0, 0, 0.85) 60%,
            rgba(0, 0, 0, 0.9) 80%
          );
      
    }
    .footer{
        height: 200px;
        width: 1150px;
        margin: 0 auto;
    }
    .footer_up{
        display: flex;
        padding: 10px;
    }
    .footer_bottom{
        display: flex;
    }
    .footer_right{
        padding-left: 485px;
    }
    .left_mid{
        padding-top: 10px;
        padding-left: 10px;
    }
    .button{
        background-color: rgba(21,107,193,1);
        color: white;
        border: none;
        font-size: 13px;
        width: 40px;
        border-radius: 5px;
        box-shadow: 2px 2px black;
    }
    .footer_bottom1{
        padding-left: 10px;
    }
    .footer_bottom2{
        padding-left: 355px;
    }
    .botton:hover{
        background-color: cornflowerblue;
    }
    td{
        padding: 5px;
    }
    .toppage{
    	background-color: black;
    	height: 100px;
    }
	.toppage img{
    	margin-top : 20px;
		width: 230px;
		height: 40px;
		padding: 5px;
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
		/*로고*/
		#logo{
			background-size:contain;
			background-repeat: no-repeat;
			margin: 20px auto;
			padding-bottom: 10px;
			width: 270px;
			height: 70px;
		}
		/*스크롤 이전 로고*/
		.whiteLogo{
			background-image: url(img/logo_white.png);
		}
		/*스크롤 이후 로고*/
		.blackLogo{
			background-image: url(img/logo_black.png);
		}
		/*상단메뉴*/
		.nowLogin{
			position: absolute;
			width: auto;
			height: 35px;
			color : white;
			right: 2%;
			top: 25%;
		}
		/*로그인버튼*/
		.popLogin{
			position: absolute;
			width: 80px;
			height: 35px;
			color: white;
			border: 1px solid black;
			background-color: transparent;
			
			right: 2%;
			top: 25%;
			
			color: black;
		}
	.topbtnframe{
			width: 80px;
			height: 35px;
			border: 1px solid white;
			background-color: transparent;
			color: white;
		
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
		
	/*Modal 로그인*/
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
		/*로그아웃/마이페이지 버튼*/
		.topbtnframe{
			width: 80px;
			height: 35px;
			border: 1px solid white;
			background-color: transparent;
			color: white;
		}
		
</style>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
<input type="hidden" id=sessionid value="<%=session.getAttribute("userid")%>">

<div class=wrap>
	<div class=toppage><!-- <a href="mainpage.jsp"><img src="img/logo_white.png"></a> --></div>
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
				// 직전, 아이디/비밀번호 입력에 실패했을 경우에 login모달을 켜두기 위해 미리 값을 받아둔다.
				// 이 값은 하단에서 씁니다
				Object is_loginSuccess= request.getAttribute("wrong");
				
				if(is_loginSuccess != null){%>
					<script>alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");</script>
				<%}if(session.getAttribute("ceoid") != null){%>
				<form action="logoutpage.do" class="nowLogin">
					<%=session.getAttribute("ceoid") %> 사장님 반갑습니다.
					<input type="button" value="숙소 등록" onclick="roomInsertpage()">
					<input type="submit" value="Logout" class="topbtnframe"><br>
					<input type="hidden" name="thisPage" value="main">
					<%-- <marquee width="200" height="25"><%=session.getAttribute("ceoid")%> 사장님 반갑습니다.</marquee> --%>
				</form>
				<%}else if(session.getAttribute("userid") != null){ %>	
				<form action="logoutpage.do" class="nowLogin">
					<%=session.getAttribute("userid") %> 님 반갑습니다.
					<input type="submit" value="Logout" class="topbtnframe"><br>
					<input type="hidden" name="thisPage" value="main">
					<%-- <marquee width="200" height="25"><%=session.getAttribute("userid")%> 님 반갑습니다.</marquee> --%>
				</form>
				<%}else{%>
				<input type="button" value="Login" class="popLogin">
			<%} %> 
		
		</header>
	<div class=main> 
		
		<video id="video" preload="none" autoplay="true" loop="loop" muted="muted" volume="0">
	      <source src="hotelvideo/mypagevideo.mp4"  type="video/mp4"  >
		</video>
		
		<div class=btnalign>
			<button onclick="btn1()">예약 및 <br>이용후기</button>
			<button onclick="btn2()">문의 및<br> 조회</button>
			<button onclick="btn3()">회원정보 <br> 변경</button>
			<button onclick="btn4()">추천 정보<br></button>
		</div>
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
	<script type="text/javascript">

		function btn1(){
			var url = "historypage.do?id?id=<%=session.getAttribute("userid") %>";
			var sessionid = document.getElementById('sessionid').value;
			location.href ="historypage.do?id?id="+sessionid;
		}
		function btn2(){
			location.href ="QnApage.do";
		}
		function btn3(idval){
			
			var sessionid = document.getElementById('sessionid').value;
			location.href ="loginupdate.do?loginval="+sessionid;
		}
		function btn4(id){
			var sessionid = document.getElementById('sessionid').value;
			location.href ="Invitefriends.do?Id="+sessionid;
			document.form.submit();
		}
	</script>
	
		<script>
$(function(){
  $('.topbtnframe').click(function(){
    location.href = "mainpage.jsp";
  });
  $('.whiteLogo').click(function(){
	    location.href = "mainpage.jsp";
	  });
});
	</script>
	
	
</body>
</html>