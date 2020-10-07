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

<!-- id에 예약 내역이 없다면 내역 없음 안내  -->
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
		        예약 및 이용후기 
		    </div>
		    <div class="main_left_top2">
                
		        예약하신 내역 조회가 가능합니다.
		    </div> 
		</div>
	<div class="table2">
		    <table>
		        <tr class="tr">
		            <th>
		                예약 번호
		            </th>
		            <th>
		               호텔 이름
		            </th>
		            <th>
		                객실명
		            </th>
		            <th>
		                숙박금액
		            </th>
		            <th>
		                투숙일
		            </th>
		            <th>
		                리뷰
		            </th>
		        </tr>
		        <tr>
		            <td colspan="5">
		                예약 내역이 없습니다.
		            </td>
		        </tr>
		    </table>
	        
		</div>
		<div class="info">
		    <div class="info_top">
		        안내
		    </div>
		    <div class="info_bottom">
		        문의하신 글은 순차적으로, 담당자의 답변 등록 후 글이 게제될 예정입니다.<br>저희 <span>그린호텔</span>은 고객님들께 빠른 답변을 드리고자 늘 최선의 노력을 다하고 있습니다.<br> 급한 용무가 필요한 고객님들의 경우 고객센터 <span>1577-9056</span>으로 연락 주시기 바랍니다.<br>
		        그린호텔 고객센터 운영 시간: 9AM ~ 6PM (월요일 ~ 금요일, 공휴일 제외)
		    </div>
		</div>
	</div>
	<div class="main_right">
	    <div class="mypage">
	      <div class="list0">>MY PAGE</div>
	       <hr>
	    </div>
        <div class="list1">예약내역 및 이용후기 </div><br>
        <div class="list2">문의 및 조회</div><br>
        <div class="list3"> 회원정보 변경</div><br>
        <div class="list4">추천 정보</div><br>
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
		        1:1 문의하기 
		    </div>
		    <div class="main_left_top2">
                
		        문의하신 내역 조회가 가능합니다.
		    </div> 
		</div>
		
		<div class="table">
		    <table>
		        <tr class="tr">
		            <th>
		                예약 번호
		            </th>
		            <th>
		               호텔 이름
		            </th>
		            <th>
		                객실명
		            </th>
		            <th>
		                숙박금액
		            </th>
		            <th>
		                투숙일
		            </th>
		            <th>
		                리뷰
		            </th>
		        </tr>
	<!-- 예약 내역이 있다면 화면에 출력 -->
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
		<!-- 리뷰를 썼다면 리뷰 보기 버튼 reviewRead true
			 리뷰를 안 썼다면 리뷰 쓰기 버튼  reviewRead False-->
			
				<%
					if(v.get(i).getReviewWrite()==true)
					{ 
				%>
						<input type="button" value="리뷰보기" onclick="reviewRead('<%=v.get(i).getRvNum() %>')">
					
						
				<%
					}else{ 
				%>	<!-- rvNum 값 review 페이지로 넘기기 -->
						<input type="button" value="리뷰쓰기" class="reviewwrite" onclick="reviewWrite('<%=v.get(i).getRvNum() %>')" >
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
		        안내
		    </div>
		    <div class="info_bottom">
		        문의하신 글은 순차적으로, 담당자의 답변 등록 후 글이 게제될 예정입니다.<br>저희 <span>그린호텔</span>은 고객님들께 빠른 답변을 드리고자 늘 최선의 노력을 다하고 있습니다.<br> 급한 용무가 필요한 고객님들의 경우 고객센터 <span>1577-9056</span>으로 연락 주시기 바랍니다.<br>
		        그린호텔 고객센터 운영 시간: 9AM ~ 6PM (월요일 ~ 금요일, 공휴일 제외)
		    </div>
		</div>
	</div>
	<div class="main_right">
	    <div class="mypage">
	       <div class="list0">MY PAGE</div>
	       <hr>
	    </div>
        <div class="list1">예약내역 및 이용후기</div><br>
        <div class="list2">문의 및 조회</div><br>
        <div class="list3">회원정보 변경</div><br>
        <div class="list4">추천 정보</div><br>
	</div>
</div>
	
<%
	}
}else{
	System.out.println("null");
}
%>

<input type="hidden" id="id"  value="<%=session.getAttribute("userid")%>">

<!-- hotel_review   reviewNum 값 넘기기 -->
	<script>
	/* $(document).ready(function(){
		$('.reviewwrite').click(function() {
	  		var reviewNum =  $(this).parent().prev().prev().prev().prev().prev().text();
	  		location.href = "review.jsp?reviewNum="+reviewNum;
		});
	 }); */
	</script>

<!-- 리뷰 쓰기와 리뷰업데이트로 넘어가기 -->
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

리뷰 보기에서도 구매내역 값 넘기기
리뷰 업데이트 리뷰 값 받아오기 

	 <script>
		 $(document).ready(function(){
			 $(".editdel").click(function(){
	 			//IDX값을 저장해서 넘겨준다
	 			var myIdxDiv = $(this).parent().next().children().eq(0).text();
	 			window.open("myGuestBook_Edit_Del.jsp?idx="+ myIdxDiv, "_blank", "width=500, height=600");
			});
			 $(".reply").click(function(){
	 			//IDX값을 저장해서 넘겨준다
	 			var myIdxDiv = $(this).parent().next().children().eq(0).text();
	 			window.open("myGuestBook_replyPage.jsp?idx="+ myIdxDiv, "_blank", "width=500, height=600");
			});
		 });
	 </script>
	 		
<%-- 	reviewWrite 를 어디서 true와 false로 바꾸는가
	 
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

idx roomNum 값 

예약 정보에 reviewWrite가 TRUE False 
review.jsp 에서 글쓰기 버튼 클릭시 reivewWrite가 true로 값 저장
문제는 review.jsp는 reviewdto reviewdao 이용 
reviewwRITE 값을 가져오는 REVIEW HISTORY와 다름

선택한 예약 값을 리뷰페이지에 가져와서 작성하고
reviewWrite에서 

review.jsp에 history 선택한 창 나오기




예약 내역 가져와서 아이디에 호텔 정보 리뷰 쓰기 -> 리뷰 보기 ->리뷰 수정/삭제
hotel_reservation
rvID
rvHotelName
price

투숙인원
객실수
객실금액
옵션금액
총숙박금액

쓴 리뷰 내역  -->
<!--  리뷰를 안 쓴다면 버튼 리뷰 쓰기 만약 리뷰를 썼다면 리뷰보기 버튼 -->


<!-- 예약한 내역이 있다면 예약 내역 뜨기 없다면 예약 내역 없음 안내 -->
<%-- <%=session.getAttribute("userid") %>
	<%
		if(session.getAttribute("rvID") == null)
		{ 
	%>
			<!-- <script>alert("구매내역이 존재하지 않습니다.");</script> -->
	<%
		}else{ 
	%>
		
		<div class="history">
			<div class="history1">
				<img src="image/hilton.jpg">
			</div>
			<div class="history2">
				<input type="text" name="rvHotelName" value="호텔이름"><br><br>
				<input type="text" name="price" value="가격"><br><br>
				<input type="text" name="rvroomType" value="내역"><br><br>
				<input type="submit" value="리뷰 쓰기">
			</div>
		</div>
			
			<form action="historypage.do">
				<%=session.getAttribute("") %>
				<input type="submit" value="리뷰 쓰기">
			</form>
			
	<%	} %>
 --%>

<!--  리뷰를 안 쓴다면 버튼 리뷰 쓰기 만약 리뷰를 썼다면 리뷰보기 버튼
리뷰 갯수가 1개인가 0개인가 1개이면 리뷰 수정 0개이면 리뷰쓰기 -->
<%-- <%=session.getAttribute("reviewNum") %>
	<%
		if(session.getAttribute("reviewNum") == null)
		{ 
	%>
			<input type="submit" onclick="reviewWrite()" value="리뷰쓰기">
	<%
		}else{ 
	%>
			<input type="submit" onclick="reviewRead()" value="리뷰보기">
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
	
	
	예약 내역 불러온곳 버튼에 리뷰 연결 디자인
	리뷰 쓰고 수정 삭제
	db 넣기
	호텔정보
	

 --%> 


</body>
</html>