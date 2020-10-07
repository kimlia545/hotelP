<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,hotel.review.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<% System.out.println("reviewUpdate.jsp ����"); %>
<style>
    *,html,body{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        }
    .wrap{
        width: 100%;
    }
    .main{
        padding-top: 20px;
		display: flex;
		position: relative;
        width: 1150px;
        margin: 0 auto;
	}
    .main_left{
        width: 800px;
        height: 500px;
    }
    .main_left_top{
        display: flex;
        border-bottom: 2px solid black;
        width: 750px;
        padding-bottom: 10px;
    }
    .main_left_top1{
        font-size: 25px;
    }
    .main_left_top2{
        padding-top: 10px;
        padding-left: 10px;
    }
    .table{
        padding-top: 50px;
    }
	.main_right{
        padding-top: 18px;
		width: 300px;
		position: absolute;
        color: rgba(0,0,0,0.7);
		left: 850px;
	}
    .mypage{
        padding-bottom: 20px;
        font-size: 20px;
        color: black;
        font-weight: bolder;
    }
    .info{
        padding: 10px;
        margin-top: 50px;
        border-color: rgba(0,0,0,0.2);
        border-style: ridge;
        width: 750px;

    }
    .info_top{
        color:  rgba(0,0,0,0.7);
        font-size: 16px;
        padding-bottom: 10px;
    }
    span{
        color: cornflowerblue;
    }
    .tr{
        background-color: rgba(0,0,0,0.1);
    }
    table{
        width: 750px;
        text-align: center;
        border-collapse: collapse;
    }
    th,td{
         padding: 10px;
    }


		.review{
            margin-top: 20px;
            font-size: 20px;
			width: 750px;
            border: 2px solid gainsboro;
            padding: 10px;
            color: rgba(0,0,0,0.5);

		}
        .riview1{
            display: flex;
            padding-bottom: 20px;
        }
		#title{
			width: 600px;
			height: 25px;
			font-size: 18px;
            background-color: rgba(0,0,0,0.1);
                        border: 2px solid gainsboro;
           
		}
        .review2{
            display: flex;
            padding-bottom: 30px;
        }
		#content{
			width: 600px;
			height: 200px;
			font-size: 15px;
            background-color: rgba(0,0,0,0.1);
                        border: 2px solid gainsboro;
		}
		.button2{
			padding-left: 350px;
            font-size: 18px;
            
		}
		#delete{
            background-color: skyblue;
            color: white;
			width: 150px;
			height: 35px;
			font-size: 18px;
			text-align: center;
		}
		#modify{
            background-color: dodgerblue;
            color: white;
			width: 150px;
			height: 35px;
			font-size: 18px;
			text-align: center;
		}
		.grade{
			display: flex;
		}
    
        .hotelinfo{
			width: 750px;
            margin-top: 20px;
			height: 220px;
			padding-top: 7px;
			display: flex;
			justify-content: space-around;
			font-size: 18px;
			background-color: rgba(0,0,0,0.1);

		}
		.stars{
		display :flex;
		}
		.main_right>div:hover{
		color : dodgerblue;
		cursor : pointer;
	}
     
    
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	
</head>

<body>

<input type="hidden" id="id"  value="<%=session.getAttribute("reviewwrite")%>">
<int reviewNum = (int)request.getAttribute("reviewNum");>
<!-- ���� ���� ����ϱ� -->
<% 
	int rvNum = (int)request.getAttribute("rvNum");
 	
%>

<%-- ���� ���̵� <%=session.getAttribute("userid") %>
 --%>
<div class="main">
	<div class="main_left">
		<div class="main_left_top">
		    <div class="main_left_top1">
            <i class="fas fa-star-of-life"></i>
		        �� ����
		    </div>
		    <div class="main_left_top2">
		        �� ȣ���� ��õ�Ͻðڽ��ϱ�?
		    </div> 
		</div>
      
    <div class="hotelinfo">
        <div class="hotelpic">
				<img src="hotelimg/hilton.jpg">
        </div>
			
	<%
		if(request.getAttribute("myRv") != null){
		Vector<HTHistoryDTO> v = (Vector<HTHistoryDTO>)request.getAttribute("myRv");
		for(int i=0; i<v.size(); i++){ %>
	
			
			<div class="hotelcontent" style='line-height:200%'>
				<p style="border-bottom:1px solid black;"><%=v.get(i).getRvHotelName() %></p> 
				<p><%=v.get(i).getRvroomType() %></p>
				<p><%=v.get(i).getPrice() %></p>
			</div>
			
			<%} 
				
				}%>
			
		</div> 
		
		<% Vector<HTReviewDTO> rv = (Vector<HTReviewDTO>)request.getAttribute("reviewNum");
		
			float mygrade = rv.get(0).getGrade();
			
			for(int i=0;i<rv.size();i++){ %>
<!-- ���� ���� ����ϱ� -->
<form id="review" name="review" action="reviewUpdateAction.do" method="post">
		<div class="review"> 
			<div class="riview1">
				���� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="title" value="<%=rv.get(i).getTitle()%>" name="title">
			</div>
			<div class="riview2">
				���� &nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="content" id="content" value="<%=rv.get(i).getContent()%>" name="content">
			</div><br>
			<div class="grade">
          		 <div class="grade1">
          		 	���� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		 </div>
          		 <div class="stars">
					 <!-- ���� �� ���� �������� -->

						<%
							int grade = (int)rv.get(i).getGrade();		
			
						for(int j=0; j < 5; j++){ 
							if(j<grade){								
								out.println("<img src='hotelimg/star_yellow.png' class='star'>");
							}else{
								out.println("<img src='hotelimg/star_gray.png' class='star'>");
							}
						}%>
				
           		 </div>
			</div>
			<% }
			
			%>
		
			<div class="button2">
				<input type="button" value="����" id="delete" onclick="deletethis()">
				<input type="hidden" name="grade" class="starvalue" id="grade" value="<%=mygrade %>">
				<input type="hidden" name="id" value="<%=(String)session.getAttribute("userid") %>">
				<input type="hidden" name="rvNum" value="<%=rvNum %>">
				<input type="submit" value="����" id="modify"> 
				<!--���� ����-->
			</div>
		</div>
</form>				
	
		<div class="info">
		    <div class="info_top">
		        �ȳ�
		    </div>
		    <div class="info_bottom">
		        �����Ͻ� ���� ����������, ������� �亯 ��� �� ���� ������ �����Դϴ�.<br>���� <span>�׸�ȣ��</span>�� ���Ե鲲 ���� �亯�� �帮���� �� �ּ��� ����� ���ϰ� �ֽ��ϴ�.<br> ���� �빫�� �ʿ��� ���Ե��� ��� ������ <span>1577-9056</span>���� ���� �ֽñ� �ٶ��ϴ�.<br>
		        �׸�ȣ�� ������ � �ð�: 9AM ~ 6PM (������ ~ �ݿ���, ������ ����)
		    </div>
		</div>
	</div>
	<div class="main_right">
	    <div class="mypage">
	       MY PAGE
	       <hr>
	    </div>
        <div class="list1"> ���೻��</div><br>
        <div class="list2"> �˸� ��û ����</div><br>
        <div class="list3"> ģ�� �ʴ��ϱ�</div><br>
        <div class="list4"> ȸ������ ����</div><br>
        <div class="list5"> 1:1 �����ϱ�</div><br>
        <div class="list6"> �̿��ı�</div><br>
</div>
</div>
	
	
	
	<script>
		function deletethis(){
			location.href = "reviewDeleteAction.do?rvNum="+<%=rvNum%>;
		}
	</script>
	
	<script>
		$(function(){
			$("#write").click(function(){
				
				if($(".stars img").eq(0).attr("src").indexOf("gray")>0){ //ù��° ���� Ŭ������ �ʾҴٸ� �˸� �߱�
					alert("������ �����ּ���.");
					return false;
				}else{
					var i = 1;
					for(i=1;i<5;i++){
						if($(".stars img").eq(i).attr("src").indexOf("gray")>0){ //�� Ŭ���� ���� ���� 
							break;
						}
					}
					
					$(".starvalue").val(i);
					
				}
			});
		});
	
	</script>
	<script>
			 $(document).ready(function(){
							
			var yellowstar1 = false;	
					
			$(".star").click(function(){ //���� Ŭ���� ����� ȸ�� ���� �ٲٱ�
				var gradeNum = $(this).index()+1;
				$("#grade").val(gradeNum);
				$(this).attr("src", "hotelimg/star_yellow.png");
				$(this).prevAll().attr("src", "hotelimg/star_yellow.png");
				$(this).nextAll().attr("src", "hotelimg/star_gray.png");
				
			});	
				
		});	
		
	</script>

</body>
</html>

