<!-- #include file="incGB.asp" -->
<!-- #include file="config.inc" -->
<%
Server.ScriptTimeOut=9999999
on error resume next 
'dim id
'id = Trim(request("id"))


'if id = empty then id = "A"
url = "http://list.mp3.baidu.com/topso/mp3topsong.html"


ComStr = GetPage(url)
if err.number=0 then

TheBody = GetContent(Comstr,"</iframe>","<input type=hidden name=refreshtime value=@-RESBODY-@>",0)

TheBody=replace(TheBody,"http://mp3.baidu.com/m?tn=baidump3&ct=134217728&lm=-1&li=500&word=", path & listfilename & "?"&key1&"=")

end if

%>
<HTML>
<HEAD>
<TITLE>������MP3��������</TITLE>
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
	font-family: ����;
}
.LinkRing {margin-right: 6px;margin-left: 4px;}
.LinkRingFirst {margin-right: 6px;margin-left: 0px;}	

/*#Tleft { DISPLAY: inline; VERTICAL-ALIGN: top; WIDTH: 300px; TEXT-ALIGN: left;}
#Tright { DISPLAY: inline; VERTICAL-ALIGN: middle; WIDTH: 460px; TEXT-ALIGN: right; padding-top:10px;padding-right:10px;}*/
#title { WIDTH: 760px; TEXT-ALIGN: left;)

</STYLE>
<BODY>
<div id="top">
<div id="topl"><h1><%if keyword="" then
Response.Write(title)
else
Response.Write(keyword)
end if%>������erdu.com.cn</h1></div>
<a href=# onClick="window.external.AddFavorite(document.location.href,document.title)">�ղر�ҳ</a> | <a href=# 
onclick="this.style.behavior='url(#default#homepage)';this.setHomePage(document.location.href);">��Ϊ��ҳ</a>
</div>
<div id="logo">
<ul>
<li><a href="mp3songname.asp">��������</a></li>
<li><a href="mp3new100.asp">���¸���</a></li>
<li><a href="mp3hot500.asp">���ȸ���</a></li>
<li><a href="mp3topsinger.asp">��������</a></li>
<li><a href="mp3movie.asp">��Ӱ����</a></li>
<li><a href="mp3oldsong.asp">�ϸ����</a></li>
<li><a href="mp3tv.asp">���Ӹ���</a></li>
<li><a href="mp3singer.asp">�����б�</a></li>
<li><a href="mp3tagther.asp">���Գ�</a></li>
<li><a href="mp3DJ.asp">��������</a></li>
</ul>
<ul>
<li><a href="mp3minge.asp">��辫ѡ</a></li>
<li><a href="mp3xy.asp">У԰����</a></li>
<li><a href="mp3army.asp">���ø���</a></li>
<li><a href="mp3xs.asp">������ѡ</a></li>
<li><a href="mp3xiaopin.asp">СƷ����</a></li>
<li><a href="mp3quyi.asp">������̸</a></li>
<li><a href="mp3qingyinyue.asp">�����ּ�</a></li>
<li><a href="mp3minyue.asp">�й�����</a></li>
<li><a href="mp3ertong.asp">��ͯ����</a></li>
<li><a href="index.asp">������ҳ</a></li>
</ul>
</div>
<div id="sobg">
<form action="c.asp" name="SoForm">
<INPUT name="<%=key1%>" value="<%=keyword%>" size="60">
<input type=submit value=" ���� ">
<br>
<input name="<%=key2%>" type="radio" value="2" <%if (sotype<>3 and sotype<>4 and sotype<>5 and sotype<>6 and sotype<>7) then%>checked<%end if%>>ȫ������ 
<input name="<%=key2%>" type="radio" value="3" class="button" <%if sotype=3 then%>checked<%end if%>>mp3
<input name="<%=key2%>" type="radio" value="4" class="button" <%if sotype=4 then%>checked<%end if%>>rm
<input name="<%=key2%>" type="radio" value="5" class="button" <%if sotype=5 then%>checked<%end if%>>wma
<input name="<%=key2%>" type="radio" value="6" class="button" <%if sotype=6 then%>checked<%end if%>>flash
<input name="<%=key2%>" type="radio" value="7" class="button" <%if sotype=7 then%>checked<%end if%>>����
</div></form>
<iframe width=760 height=60 src="diaoyong2.htm" frameborder=no marginwidth=0 marginheight=0 scrolling=no></iframe>
	<DIV id="title">
		<DIV><%=TheBody%></table></DIV>
	</DIV>
<!-- #include file="but.asp"-->
<div style="text-align:center;width:500px;visibility: hidden;" align="center"><script src='http://s51.cnzz.com/stat.php?id=197692&web_id=197692' language='JavaScript' charset='gb2312'></script></div>
</div>
</table>
</td></tr>
</body>
</html>