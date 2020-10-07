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
	String id=(String)request.getAttribute("myid");
%>
<table width="1330px"  border="0"  height="430px" align="center"   >
   <tr>
    <td>
     <table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
    <tr>
    <td>
     <table width="750px" align="center" border=0; style="background-color:white; margin-top:3%" >
      <%if(id!= null){ %>
      <tr>
       <td style="text-align: center;"><%= request.getAttribute("name")%>님의 아이디는</td>
      </tr>
      <tr>
      <td align="center"><h1><%=id %></h1>입니다.</td>
      </tr>
      </table>
    </td> 
    </tr>
    <tr> 
    <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
        <td><input type="button" value="처음으로" class="btn btn-primary" onclick="location.href='mainpage.jsp'"></td>
       </tr>
      </table>   
     </td>
    </tr>  
   <tr> 
    <td>
      <%} else{%>
      <tr>
      <td><%= request.getAttribute("name")%>님의 아이디는</td>
      </tr>
      <tr>
      <td><h1>가입정보가 없습니다.</h1></td>
      </tr>   
      </table>
    </td> 
    </tr>       
   <tr> 
    <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
        <td><input type="button" value="회원가입하기" class="btn btn-primary" onclick="location.href='signup.jsp'"></td>
        <td><input type="button" value="처음으로" class="btn btn-primary" onclick="location.href='mainpage.jsp'"></td>
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