<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
/*<div id="del" class="none">
Are you sure you want to delete riview?<br>
<div>
	<input type="button" value="cancel" onclick="closeThis()">
	<input type="button" value="confirm" onclick="goDelPage()">
</div>
</div>

<script>
function closeThis(){
self.close();
}
function goDelPage(){
var pw = document.getElementById("reviewNum").value;
<%-- location.href="myGuestBook_DelProc.jsp?idx="+<%=reviewNum%>; --%>
}
</script>



<script>
$(function(){
//마우스 오버시에 메뉴 색상 변경
$("ul li:nth-child(2)").click(function(){
	$(this).css("backgroundColor","white");
	$(this).css("color","black");

	$(this).prev().css("backgroundColor","#f5f9fa");
	$(this).prev().css("color","#666");
	
	$("#edit").addClass("none");
	$("#del").removeClass("none");
});

$("ul li:nth-child(1)").click(function(){
	$(this).css("backgroundColor","white");
	$(this).css("color","black");

	$(this).next().css("backgroundColor","#f5f9fa");
	$(this).next().css("color","#666");
	
	$("#del").addClass("none");
	$("#edit").removeClass("none");
});

</script>

</body>
</html>