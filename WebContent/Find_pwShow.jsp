<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hotel.login.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	FindDTO dto=(FindDTO)request.getAttribute("mypw");
%>
<table width="1330px"  border="0"  height="430px" align="center"   >
   <tr>
    <td>
     <table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
    <tr>
    <td>
    <form action="change_PW.do">
    <input type="hidden"  name =id value="<%= dto.getId()%>">
     <table width="750px" align="center" border=0; style="background-color:white; margin-top:3%" >
      <%if(dto.getPw()!= null){ %>
      <tr>
       <td style="text-align: center;"><P>���ο� ��й�ȣ</P></td>
       <td><input type="text" name="pw1"></td>
      </tr>
      <tr>
       <td style="text-align: center;"><P>��й�ȣ Ȯ��</P></td>
       <td><input type="text" name="pw2"></td>
      </tr>
      </table>
    </td> 
    </tr>
    <tr> 
    <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
       <td><input type="submit" value="����" class="btn btn-primary"></td>
        <td><input type="button" value="���" class="btn btn-primary" onclick="location.href='mainpage.jsp'"></td>
       </tr>
      </table>
     </form>  
     </td>
    </tr>  
    <tr> 
    <td>
    <%} else{%>
      <tr>
      <td align="center"><h1>���������� �����ϴ�.</h1></td>
      </tr>   
      </table>
    </td> 
    </tr>       
   <tr> 
    <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
        <td><input type="button" value="ȸ�������ϱ�" class="btn btn-primary" onclick="location.href='signup.jsp'"></td>
        <td><input type="button" value="ó������" class="btn btn-primary" onclick="location.href='mainpage.jsp'"></td>
       </tr>
      </table>   
      <%} %>
     </td>
    </tr>
  </table>
 </td>
</tr>
</table>
</body>
</html>