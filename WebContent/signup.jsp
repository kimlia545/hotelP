<%@page import="hotel.HotelDAO, java.util.*, hotel.login.logincodeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">  <!--�����ֱܳ�-->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script> <!--jquery �̿�-->
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
					���ѹα�, <br>
					�λ� ȣ���� �Ѵ���
				</div>
			</div>
			
			<div class="article_right" >
				<div class="article_right1">
					ȸ������
				</div>
				<div class="article_right2">
					�������
				</div>
				<div class="article_right3">
					<div class="article_right3_left">
						<input type="checkbox" id="service" class="agree" style="cursor: pointer;"> ���� �̿��� ����(�ʼ�) <br>
						<input type="checkbox" id="personal" class="agree" style="cursor: pointer"> �������� ó�� ��ħ ����(�ʼ�) <br>

					</div>
					<div class="article_right3_right" style="cursor: pointer;">
						��� �ڼ��� ���� > <br>
						��� �ڼ��� ���� > <br>

					</div>
				</div>
				
				
				<div class="article_right5" style="width: 620px">
					<div class="article_right5_up">
						<input type="text" class="text" name="id" placeholder="���̵�" style="padding: .8em; .5em; width: 280px;" >
						<input type="text" class="text" placeholder="�̸�" name="name" style="padding: .8em; .5em; width: 280px;"> <br>
						<div class=idteb style="font-size: 10px; color: red;" style="padding: .8em; .5em;"></div>
						<input type="password" class="text" placeholder="�н����� �Է�"  id="pw" name="pw"style="padding: .8em; .5em;width: 280px;"> 
						<input type="password" class="text" placeholder="�н����� Ȯ��" id="pw2"style="padding: .8em; .5em; width: 280px;"> <br>
						<div class=pwteb style="display: none; color: red; display: none">�н����尡 ��ġ ���� �ʽ��ϴ�.</div>
						<input type="text" class="text" placeholder="����ó(���ڸ��Է�)"  name="phone"style="padding: .8em; .5em; width: 280px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						<input type="text" class="text" placeholder="�̸���"  name="email" style="padding: .8em; .5em; width: 280px;">
				<%
					boolean yesno= true;
					boolean ischeck = false; //�ߺ�üũ
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
									/* out.println("�ߺ� 1ȸ"); */
									code = codeid;
									break;
								}else{
									ischeck = true;
								}
							}
						}
						if(ischeck){
						/* 	out.println("�������"); */
							yesno= false;%>
							<input type="hidden" name="codes" value="<%=codeid%>">
						<%}
					}
				%>
					<input type="text" class="text" name="invite" style="padding: .8em; .5em; width: 280px;" placeholder="��õ��" id=invitedate>
					<div class=inviteteb style="font-size: 10px; color: red;" style="padding: .8em; .5em;"></div>					
					</div>
					<div class="article_right5_down" style="width: 620px;">
						<input type="checkbox" id="enterprise"> ��� ȸ�� <br>
						<div class="enterprisevar"><input type="text" class="text" placeholder="����� ��ȣ" id="enterprisetext"name="enterprisetext"style="padding: .8em; .5em; width: 280px; display: none"></div>
						<input type="checkbox"> ������ �̸��� ���ſ� ����(�α��ǰ, ����Ư�� ��) <br>
					</div>
					<div class="enterprisevar" style="display: none">
						
					</div>
				</div>
				
				<div class="article_right6">
					<input type="button" onclick="signup()" value="��Ʈ���� ���� ����! ���� ���������� ����!" style="background-color: rgb(225,18,130); color: white; font-size:18px; width: 550px; height: 50px; border-radius: 10px;">
				</div>
				<div class="article_right7">
					<i class="fas fa-exclamation-circle"></i>
					���� �̿��� ���� ��� ������ ���� ���ּ���!
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
        setInterval(function(){ /*�̹��� �����ư��鼭 ����*/
         $("#background div:nth-child(4)").stop().fadeOut(2000,function(){
         var x=$("#background div:nth-child(4)").detach();
         $("#background").prepend(x);
         $("#background div:nth-child(1)").css({display:"block"});
         });
         },2200);
		
		$("#service").click(function(){ /*���� ��ư Ŭ���� �۵�*/
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
		
		$("#personal").click(function(){ /*personal��ư Ŭ���� �� ��ư �� 1���� Ŭ���ϸ� ���� ���� 2���� Ŭ���ؾ� ����*/
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
			    url: "check.jsp", //��û url �ּ�
			    type: "get", // ������ ���� ��� get , post			   
			    dataType: "json", // ������ Ÿ�� xml, json, html, ...
			    data: $('form').serialize(), // ������ ������ ���۽� ���			    
			    success: function(data){ // ����� ���������� �������� ��			    	
			    	$(".idteb").text(data.result);
			    },
			    complete : function(data) {	 // ����� �������θ� ������ ������ ��   	
			    },
			    error: function (request, status, error){ // ���� �߻���			    	 
				     $(".idteb").text("��Ž���");
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
				     $(".inviteteb").text("��Ž���");
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
			alert("���̵� �Է����ֽʽÿ�.");
			$("input[name='id']").focus();
			return false;
		}
		if($("[name='name']").val()==""){
			alert("�̸��� �Է��� �ֽÿ�");
			$("input[name='name']").focus();
			return false;
		}
		if($("[name='pw']").val()==""){
			alert("�н����带 �Է��� �ֽʽÿ�");
			$("input[name='pw']").focus();
			return false;
		}
		if($("[name='pw2']").val()==""){
			alert("�н����� Ȯ���� �Է��� �ֽʽÿ�");
			$("input[name='pw']").focus();
			return false;
		}
		if($("[name='phone']").val()==""){
			alert("�޴��� ��ȣ�� �Է��� �ֽʽÿ�.");
			$("input[name='phone']").focus();
			return false;
		}
		if($("[name='email']").val()==""){
			alert("�̸����� �Է��� �ֽʽÿ�.");
			$("input[name='email']").focus();
			return false;
		}

		if($("#enterprise").is(":checked")){
			if($("[name='enterprisetext']").val()==""){
			alert("����� ��ȣ�� �Է��� �ֽʽÿ�.");
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
					alert("�߸��� ��õ�� �Դϴ�.");
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