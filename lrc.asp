<%ThePage="http://mp3.baidu.com/m?tn=baidump3lyric&word="&keyword&"&ct=150994944&lm=-1&lf=3&pn="&Page
TheThie=GetPage(ThePage)
TheBody=GetContent(TheThie,"<div class=""pad10L"">","<div class=""pg"">",0)
ThiePageM=GetContent(TheThie,"<div class=""pg"">","</div>",0)
if TheBody="" then
Response.Write "<br>抱歉，没有找到与“"&keyword&"”相关的内容。<br><br>"
exit sub
End if
TheBody=Replace(TheBody,"<div style=""background-color:white; z-index:10;position:relative;width:75%"">","<div id=""lrc"">")
TheBody=Replace(TheBody,"<div class=""BlueBG"">","<div id=""lrctit"">")
TheBody=Replace(TheBody,"http://mp3.baidu.com/m?tn=baidump3&ct=134217728&lm=-1&word=","c.asp?w=")
TheBody=Replace(TheBody,"<div class=""unnamed3"" style=""float:right;width:240px;padding:5px;margin-right:10px;line-height:30px"">","<div id=""lrcr"">")
Set Re=new RegExp
Re.Global = True
Re.Pattern="<span style=""font-size:12px;"">.+?</span>"
TheBody=Re.Replace(TheBody,"·<a href=""http://163.com/"" target=""_blank"">网易新闻</a>")
Re.Pattern="<span class=""tiny"".+?m\?word=(.+?)&lm=.+?>(.+?)</a>"
TheBody=Re.Replace(TheBody,"·<a href=""c.asp?w=$1"">$2</a>")
Re.Pattern="<span>.+?<br>"
TheBody=Re.Replace(TheBody,"")
Re.Pattern="\s*?<img src=""http://list.mp3.baidu.com.+?</a>\s*?</div>"
TheBody=Re.Replace(TheBody,"·<a href=""ring.asp?word="&keyword&""" target=""_blank""><font style=color:#e10900>"&keyword&"</font>手机铃声下载</a></div>")
Re.Pattern="<a href=http:\/\/mp3.baidu.com\/m\?.+?&word=(.+?)&pn=(.+?)>"
ThiePageM=Re.Replace(ThiePageM,"<a href=""?word=$1&t=1&p=$2"">")
Set Re=Nothing
while instr(TheBody,"<br><br><br>")
TheBody=Replace(TheBody,"<br><br><br>","<br><br>")
wend
ThiePageM=Replace(ThiePageM,"<font>上一页</font>","上一页")
ThiePageM=Replace(ThiePageM,"<font>下一页</font>","下一页")
Response.Write TheBody
Response.Write ThiePageM%>