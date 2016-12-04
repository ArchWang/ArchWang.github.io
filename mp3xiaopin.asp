<!-- #include file="incGB.asp" -->
<!-- #include file="config.inc" -->
<%
Server.ScriptTimeOut=9999999
on error resume next 

url = "http://list.mp3.baidu.com/list/xiaopin.html"

ComStr = GetPage(url)
if err.number=0 then

TheBody = GetContent(Comstr,"</iframe>","<input type=hidden name=refreshtime value=@-RESBODY-@>",0)

TheBody=replace(TheBody,"http://mp3.baidu.com/m?tn=baidump3&ct=134217728&lm=-1&li=506&word=", path & listfilename & "?"&key1&"=")
TheBody=replace(TheBody,"http://mp3.baidu.com/m?f=ms&tn=baidump3&ct=134217728&lf=&rn=&word=", path & listfilename & "?"&key1&"=")
TheBody=replace(TheBody,"<a href=""xiangshengmingjia.html"" ><strong>  相声名家  </strong></a>","")
TheBody=replace(TheBody,"<b><a href=""xiangsheng.html"" class=""style1"">相声荟萃</a></b>","")
end if

%>
<HTML>
<HEAD>
<TITLE>小品</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
</HEAD>
<LINK href="css.css" rel=stylesheet type=text/css>
<STYLE type=text/css>

A:link {
	TEXT-DECORATION: underline;FONT-FAMILY:  "Arial"}
A:visited {
	TEXT-DECORATION: underline;COLOR: #0033cc; FONT-FAMILY: "Arial"}
a.blacklink:link{color:#000000}
a.blacklink:visited{color:#000000}
a.blacklink:hover{color:#000000}
TD {FONT-SIZE: 9pt; LINE-HEIGHT: 18px;FONT-FAMILY: "Arial"}
.c {	COLOR: #666666; size: -1}

.border {font-size: 14px;padding-right: 10px;}
.sbjt{font-size: 14px;color: #000000;line-height: 18px;padding-left: 5px;}
.setBor {
	BORDER-RIGHT: #BEE9F9 1px solid; BORDER-TOP: #BEE9F9 1px solid; BORDER-LEFT: #BEE9F9 1px solid; BORDER-BOTTOM: #BEE9F9 1px solid;padding-bottom:4px;}
.unnamed1 {  margin-bottom: 10px}
.blue {  border: #BEE9F9; border-style: solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px}
.unnamed2 {  margin-top: 8px; margin-bottom: 8px}
.unnamed3 {border: 1px solid #BEE9F9;}
.dot{font-size:7px;margin-right:6px;}
.p14{font-size:14px;}
body,td,th {
	font-family: 宋体;
}
.LinkRing {margin-right: 6px;margin-left: 4px;}
.LinkRingFirst {margin-right: 6px;margin-left: 0px;}	

/*#Tleft { DISPLAY: inline; VERTICAL-ALIGN: top; WIDTH: 300px; TEXT-ALIGN: left;}
#Tright { DISPLAY: inline; VERTICAL-ALIGN: middle; WIDTH: 460px; TEXT-ALIGN: right; padding-top:10px;padding-right:10px;}*/
#title { WIDTH: 760px; TEXT-ALIGN: left;)

</STYLE>
<BODY>
<!-- #include file="top.asp"-->
	<DIV id="title">
		<DIV><%=TheBody%></table></DIV>
	</DIV>
<!-- #include file="but.asp"-->
</body>
</html>