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
		<a href=""> ������ ����</a><br>
		<a href=""> ��������</a><br>
	</div>
	<hr>
	<a href=""> ���೻��</a><br>
	<hr>
	<a href=""> �˸� ��û ����</a><br>
	<hr>
	<a href="Invitefriends.do?Id=<%=session.getAttribute("userid")%>"> ���� ��õ�� ���</a><br>
	<hr>
	
	<input type="hidden" name="idval">
	<a href="loginupdate.do?loginval=<%=session.getAttribute("userid")%>"> ȸ������ ����</a><br>
	
	<hr>
	<a href="QnApage.do"> 1:1 �����ϱ�</a><br>
	<hr>
	<a href="Reviews.do"> �̿��ı�</a><br>
	
</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>