<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!-- #include file="incGB.asp" -->
<!-- #include file="config.inc" -->
<%
dim keyrword,sotype,page

keyword = trim(request(key1))
sotype  = request(key2)
page    = request(key3)

'listT=trim(request("list"))

'if keyword <> "" then
	'title = keyword
'end if
if sotype = "" then sotype = "1"
if page<>"" and IsNumeric(page) then
	page=clng(page)
else
	page=1
End if
'======ҳ�沿��======
Sub ShowThie()


Dim Re,PageCountStr,PageCount
Select Case sotype
   case 2
      ThePage="http://mp3.baidu.com/m?f=ms&rn=&tn=baidump3&ct=134217728&word="&keyword&"&lm=-1&pn="&Page
   case 3
      ThePage="http://mp3.baidu.com/m?f=ms&rn=&tn=baidump3&ct=134217728&word="&keyword&"&lm=0&pn="&Page
   case 4
     ThePage="http://mp3.baidu.com/m?f=ms&rn=&tn=baidump3&ct=134217728&word="&keyword&"&lm=1&pn="&Page
   case 5
     ThePage="http://mp3.baidu.com/m?f=ms&rn=&tn=baidump3&ct=134217728&word="&keyword&"&lm=2&pn="&Page   
   case 6
     ThePage="http://mp3.baidu.com/m?f=ms&rn=&tn=baidump3&ct=134217728&word="&keyword&"&lm=6&pn="&Page
   case 7
     ThePage="http://mp3.baidu.com/m?f=ms&rn=&tn=baidump3&ct=134217728&word="&keyword&"&lm=32767&pn="&Page
   case else ThePage="http://mp3.baidu.com/m?f=ms&rn=&tn=baidump3&ct=134217728&word="&keyword&"&lm=-1&pn="&Page
End Select

TheThie = GetPage(ThePage)
TheBody = GetContent(TheThie,"<table width=75% border=0 cellpadding=2 cellspacing=0 bordercolor=#ffffff bgcolor=""#FFFFFF"" class=""list"">","</table>",1)

if TheBody="" then
	Response.Write "<h2>û���ҵ��൱����!�������µĹؼ�������!</h2>"
exit sub
End if

TheBody=Replace(TheBody,"<table width=75% border=0 cellpadding=2 cellspacing=0 bordercolor=#ffffff bgcolor=""#FFFFFF"" class=""list"">","<table width=760 border=0 cellpadding=0 cellspacing=0 class=""list"">")


TheBody=Replace(TheBody,"http://img.baidu.com/img/mp3/","img/")
ThiePageM=GetContent(TheThie,"<div class=""pg"">","</div>",0)

Set Re=new RegExp
Re.Global = True
Re.Pattern=" onclick="".+?"""
TheBody=Re.Replace(TheBody,"")
Re.Pattern="mp3.baidu.com\/tr\?url=.+?>"
TheBody=Re.Replace(TheBody,"www.ashiting.com/ring.asp?word="&keyword&""" target=_blank>")
Re.Pattern="href=""http:\/\/mp3.baidu.com\/m\?tn=baidump3&ct=.+?word=(.+?)&lm.+?>(.+?)</a>"
TheBody=Re.Replace(TheBody,"href=""c.asp?word=$1&t=2"">$2</a>")
Re.Pattern="href=""http:\/\/mp3.baidu.com\/m\?tn=baidump3lyric&word=(.+?)&.+?>(.+?)</a>"
TheBody=Re.Replace(TheBody,"href=""c.asp?w$1&t=2"">$2</a>")
Re.Pattern="<a href=""http:\/\/\S+?\.\S+?\.\S+?\.\S+?\/m.+?�����������Դ��ַ��  (.+?)   ����հٶ�Ȩ������ʹ��"" >(.+?)</a>"
if download="n" then
TheBody=Re.Replace(TheBody,"<a href=""play.asp?ac=play&url=$1&music=$2"" target=""play"">$2</a>")
else
TheBody=Re.Replace(TheBody,"<a href=""play.asp?ac=play&url=$1&music=$2"" target=""play"">$2</a>")
end if
Re.Pattern="&music=<font style=color:#e10900>(.+?)</font>"
TheBody=Re.Replace(TheBody,"&music=$1")
Re.Pattern="<a target=""_blank"" href=""http:\/\/(\S+?)\.(\S+?)\.(\S+?)\.(\S+?)/m\?ct=134217728&tn=baidumt,"
TheBody=Re.Replace(TheBody,"<a target=""play"" href=""play.asp?ac=t&music=")

'����ҳ������
Re.Pattern="href=(http:\/\/mp3.baidu.com\/m)(.+?)pn=(\S+?)>(.+?)</a>"
ThiePageM=Re.Replace(ThiePageM,"href=""?"&key1&"="&Keyword&"&"&key2&"="&sotype&"&"&key3&"=$3"">$4</a>")

Set Re=Nothing

'������������
TheBody=Replace(TheBody,"http://mp3.baidu.com/tr?url=http://211.157.21.210:8088/eagle/process.jsp","ring.asp")

TheBody=Replace(TheBody,"music=<font style=color:#e10900>","music=")
TheBody=Replace(TheBody,"</font>  "" target=""play""",""" target=""_blank""")
TheBody=Replace(TheBody," onclick=""return ow(this);""","")
TheBody=Replace(TheBody," onclick=""return or(this);""","")
TheBody=Replace(TheBody," onclick=""return ow(this)""","")
TheBody=Replace(TheBody," onclick=""return or(this)""","")

Response.Write TheBody
Response.Write ThiePageM

End Sub
'======ͷ��=======
Sub ShowHead()%>
<html>
<head>
<title><%=keyword%> ��� - ������MP3��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="<%=title%>">
<LINK href="css.css" rel=stylesheet type=text/css>
</head>
<body>
<div id="top">
<div id="topl"><h1><%if keyword="" then
Response.Write(title)
else
Response.Write(keyword)
end if%> ���</h1></div>
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
<!--#include file="lrc.asp"-->
<%End Sub
'======β��======
Sub ShowBot()%>
<!-- #include file="but.asp"-->
</body>
</html>
<%
End Sub
Call ShowHead()
Call ShowBot()%>