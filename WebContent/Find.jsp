<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
<title>Insert title here</title>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
}

 a.white12bold:link { font-size : 12px;  color : #ffffff;  text-decoration : none; font-weight: bold;  }
 a.white12bold:visited { font-size : 12px;  color : #ffffff;  text-decoration : none; font-weight: bold;  }
 a.white12bold:active { font-size : 12px;  color : #ffffff;  text-decoration : none; font-weight: bold; }
 a.white12bold:hover { font-size :12px;  color : #ffffff;  text-decoration : none; font-weight: bold;  }
 a.grey12:link { font-size : 12px;  color : #666666;  text-decoration : none;   }
 a.grey12:visited { font-size : 12px;  color : #666666;  text-decoration : none;   }
 a.grey12:active { font-size : 12px;  color : #666666;  text-decoration : none;  }
 a.grey12:hover { font-size :12px;  color : #666666;  text-decoration : none;   }
 
 
.white12bold {
	font-size: 12px;
	font-weight: bold;
	color: #ffffff;
	line-height: 17px;
}
.grey12 {
	font-size: 12px;
	color: #666666;
	line-height: 18px;
	font-weight:normal;
}
.stitle{height:15px; color:#666666; font-size:11px; font-family:Tahoma, Verdana, MalgunGothic,"돋움", "굴림"; font-weight:bold; border-bottom:2px solid #cccccc}
.regtable {border-top:1px solid #eaeaea; margin:0 0 20px 0}
.regtable td{border-bottom:1px solid #eaeaea; padding:0 10px; font-family:Tahoma, Verdana, MalgunGothic,"돋움", "굴림"; font-size:11px;}

.bts a{display:block; background:url('/images/bts.gif') left 0; float:left; font-size:11px; font-family:Tahoma, Verdana, MalgunGothic,"돋움", "굴림"; color:#777; padding-left:6px; text-decoration:none; height:21px; cursor:pointer; margin-right:3px; overflow:hidden; margin:0 0 0 3px; text-align:center}
.bts a:hover{background:url('/images/bts.gif') left -21px; text-align:center}
.bts a span{display:block; float:left; background:url('/images/bts.gif') right 0; line-height:180%; padding-right:6px; height:21px; overflow:hidden; text-align:center}
.bts a:hover span{background:url('/images/bts.gif') right -21px; color:#000; text-align:center}
</style>
<script language = "javascript">
function id_search()
{
    var f = document.id_f;

        if(f.mem_name.value=="")
        {
            alert("이름을 입력해주세요.");
            f.mem_name.focus();
            return;
        }

        if(f.mem_email.value=="")
        {
            alert("E-mail을 입력해주세요.");
            f.mem_email.focus();
            return;
        }
        
f.submit();
	}
	
	
	
function pw_search()
{
    var f = document.pw_f;

        if(f.mem_id.value=="")
        {
            alert("ID를 입력해주세요.");
            f.mem_id.focus();
            return;
        }

        if(f.mem_email.value=="")
        {
            alert("E-mail을 입력해주세요.");
            f.mem_email.focus();
            return;
        }

f.submit();
	}
</script>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#999999"  style="padding:5px 10px;" class="white12bold">아이디/비밀번호 찾기</td>
	</tr>
</table>
<table width="450" border="0" cellspacing="0" cellpadding="0" class="grey12">
	<tr>
		<td style="padding:20px 0 0 0">
			<table width="420" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding:15px; border-top:2px #cccccc solid; border-right:2px #cccccc solid; border-bottom:2px #cccccc solid; border-left:2px #cccccc solid;">
						<form name="id_f" id="id_f" method="post" action="Findid.do">
						  <table width="380" border="0" cellspacing="0" cellpadding="0">
  							<tr>
  								<td class="stitle">아이디 찾기</td>
  							</tr>
  					  </table>
  						<table width="380" border="0" cellspacing="1" class="regtable">
  							<tr>
  								<td width="100" height="25" bgcolor="#f4f4f4">이름</td>
  								<td width="130">
  									<input type="text" name="named" id="mem_name" tabindex="1"/>
  								</td>
  								<td rowspan="2" align="center">
  								<div class="bts" ><a href="javascript:id_search();"  tabindex="4">
  								<span style="width:80px">아이디 찾기</span></a></div></td>
  							<tr>
  								<td height="25" bgcolor="#f4f4f4">e-Mail</td>
  								<td>
  									<input type="text" name="email" id="mem_email" tabindex="2"/>
  								</td>
  							</tr>
						  </table>
					  </form>
						
						

						<form name="pw_f" id="pw_f" method="post" action="Findpw.do">
  						<table width="380" border="0" cellspacing="0" cellpadding="0">
  						  <tr>
  								<td class="stitle">비밀번호 찾기</td>
  							</tr>
  						</table>
  						<table width="380" border="0" cellspacing="1" class="regtable">
  							<tr>
  								<td width="100" height="25" bgcolor="#f4f4f4">ID</td>
  								<td width="130">
  									<input type="text" name="id" id="mem_id" tabindex="5"/>
  								</td>
  								<td rowspan="2" align="center">
  								<div class="bts">
  								<a href="javascript:pw_search();"  tabindex="8">
  								<span style="width:80px">비밀번호 찾기</span></a></div></td>
  							<tr>
  								<td height="25" bgcolor="#f4f4f4">e-Mail</td>
  								<td>
  									<input type="text" name="email" id="mem_email" tabindex="6"/>
  								</td>
  							</tr>
  						</table>
            </form>
            
            
            
					</td>
				</tr>
			</table>
			<table border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td height="40" style="padding:0 13px 0 0">
						<div class="bts"><button onclick="location.href='mainpage.jsp' ">메인으로</button></div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>