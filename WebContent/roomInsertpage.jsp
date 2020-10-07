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
				<input type="text" placeholder="ȣ�� �̸�" name="hotelname"><br><br>
			 	<img src="hotelimg/star_gray.png">
			 	<img src="hotelimg/star_gray.png">
			 	<img src="hotelimg/star_gray.png">
			 	<img src="hotelimg/star_gray.png">
			 	<img src="hotelimg/star_gray.png">
			 	 <br><br>
			 	<input type="text" placeholder="ȣ���ּ�" name="hoteladdress"><br><br><br>
			 	
			 </div>
		</div>
		<br>
		<div style="width: 350px">���� �� 
			<input type="text" placeholder="�� ���� " name="roomamount" class="roomamount" value="1">
			<input type="button" value="���� ����" name=roomin id="addroom">
		
		</div><br>
	</div>
	
	<div class="center_Click" style="width: 1100px;height: 75px">
		<button type="button" class="a"onclick="tab1">���Ǿȳ�/����</button>
		<button type="button" class="b" onclick="tab2">��������</button>
		<button type="button" class="c" onclick="tab3">����</button>
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
				<td><input type="text" placeholder="����Ÿ��" name="roomtype0" style="font-weight: bold; height: 30px; width: 150px"></td>
				<td><input type="text" placeholder="�ּ� ������ " name="minguest0" style="width: 75px"> ~ <input type="text" placeholder="�ִ� ������" name="maxguest0" style="width: 75px"></td>	
			</tr>
			
			<tr style="margin-left: 20px;">
				<td style="width: 560px; margin-left: 20px;">����</td>
				<td><input type="text" placeholder="���� ����" name="roomprice0"></td>
			</tr>
			
			<tr>
				<td colspan="1"><input type="text" placeholder="���� ��" name="guestroomamount" style="width: 150px"></td>
			</tr>
			
			<tr>
				<td class="guest_btn" colspan="2" style="height:50px;"><input type="button" value="���� �̿� �ȳ�" style="width: 800px; height: 40px"></td>
				
			</tr>
				
			<tr>	
				<td colspan='2' style=height:50px;><input type='button' value='����' style='width: 800px; height: 40px'></td>	
			</tr>
		</table>
		<div id="rooms"></div>
	<input type="submit" value="�ۼ� �Ϸ�">
</div>

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
		</article>
		<input type="button" value="�̿� �ı� ��� ����" id="check">
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



<script type="text/javascript">
	$(function(){
		$('#hotelimg').on('change', function() {
		    
		    ext = $(this).val().split('.').pop().toLowerCase(); //Ȯ����
		    
		    //�迭�� ������ Ȯ���ڰ� �����ϴ��� üũ
		    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		        resetFormElement($(this)); //�� �ʱ�ȭ
		        window.alert('�̹��� ������ �ƴմϴ�! (gif, png, jpg, jpeg �� ���ε� ����)');
		    } else {
		        file = $('#hotelimg').prop("files")[0];
		        blobURL = window.URL.createObjectURL(file);
		        $('#hotelimgpreview img').attr('src', blobURL);
		        $('#hotelimgpreview').slideDown(); //���ε��� �̹��� �̸����� 
		        $(this).slideUp(); //���� ��� ����
		    }
		});
		
		$('#hotelimgpreview a').bind('click', function() {
		    resetFormElement($('#hotelimg')); //������ ��� �ʱ�ȭ
		    $('#hotelimg').slideDown(); //���� ��� ������
		    $(this).parent().slideUp(); //�̸� ���� ���� ����
		    return false; //�⺻ �̺�Ʈ ����
		});
		
		
		//�������� �߰� �� ��ҿ� ÷�� �̺�Ʈ�� �̺�Ʈ ����
		$("body").on('change','.roomimg',function() {
			ext = $(this).val().split('.').pop().toLowerCase(); //Ȯ����

		    //�迭�� ������ Ȯ���ڰ� �����ϴ��� üũ
		    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		        resetFormElement($(this)); //�� �ʱ�ȭ
		        window.alert('�̹��� ������ �ƴմϴ�! (gif, png, jpg, jpeg �� ���ε� ����)');
		    } else {
		    	
		        file = $(this).prop("files")[0];
		        blobURL = window.URL.createObjectURL(file);
		        
		        $(this).prev(".guestimg").children("img").attr('src', blobURL);
		        $(this).prev().slideDown();
		        
		       // $('.guestimg img').attr('src', blobURL);
		       // $('.guestimg').slideDown(); //���ε��� �̹��� �̸����� 
		        $(this).slideUp(); //���� ��� ����
		    } 
		});
	
		$('.guestimg a').bind('click', function() {
		    resetFormElement($('.roomimg')); //������ ��� �ʱ�ȭ
		    $('.roomimg').slideDown(); //���� ��� ������
		    $(this).parent().slideUp(); //�̸� ���� ���� ����
		    return false; //�⺻ �̺�Ʈ ����
		});
		
		
		
		
		
		
		
		$("#addroom").click(function(){
			var roomamount =$(".roomamount").val();
			$("#rooms").empty();
			for(var i=1;i<roomamount;i++){ 			
				var txt ="<br>"
					txt +="<table style='border: 1px solid black; width: 1100px; padding: 5px; border-collapse: collapse;'>";		
					txt +="<tr>";
					txt +="<td rowspan='5' style='width: 300px;height: 200px; border: 1px solid black;'><div class='guestimg'><img src='#'/><br/><a href=''#'>Remove</a></div><input type='file' name='roomimg"+i+"' class='roomimg'></td>";
					txt +="<td><input type='text' placeholder='����Ÿ��' name='roomtype"+i+"' style='font-weight: bold; height: 30px; width: 150px'></td>";
					txt +="<td><input type='text' placeholder='�ּ� ������' name='minguest"+i+"' style='width: 75px'> ~ <input type='text' placeholder='�ִ� ������' name='maxguest"+i+"' style='width: 75px'></td>";	
					txt +="</tr>";
					txt +="<tr style='margin-left: 20px;'>";
					txt +="<td style='width: 570px; margin-left: 20px;'>����</td>";
					txt +="<td><input type='text' placeholder='���� ����' name='roomprice"+i+"'></td>";
					txt +="<tr><td colspan='1'><input type='text' placeholder='���� ��' name='guestroomamount"+i+" style='width: 150px'></td></tr>";
					txt +="</tr>";
					txt +="<tr>";
					txt +="<td colspan='2' style=height:50px;><input type='button' value='���� �̿� �ȳ�' style='width: 800px; height: 40px'></td>";
					txt +="</tr>";
					txt +="<tr>";
					txt +="<td colspan='2' style=height:50px;><input type='button' value='����' style='width: 800px; height: 40px'></td>";
					txt +="</tr>";
					txt +="</table>";
					$("#rooms").append(txt);
			} 		
						
		});
	
	});
	function resetFormElement(e) {
	    e.wrap('<form>').closest('form').get(0).reset(); 
	    //�����Ϸ��� ����� ��Ҹ� ��(<form>) ���� ���ΰ� (wrap()) , 
	    //��Ҹ� ���ΰ� �ִ� ���� ����� ��( closest('form')) ���� Dom��Ҹ� ��ȯ�ް� ( get(0) ),
	    //DOM���� �����ϴ� �ʱ�ȭ �޼��� reset()�� ȣ��
	    e.unwrap(); //���� <form> �±׸� ����
	}
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
	function fn_spread(id){
		var getID = document.getElementById(id);
		getID.style.display=(getID.style.display=='none') ? 'block' : 'none'; }

	function fn_spread2(id){
		var getID = document.getElementById(id);
		getID.style.display=(getID.style.display=='none') ? 'block' : 'none'; }
</script>

</body>
</html>