
<div id="top">
<div id="topl"><h1><%if keyword="" then
Response.Write(title)
else
Response.Write(keyword)
end if%>��������</h1></div>
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