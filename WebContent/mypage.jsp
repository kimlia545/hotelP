<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	

	a{
		text-decoration:none;
	}
</style>
</head>
<body>

<div>
	MY PAGE
	<hr>
	<div>EVASION CLUB<br>
		<a href=""> MY EVASION CLUB</a><br>
		<a href=""> 적립금 내역</a><br>
		<a href=""> 쿠폰내역</a><br>
	</div>
	<hr>
	<a href=""> 예약내역</a><br>
	<hr>
	<a href=""> 알림 신청 내역</a><br>
	<hr>
	<a href="Invitefriends.do?Id=<%=session.getAttribute("userid")%>"> 나를 추천한 사람</a><br>
	<hr>
	
	<input type="hidden" name="idval">
	<a href="loginupdate.do?loginval=<%=session.getAttribute("userid")%>"> 회원정보 변경</a><br>
	
	<hr>
	<a href="QnApage.do"> 1:1 문의하기</a><br>
	<hr>
	<a href="Reviews.do"> 이용후기</a><br>
	
</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>