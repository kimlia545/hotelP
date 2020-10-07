<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hotel.HotelDAO,hotel.HotelDTO,hotel.login.loginvaleuDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
		display: flex;
		position: relative;
        width: 1150px;
        margin: 0 auto;
	}
    .main_left{
        width: 800px;
        height: 500px;
        padding-top: 20px;
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

  
    .button{
        
        padding-top: 20px;
        padding-left: 600px;
        font-size: 18px;
        width: 750px;
		}
    .button1{
         padding-bottom: 15px;
    }
    .button2{
        padding-top: 15px;
        padding-bottom: 20px;
    }
		#cancle{
            background-color: darkgray;
            color: white;
			width: 150px;
			height: 35px;
			font-size: 18px;
			text-align: center;

		}
		#write{
            background-color: dodgerblue;
            color: white;
			width: 150px;
			height: 35px;
			font-size: 18px;
            text-align: center;
                }

    .info{
            padding-top: 20px;
            width: 750px;
           
         }
    .info1{
            background-color: rgba(0,0,0,0.4);
            color: white;
            height: 40px;
            padding-top: 10px;
            padding-left: 10px;
            
        }
    table{
         
         border-collapse: collapse;
    }
    .td{
        background-color: rgba(0,0,0,0.3);
        width: 150px;
        text-align: center;
        border-bottom: 2px solid gainsboro;
        font-weight: bolder;
    }
    .td2{
        background-color: rgba(0,0,0,0.1);
        width: 600px;
        padding-left: 20px;
        padding-top: 10px;
        padding-bottom: 10px;
        border-bottom: 2px solid gainsboro;
    }
    .text{
        height: 30px;
        width: 300px;
        border: none;
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
    .main_right>div:hover{
		color : dodgerblue;
		cursor : pointer;
	}


</style>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
</head>
<body>
	<% 
		loginvaleuDTO dto = new loginvaleuDTO();
		HotelDAO dao = new HotelDAO();
		if(session.getAttribute("userid")!=null){
			String sessionID = (String)session.getAttribute("userid");
			dto = dao.selectlogin(sessionID);
		}else{
			String sessionCeoID = (String)session.getAttribute("ceoid");
			dto = dao.selectlogin(sessionCeoID);
		}
		
	%>
	<form action="sumlogin.do">
		<div class="main">
	<div class="main_left">
		<div class="main_left_top">
		    <div class="main_left_top1">
            <i class="fas fa-star-of-life"></i>
		        회원정보변경
		    </div>
		    <div class="main_left_top2">
		        회원정보 변경이 가능합니다
		    </div> 
		</div>
      
        <div class="info">
            <div class="info1">
                아래 사항을 입력 후 '저장하기'를 클릭하여 주십시오.
            </div>
            <div class="table">
           
               <table>
                    <tr>
                        <td class="td">아이디</td>
							<%
								String id;
								if(session.getAttribute("userid")!=null){
									id = (String)session.getAttribute("userid");
								}else{
									id = (String)session.getAttribute("ceoid");
								}%>

						<td class ="td2">
								<%=id %>
								<input type="hidden" value="<%=id %>" name="id">
						</td>
                    </tr>
                    <tr>
                        <td class="td">패스워드</td>
                        <td class="td2"><input type="text" class="text" name="pw"></td>
                    </tr>
                    
                    <tr>
						<td class="td"> 이 름 </td>
						<td class="td2"><%=dto.getName()%></td>
					</tr>

                    <tr>
                        <td class="td">연락처</td>
                        <td class="td2"><input type="text" class="text" name="phone"></td>
                    </tr>
                    <tr>
                        <td class="td">이메일</td>
                        <td class="td2" style="padding-bottom: 10px;"><input type="text" class="text" name="email"></td>
                    </tr>
                </table>
            </div>
			
		</div>
		
		<div class="button">
               <div class="button1">
                    <input type="submit" value="저장하기" id="write">
                </div>	
                <div class="button2">
				    <input type="button" value="회원탈퇴" id="cancle">	
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
        <div class="list3"> 회원정보 변경</div><br>
        <div class="list4">추천 정보</div><br>
	</div>
	</div>
	</form>
	
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
	
</body>
</html>