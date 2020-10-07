<%@page import="hotel.HotelDAO, java.util.*, hotel.login.logincodeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">  <!--아이콘넣기-->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script> <!--jquery 이용-->
	<style>
		.section{
			position: relative;
		}
		#background{
			height: 620px;
			position: relative;
			overflow: hidden;
		}
		#background>div{
			height: 620px;
			position: absolute;
			display: flex;
			opacity: 0.9;
		}
		article{
			border: 1px solid white;
			border-radius: 20px;
			box-shadow: 5px 5px 5px 5px rgba(0,0,0,0.1);
			height: 580px;/*980*/
			width: 1100px;
			background-color: white;
			display: flex;
			position: absolute;
			top: 100px;
			left: 450px;
			overflow: hidden;
		}
		.text{
			border-style: none;
			border-bottom: 1px solid black;
			
		}
		.article1{
			display: flex;			
		}
		
		.article_left{
			background-image: url(hotelimg/join.png);
			height: 955px;
			width: 415px;
			margin-left: 10px;
			margin-top: 10px;
		}
		
		.article_left1{
			color: white;
			font-size: 25px;
			padding-left: 100px;
			padding-top: 30px;
			font-weight: bolder;
		}
		
		.article_right{
			margin-top: 30px;
			margin-left: 20px;
		}
		
		.article_right>div{
			padding-bottom: 10px;
		}
		
		.article_right1{
			font-size:25px;
		}
		
		.article_right3{
			display: flex;
			font-size: 16px;
			border-bottom: 1px solid rgba(0,0,0,0.4);
		}
		
		.article_right3_right{
			color: mediumvioletred;
			font-size: 16px;
			padding-left: 100px;
			
		}
		
		.article_right4{
			font-size: 16px;
			border-bottom: 1px solid rgba(0,0,0,0.4);
		}
		
		.article_right5{
			font-size: 16px;
			border-bottom: 1px solid rgba(0,0,0,0.4);
			display: none;
		}
		
		.article_right5_down{
			padding-top: 10px;
		}
		
		.article_right6{
			padding-top: 10px;
			padding-left: 50px;
		}
		
		.article_right7{
			padding-top: 20px;
			border-top: 1px solid rgba(0,0,0,0.4);
			color: rgba(0,0,0,0.6); 
			font-size: 20px;
			text-align: center;
		}
	</style>
</head>
<body>
	<header></header>
	<section>
	<%
		HotelDAO dao = new HotelDAO();
		Vector<logincodeDTO> dbcode = dao.selectcode();

		StringBuffer sbuff = new StringBuffer();
		for(int i=0; i<dbcode.size(); i++){
			sbuff.append(dbcode.get(i).getCode());
			if(i<dbcode.size()){
				sbuff.append(",");
			}
		} 

	%>
	<input type="hidden" id="hiddencode"value="<%=sbuff%>">
	<form action="SignupAction.do" name=sinupac>
	<div class="section">
	
		<div id="background">
			<div><img src="hotelimg/b1.jpg"></div>
            <div><img src="hotelimg/b5.jpg"></div>
            <div><img src="hotelimg/b3.jpg"></div>
            <div><img src="hotelimg/b4.jpg"></div>
		</div>
		
		
		<article>

		<div class="article1">
		
			<div class="article_left">
				<div class="article_left1">
					대한민국, <br>
					부산 호텔을 한눈에
				</div>
			</div>
			
			<div class="article_right" >
				<div class="article_right1">
					회원가입
				</div>
				<div class="article_right2">
					약관동의
				</div>
				<div class="article_right3">
					<div class="article_right3_left">
						<input type="checkbox" id="service" class="agree" style="cursor: pointer;"> 서비스 이용약관 동의(필수) <br>
						<input type="checkbox" id="personal" class="agree" style="cursor: pointer"> 개인정보 처리 방침 동의(필수) <br>

					</div>
					<div class="article_right3_right" style="cursor: pointer;">
						약관 자세히 보기 > <br>
						약관 자세히 보기 > <br>

					</div>
				</div>
				
				
				<div class="article_right5" style="width: 620px">
					<div class="article_right5_up">
						<input type="text" class="text" name="id" placeholder="아이디" style="padding: .8em; .5em; width: 280px;" >
						<input type="text" class="text" placeholder="이름" name="name" style="padding: .8em; .5em; width: 280px;"> <br>
						<div class=idteb style="font-size: 10px; color: red;" style="padding: .8em; .5em;"></div>
						<input type="password" class="text" placeholder="패스워드 입력"  id="pw" name="pw"style="padding: .8em; .5em;width: 280px;"> 
						<input type="password" class="text" placeholder="패스워드 확인" id="pw2"style="padding: .8em; .5em; width: 280px;"> <br>
						<div class=pwteb style="display: none; color: red; display: none">패스워드가 일치 하지 않습니다.</div>
						<input type="text" class="text" placeholder="연락처(숫자만입력)"  name="phone"style="padding: .8em; .5em; width: 280px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						<input type="text" class="text" placeholder="이메일"  name="email" style="padding: .8em; .5em; width: 280px;">
				<%
					boolean yesno= true;
					boolean ischeck = false; //중복체크
					String code = "azsxdc";
					
					while(yesno){
						String codeid =""; 
						for( int J= 0; J<8; J++){
							codeid+=(char)((Math.random()*26)+65);	
						}
						if(dbcode.size()==0){
							ischeck = true;
						}else{
							for(int i=0; i<dbcode.size(); i++){
								if(code.equals(dbcode.get(i).getCode())){
									/* out.println("중복 1회"); */
									code = codeid;
									break;
								}else{
									ischeck = true;
								}
							}
						}
						if(ischeck){
						/* 	out.println("정상생성"); */
							yesno= false;%>
							<input type="hidden" name="codes" value="<%=codeid%>">
						<%}
					}
				%>
					<input type="text" class="text" name="invite" style="padding: .8em; .5em; width: 280px;" placeholder="추천인" id=invitedate>
					<div class=inviteteb style="font-size: 10px; color: red;" style="padding: .8em; .5em;"></div>					
					</div>
					<div class="article_right5_down" style="width: 620px;">
						<input type="checkbox" id="enterprise"> 기업 회원 <br>
						<div class="enterprisevar"><input type="text" class="text" placeholder="사업자 번호" id="enterprisetext"name="enterprisetext"style="padding: .8em; .5em; width: 280px; display: none"></div>
						<input type="checkbox"> 마케팅 이메일 수신에 동의(인기상품, 마감특가 등) <br>
					</div>
					<div class="enterprisevar" style="display: none">
						
					</div>
				</div>
				
				<div class="article_right6">
					<input type="button" onclick="signup()" value="스트레스 없는 여행! 이제 에바종으로 시작!" style="background-color: rgb(225,18,130); color: white; font-size:18px; width: 550px; height: 50px; border-radius: 10px;">
				</div>
				<div class="article_right7">
					<i class="fas fa-exclamation-circle"></i>
					서비스 이용을 위해 약관 내용을 동의 해주세요!
				</div>				
	
			</div>
			
		</div>
		</article>
	</div>
	</form>
	</section>
	<footer></footer>
	
	<script>
	$(function(){
        setInterval(function(){ /*이미지 번갈아가면서 등장*/
         $("#background div:nth-child(4)").stop().fadeOut(2000,function(){
         var x=$("#background div:nth-child(4)").detach();
         $("#background").prepend(x);
         $("#background div:nth-child(1)").css({display:"block"});
         });
         },2200);
		
		$("#service").click(function(){ /*서비스 버튼 클릭시 작동*/
			var check1 =$("#service").is(":checked");
			var check2 =$("#personal").is(":checked");
			if(check1 == true && check2==true){
				$("article").animate({
					height:"980px"
				},300);
				
				$(".article_right5").css("display","block");
				$(".article_right7").css("display","none");
			}else{
				$("article").animate({
					height:"580px"
				},300);
				
				$(".article_right5").css("display","none");
				$(".article_right7").css("display","block");
			}
		});
		
		$("#personal").click(function(){ /*personal버튼 클릭시 두 버튼 중 1개만 클릭하면 동작 안함 2개다 클릭해야 동작*/
			var check1 =$("#service").is(":checked");
			var check2 =$("#personal").is(":checked");
			
			if(check1 == true && check2==true){
				$("article").animate({
					height:"980px"					
				},300);
				$(".article_right5").css("display","block");
				$(".article_right7").css("display","none");
			}else{
				$("article").animate({
					height:"580px"
				},300);
				$(".article_right5").css("display","none");
				$(".article_right7").css("display","block");
			}
		});
		
	});
	
		$("#enterprise").click(function(){
			var check1 =$("#enterprise").is(":checked");
			if(check1 == true){
				$(".enterprisevar").css("display","block");
				$("#enterprisetext").css("display","block");
			}else{	
				$(".enterprisevar").css("display","none");
				$("#enterprisetext").css("display","none");
			}		
	});
	 $(function(){
		$("input[name=id]").keyup(function(){			
			$.ajax({
			    url: "check.jsp", //요청 url 주소
			    type: "get", // 데이터 전송 방식 get , post			   
			    dataType: "json", // 데이터 타입 xml, json, html, ...
			    data: $('form').serialize(), // 서버로 데이터 전송시 사용			    
			    success: function(data){ // 통신이 성공적으로 성공했을 때			    	
			    	$(".idteb").text(data.result);
			    },
			    complete : function(data) {	 // 통신의 성공여부를 떠나서 끝났을 때   	
			    },
			    error: function (request, status, error){ // 에러 발생시			    	 
				     $(".idteb").text("통신실패");
			    }
			  });
		});
	}); 
	 $(function(){
			$("#pw2").keyup(function(){			
				var pw= document.getElementById('pw').value;
				var pw2= document.getElementById('pw2').value;
				if(pw2!=pw){
					$(".pwteb").css("display","block");
				}else if(pw2==pw){
					$(".pwteb").css("display","none");
				}
			});
			$("#pw").keyup(function(){			
				var pw= document.getElementById('pw').value;
				var pw2= document.getElementById('pw2').value;
				if(pw2!=pw){
					$(".pwteb").css("display","block");
				}else if(pw2==pw){
					$(".pwteb").css("display","none");
				}
			});
		});
	$(function(){
		$("input[name=invite]").keyup(function(){			
			$.ajax({
			    url: "check2.jsp", 
			    type: "post", 
			    dataType: "json",  
			    data: $('form').serialize(),
			    success: function(data){  	
			    	$(".inviteteb").text(data.result2);
			    },
			    complete : function(data) {	
			    },
			    error: function (request, status, error){    	 
				     $(".inviteteb").text("통신실패");
			    }
			  });
		});
	});
	function signup(){

		/* var xx=  document.getElementById('ddd').value;
		alert(xx); */
		
		var dbcodeid = document.getElementById('hiddencode').value;
		var invite = document.getElementById('invitedate').value;
		var spcodeid = dbcodeid.split(',');
		var ischeck = false;
		var check1 =$("#enterprise").is(":checked");
							
		if($("[name='id']").val()==""){
			alert("아이디를 입력해주십시오.");
			$("input[name='id']").focus();
			return false;
		}
		if($("[name='name']").val()==""){
			alert("이름을 입력해 주시오");
			$("input[name='name']").focus();
			return false;
		}
		if($("[name='pw']").val()==""){
			alert("패스워드를 입력해 주십시오");
			$("input[name='pw']").focus();
			return false;
		}
		if($("[name='pw2']").val()==""){
			alert("패스워드 확인을 입력해 주십시오");
			$("input[name='pw']").focus();
			return false;
		}
		if($("[name='phone']").val()==""){
			alert("휴대폰 번호를 입력해 주십시오.");
			$("input[name='phone']").focus();
			return false;
		}
		if($("[name='email']").val()==""){
			alert("이메일을 입력해 주십시오.");
			$("input[name='email']").focus();
			return false;
		}

		if($("#enterprise").is(":checked")){
			if($("[name='enterprisetext']").val()==""){
			alert("사업자 번호를 입력해 주십시오.");
			$("input[name='enterprisevar']").focus();
			return fales;
			}
		} 
		if(invite==null||invite==""){
			document.sinupac.submit(); 
		}else{
			for(var i=0; i<spcodeid.length; i++){
					
				if(invite==spcodeid[i]){
						ischeck = true;
						document.sinupac.submit(); 
						break;
					}
				}
				
				if(!ischeck){
					alert("잘못된 추천인 입니다.");
				}
			}
		}
		
			function pagedown(){
				 location.href = "mainpage.jsp"; 
			}
				
	
	
	</script>
	
</body>
</html>

<!--
service.checked=true;-->