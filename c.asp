<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!-- #include file="incGB.asp" -->
<!-- #include file="config.inc" -->
<%
dim keyrword,sotype,page

keyword = trim(request(key1))
sotype  = request(key2)
page    = request(key3)

if sotype = "" then sotype = "1"
if page<>"" and IsNumeric(page) then
	page=clng(page)
else
	page=1
End if
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
TheBody=Re.Replace(TheBody,"www.zhlm.net/ring.asp?word="&keyword&""" target=_blank>")
Re.Pattern="href=""http:\/\/mp3.baidu.com\/m\?tn=baidump3&ct=.+?word=(.+?)&lm.+?>(.+?)</a>"
TheBody=Re.Replace(TheBody,"href=""?w=$1&t=2"">$2</a>")
Re.Pattern="href=""http:\/\/mp3.baidu.com\/m\?tn=baidump3lyric&word=(.+?)&.+?>(.+?)</a>"
TheBody=Re.Replace(TheBody,"href=""geci.asp?w=$1&t=1"" target=_blank>$2</a> ")
Re.Pattern="<a href=""http:\/\/\S+?\.\S+?\.\S+?\.\S+?\/m\?ct=134217728&tn=baidusg,(.+?)"".+?����.+?>(.+?)</a>"
if download="n" then
TheBody=Re.Replace(TheBody,"<a href=""play.asp?ac=t&music=$1"" target=""play"">$2</a>")
else
TheBody=Re.Replace(TheBody,"<a href=""play.asp?ac=t&music=$1"" target=""play"">$2</a>")
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
<title><%=keyword%> ������������ - ������MP3��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="<%=title%>">
<LINK href="css.css" rel=stylesheet type=text/css>
</head>
<body>
<!-- #include file="top.asp"-->
<%End Sub
'======β��======
Sub ShowBot()%>
<!-- #include file="but.asp"-->
</body>
</html>
<%
End Sub
Call ShowHead()
Call ShowThie()
Call ShowBot()%>