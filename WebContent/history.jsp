<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, hotel.review.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
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
        border-bottom-color: black;
        border-bottom-style: ridge;
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
    .btn{
        background-color: cornflowerblue;
        color: white;
        font-size: 18px;
    }


    
</style>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
</head>
<body>

<!-- id�� ���� ������ ���ٸ� ���� ���� �ȳ�  -->
<%
if(request.getAttribute("myRv") != null){
	Vector<HTHistoryDTO> v = (Vector<HTHistoryDTO>)request.getAttribute("myRv");

	if(v.size()==0){
%>
<div class="main">
	<div class="main_left">
		<div class="main_left_top">
		    <div class="main_left_top1">
            <i class="fas fa-star-of-life"></i>
		        ���� �� �̿��ı� 
		    </div>
		    <div class="main_left_top2">
                
		        �����Ͻ� ���� ��ȸ�� �����մϴ�.
		    </div> 
		</div>
	<div class="table2">
		    <table>
		        <tr class="tr">
		            <th>
		                ���� ��ȣ
		            </th>
		            <th>
		               ȣ�� �̸�
		            </th>
		            <th>
		                ���Ǹ�
		            </th>
		            <th>
		                ���ڱݾ�
		            </th>
		            <th>
		                ������
		            </th>
		            <th>
		                ����
		            </th>
		        </tr>
		        <tr>
		            <td colspan="5">
		                ���� ������ �����ϴ�.
		            </td>
		        </tr>
		    </table>
	        
		</div>
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
	      <div class="list0">>MY PAGE</div>
	       <hr>
	    </div>
        <div class="list1">���೻�� �� �̿��ı� </div><br>
        <div class="list2">���� �� ��ȸ</div><br>
        <div class="list3"> ȸ������ ����</div><br>
        <div class="list4">��õ ����</div><br>
</div>
</div>
		
<%		
	}else{
%>
<div class="main">
	<div class="main_left">
		<div class="main_left_top">
		    <div class="main_left_top1">
            <i class="fas fa-star-of-life"></i>
		        1:1 �����ϱ� 
		    </div>
		    <div class="main_left_top2">
                
		        �����Ͻ� ���� ��ȸ�� �����մϴ�.
		    </div> 
		</div>
		
		<div class="table">
		    <table>
		        <tr class="tr">
		            <th>
		                ���� ��ȣ
		            </th>
		            <th>
		               ȣ�� �̸�
		            </th>
		            <th>
		                ���Ǹ�
		            </th>
		            <th>
		                ���ڱݾ�
		            </th>
		            <th>
		                ������
		            </th>
		            <th>
		                ����
		            </th>
		        </tr>
	<!-- ���� ������ �ִٸ� ȭ�鿡 ��� -->
<%
		for(int i=0; i<v.size(); i++){
%>
	
			<tr>
				<td><%=v.get(i).getRvNum() %></td>
				<td><%=v.get(i).getRvHotelName() %></td>
				<td><%=v.get(i).getRvroomType() %></td>
				<td><%=v.get(i).getPrice() %></td>
				<td><%=v.get(i).getCheckIn() %> ~ <%=v.get(i).getCheckOut()%></td>
				
				<td>
		<!-- ���並 ��ٸ� ���� ���� ��ư reviewRead true
			 ���並 �� ��ٸ� ���� ���� ��ư  reviewRead False-->
			
				<%
					if(v.get(i).getReviewWrite()==true)
					{ 
				%>
						<input type="button" value="���亸��" onclick="reviewRead('<%=v.get(i).getRvNum() %>')">
					
						
				<%
					}else{ 
				%>	<!-- rvNum �� review �������� �ѱ�� -->
						<input type="button" value="���侲��" class="reviewwrite" onclick="reviewWrite('<%=v.get(i).getRvNum() %>')" >
				<%	} %>
				   
				
				</td>
			</tr>

<%
	}
%>
	</table>
	</div>
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
	       <div class="list0">MY PAGE</div>
	       <hr>
	    </div>
        <div class="list1">���೻�� �� �̿��ı�</div><br>
        <div class="list2">���� �� ��ȸ</div><br>
        <div class="list3">ȸ������ ����</div><br>
        <div class="list4">��õ ����</div><br>
	</div>
</div>
	
<%
	}
}else{
	System.out.println("null");
}
%>

<input type="hidden" id="id"  value="<%=session.getAttribute("userid")%>">

<!-- hotel_review   reviewNum �� �ѱ�� -->
	<script>
	/* $(document).ready(function(){
		$('.reviewwrite').click(function() {
	  		var reviewNum =  $(this).parent().prev().prev().prev().prev().prev().text();
	  		location.href = "review.jsp?reviewNum="+reviewNum;
		});
	 }); */
	</script>

<!-- ���� ����� ���������Ʈ�� �Ѿ�� -->
	<script>
		function reviewWrite(rvNum){
			location.href = "historyPageproc.do?rvNum="+rvNum;
		}
		function reviewRead(rvNum){
			location.href = "reviewUpdate.do?rvNum="+rvNum;
		}
		
	</script>

	
	<script>
$(function(){
  $('.list0').click(function(){
    location.href = "mypage.do";
  });
  $('.list1').click(function(){
	    location.href = "historypage.do";
  });
  $('.list2').click(function(){
	    location.href = "QnApage.do";
  });
  $('.list3').click(function(){
	    location.href = "loginupdate.do";
 });
  $('.list4').click(function(){
	    location.href = "Invitefriends.do";
 });
 
});
	</script>
	


<%-- 

���� ���⿡���� ���ų��� �� �ѱ��
���� ������Ʈ ���� �� �޾ƿ��� 

	 <script>
		 $(document).ready(function(){
			 $(".editdel").click(function(){
	 			//IDX���� �����ؼ� �Ѱ��ش�
	 			var myIdxDiv = $(this).parent().next().children().eq(0).text();
	 			window.open("myGuestBook_Edit_Del.jsp?idx="+ myIdxDiv, "_blank", "width=500, height=600");
			});
			 $(".reply").click(function(){
	 			//IDX���� �����ؼ� �Ѱ��ش�
	 			var myIdxDiv = $(this).parent().next().children().eq(0).text();
	 			window.open("myGuestBook_replyPage.jsp?idx="+ myIdxDiv, "_blank", "width=500, height=600");
			});
		 });
	 </script>
	 		
<%-- 	reviewWrite �� ��� true�� false�� �ٲٴ°�
	 
	  --%>
	 
<%-- <%

String idx = request.getParameter("idx");
myGuestBookDAO dao = new myGuestBookDAO();
myGuestBookDTO dto =  dao.getSelectIdx(idx);

String content = dto.getContent().replaceAll("\n", "<br/>");
%> --%>


<!-- <div>
<img src="hotelimg/hilton.jpg">
</div> -->
<!-- 

idx roomNum �� 

���� ������ reviewWrite�� TRUE False 
review.jsp ���� �۾��� ��ư Ŭ���� reivewWrite�� true�� �� ����
������ review.jsp�� reviewdto reviewdao �̿� 
reviewwRITE ���� �������� REVIEW HISTORY�� �ٸ�

������ ���� ���� ������������ �����ͼ� �ۼ��ϰ�
reviewWrite���� 

review.jsp�� history ������ â ������




���� ���� �����ͼ� ���̵� ȣ�� ���� ���� ���� -> ���� ���� ->���� ����/����
hotel_reservation
rvID
rvHotelName
price

�����ο�
���Ǽ�
���Ǳݾ�
�ɼǱݾ�
�Ѽ��ڱݾ�

�� ���� ����  -->
<!--  ���並 �� ���ٸ� ��ư ���� ���� ���� ���並 ��ٸ� ���亸�� ��ư -->


<!-- ������ ������ �ִٸ� ���� ���� �߱� ���ٸ� ���� ���� ���� �ȳ� -->
<%-- <%=session.getAttribute("userid") %>
	<%
		if(session.getAttribute("rvID") == null)
		{ 
	%>
			<!-- <script>alert("���ų����� �������� �ʽ��ϴ�.");</script> -->
	<%
		}else{ 
	%>
		
		<div class="history">
			<div class="history1">
				<img src="image/hilton.jpg">
			</div>
			<div class="history2">
				<input type="text" name="rvHotelName" value="ȣ���̸�"><br><br>
				<input type="text" name="price" value="����"><br><br>
				<input type="text" name="rvroomType" value="����"><br><br>
				<input type="submit" value="���� ����">
			</div>
		</div>
			
			<form action="historypage.do">
				<%=session.getAttribute("") %>
				<input type="submit" value="���� ����">
			</form>
			
	<%	} %>
 --%>

<!--  ���並 �� ���ٸ� ��ư ���� ���� ���� ���並 ��ٸ� ���亸�� ��ư
���� ������ 1���ΰ� 0���ΰ� 1���̸� ���� ���� 0���̸� ���侲�� -->
<%-- <%=session.getAttribute("reviewNum") %>
	<%
		if(session.getAttribute("reviewNum") == null)
		{ 
	%>
			<input type="submit" onclick="reviewWrite()" value="���侲��">
	<%
		}else{ 
	%>
			<input type="submit" onclick="reviewRead()" value="���亸��">
			<%=session.getAttribute("reviewNum") %>
	<%	} %>


	<script>
		function reviewWrite(){
			location.href = "review.jsp";
		}
		function reviewRead(){
			location.href = "reviewUpdate.jsp";
		}
		
	</script>
	
	
	���� ���� �ҷ��°� ��ư�� ���� ���� ������
	���� ���� ���� ����
	db �ֱ�
	ȣ������
	

 --%> 


</body>
</html>