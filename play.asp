<!--#include file="incGB.asp"-->
<%dim url,lrcurl,musicname,action
url=request("url")
lrcurl=request("lrcurl")
musicname=request("music")
action=lcase(trim(request("ac")))

if action="t" then
dim qstr,thethie
qstr=request.querystring
qstr=replace(qstr,"ac=t&music=","http://220.181.27.54/m?ct=134217728&tn=baidumt,")
thethie=GetPage(qstr)
musicname=GetContent(TheThie,"<strong>歌曲试听：</strong> <b>","...</b></span></td>",0)
url=GetContent(TheThie,"歌曲出处：<a href=""",""">",0)
end if

musicname=replace(musicname,"</font>","")
if url="" then 
response.redirect "/"
response.end
end if

dim runsys
runsys="mp"
if lcase(request("t"))="r" then runsys="rp"
if lcase(request("t"))="s" then runsys="swf"
if Lcase(right(url,3))=".rm" or Lcase(right(url,3))="mvb" then runsys="rp"
if Lcase(right(url,3))="swf" then runsys="swf"%>
<html>
<head>
<title><%=musicname%>在线试听</title>
<link rel="stylesheet" type="text/css" href="play.css">
</head>
<body>
<%if runsys="swf" then%>
<OBJECT ID="movie" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100%" height="100%">
<PARAM NAME="movie"  VALUE="<%=url%>"><PARAM NAME=quality VALUE=high><embed src="<%=url%>" loop=false menu=false quality=high height="100%" width="102%" TYPE=application/x-shockwave-flash PLUGINSPAGE=http://www.macromedia.com/shockwave/download/index.cgi?P1_Pro d_Version=ShockwaveFlash type="application/x-shockwave-flash">
</OBJECT>
<%else%>
<iframe name="Aspxplrc" id="Aspxplrc" src="playlrc.asp?t=<%=runsys%>&music=<%=musicname%>" width="300" height="240" scrolling="no"></iframe>
<iframe width=250 height=240 src="diaoyong.htm" frameborder=no marginwidth=0 marginheight=0 scrolling=no></iframe>
<%if runsys="rp" then%>	
<object classid="clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA" id="feiyes_player"  width="550" height="60">
	<param name="_ExtentX" value="12383">
	<param name="_ExtentY" value="1667">
	<param name="AUTOSTART" value="-1">
	<param name="SHUFFLE" value="0">
	<param name="PREFETCH" value="0">
	<param name="NOLABELS" value="0">
	<param name="SRC" value="<%=url%>">                                                                                           <param name="CONTROLS" value="StatusBar,ControlPanel">
	<param name="LOOP" value="99">
	<param name="NUMLOOP" value="0">
	<param name="CENTER" value="0">
	<param name="MAINTAINASPECT" value="0">
	<param name="BACKGROUNDCOLOR" value="#000000">
</object>
<%else%>
<object classid="clsid:6bf52a52-394a-11d3-b153-00c04f79faa6" id="feiyes_player" width="550" height="96">
	<param name="url" value="<%=url%>">
	<param name="volume" value="100">
	<param name="playCount" value="99">
	<param name="enablecontextmenu" value="0">
	<param name="enableerrordialogs" value="0">
</object>
<%end if%>
</div>
<%end if%>
</body>
<script language="javascript" type="text/javascript" src="http://js.users.51.la/553942.js"></script>
</html>