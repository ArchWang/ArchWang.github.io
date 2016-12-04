<!-- #include file="incGB.asp" -->
<!-- #include file="config.inc" -->
<%
Server.ScriptTimeOut=9999999
on error resume next 
dim id
id = Trim(request("id"))

if id = empty then id = "A"
url = "http://list.mp3.baidu.com/song/"& id &".htm"

ComStr = GetPage(url)
if err.number=0 then

showinfo = GetContent(Comstr,"</iframe>","<div align=""right"">",0)
Set Re=new RegExp
Re.Global = True
Re.Pattern="([A-Z]).htm"
showinfo =Re.Replace(showinfo,"?id=$1")  
Re.Pattern="<a href=""(\S+?)_somp3.htm"" target=_blank>(\S+?)</a>"
showinfo =Re.Replace(showinfo,"<a href="""& path & listfilename &"?"& key1 &"=$2"" target=_blank>$2</a>")
showinfo=replace(showinfo,"<a href=""0.htm"" class=""LinkLe"">其他</a>","")
Set Re=Nothing
end if

%>
<HTML>
<HEAD>
<TITLE>二度网MP3搜索引擎 - 部分歌曲列表</TITLE>
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

.border {font-size: 14px;padding-right: 10px; width: 25%; background: #fff; height: 28px;}

body,td,th {
	font-family: 宋体;
}
#TabLt td {font-family:"Arial";}			
.LinkLe {font-size:14px;padding-right: 10px;}	

/*#Tleft { DISPLAY: inline; VERTICAL-ALIGN: top; WIDTH: 300px; TEXT-ALIGN: left;}
#Tright { DISPLAY: inline; VERTICAL-ALIGN: middle; WIDTH: 460px; TEXT-ALIGN: right; padding-top:10px;padding-right:10px;}*/
#title { WIDTH: 770px; TEXT-ALIGN: left;)

</STYLE>
<BODY>
<!-- #include file="top.asp"-->
	<DIV id="title">
		<DIV><%=showinfo%></DIV>
	</DIV>
<!-- #include file="but.asp"-->
</body>
</html>