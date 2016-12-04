<html>
<head>
<link rel="stylesheet" type="text/css" href="img/play.css" />
<script language=javascript src=lrc.js>
</script>
</head>
</head>

<body bgcolor=#000000 background="/images/lrc.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onselectstart="self.event.returnValue=false" oncontextmenu="return false;" scroll="no">
<script language=javascript>
var thelrc="";
</script>
<!--以下代码不能改动,否则不能显示同步歌词!-->
<script language=javascript src="http://lrc.aspxp.net/bmp3js.asp?t=js&music=<%=request("music")%>"></script>
<center>
<div id=welcome width=400 heiht=20 align="left"><font color=red><b>【歌词调整】</b></font><input type=button value="进半秒" class="button" onclick="offset(1)"><input type=button value="复位" class="button" onclick="offset(0)"><input type=button class="button" value="退半秒" onclick="offset(-1)"><font color=red><b><span id="offsett"></span></b></font></div>
<div id="lrcollbox" style="overflow:hidden; height:180; width:300; background-color:#000000;">
	<table border="0" cellspacing="0" cellpadding="0" width="100%" id="lrcoll" style="position:relative; top: -20px;">      
          <tr><td nowrap height="30" align="center" id="lrcwt1"></td></tr>
          <tr><td nowrap height="20" align="center" id="lrcwt2"></td></tr>
          <tr><td nowrap height="20" align="center" id="lrcwt3"></td></tr>
          <tr><td nowrap height="20" align="center" id="lrcwt4"></td></tr>
          <tr><td nowrap height="20" align="center" id="lrcwt5"></td></tr>
          <tr><td nowrap height="20" align="center" id="lrcwt6"></td></tr>
		<tr><td nowrap height="20" align="center">
		
	             <table border="0" cellspacing="0" cellpadding="0">
		              <tr><td nowrap height="20"><span id="lrcwt7" style="height:20"></span></td></tr>
		              <tr style="position:relative; top: -20px; z-index:6">
		                 <td nowrap height="20"><div id="lrcfilter" style="overflow:hidden; width:100%; color:#FFFF33; height:20"></div></td>
		              </tr>
	             </table>
		     </td>
		</tr>
		<tr style="position:relative; top: -20px">
			<td nowrap height="20" align="center" >
			      <table border="0" cellspacing="0" cellpadding="0">
				         <tr><td nowrap height="20"><span id="lrcbox" style="height:20">歌词加载中</span></td></tr>
				         <tr style="position:relative; top: -20px; z-index:6;">
				             <td nowrap height="20"><div id="lrcbc" style="overflow:hidden; height:20; width:0;"></div></td>
				         </tr>
			      </table>
			</td>
		</tr>
<tr style="position:relative; top: -40px;"><td nowrap height="20" align="center" id="lrcwt8"></td></tr>
<tr style="position:relative; top: -40px;"><td nowrap height="20" align="center" id="lrcwt9"></td></tr>
<tr style="position:relative; top: -40px;"><td nowrap height="20" align="center" id="lrcwt10"></td></tr>
<tr style="position:relative; top: -40px;"><td nowrap height="20" align="center" id="lrcwt11"></td></tr>
<tr style="position:relative; top: -40px;"><td nowrap height="20" align="center" id="lrcwt12"></td></tr>
<tr style="position:relative; top: -40px;"><td nowrap height="20" align="center" id="lrcwt13"></td></tr>
			</table>
</div>
</center>
<script language="JavaScript">
<%if lcase(request("t"))="mp" then%>
var type="mp";
<%else%>
var type="rp";
<%end if%>
lrcrun(thelrc.slice(4,-3));
</script>
