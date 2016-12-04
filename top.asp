
<div id="top">
<div id="topl"><h1><%if keyword="" then
Response.Write(title)
else
Response.Write(keyword)
end if%>在线试听</h1></div>
<a href=# onClick="window.external.AddFavorite(document.location.href,document.title)">收藏本页</a> | <a href=# 
onclick="this.style.behavior='url(#default#homepage)';this.setHomePage(document.location.href);">设为首页</a>
</div>
<div id="logo">
<ul>
<li><a href="mp3songname.asp">歌曲名称</a></li>
<li><a href="mp3new100.asp">最新歌曲</a></li>
<li><a href="mp3hot500.asp">最热歌曲</a></li>
<li><a href="mp3topsinger.asp">歌手排行</a></li>
<li><a href="mp3movie.asp">电影歌曲</a></li>
<li><a href="mp3oldsong.asp">老歌回忆</a></li>
<li><a href="mp3tv.asp">电视歌曲</a></li>
<li><a href="mp3singer.asp">歌手列表</a></li>
<li><a href="mp3tagther.asp">情歌对唱</a></li>
<li><a href="mp3DJ.asp">热门舞曲</a></li>
</ul>
<ul>
<li><a href="mp3minge.asp">民歌精选</a></li>
<li><a href="mp3xy.asp">校园歌曲</a></li>
<li><a href="mp3army.asp">军旅歌曲</a></li>
<li><a href="mp3xs.asp">相声精选</a></li>
<li><a href="mp3xiaopin.asp">小品荟萃</a></li>
<li><a href="mp3quyi.asp">曲艺杂谈</a></li>
<li><a href="mp3qingyinyue.asp">轻音乐集</a></li>
<li><a href="mp3minyue.asp">中国民乐</a></li>
<li><a href="mp3ertong.asp">儿童歌曲</a></li>
<li><a href="index.asp">返回首页</a></li>
</ul>
</div>
<div id="sobg">
<form action="c.asp" name="SoForm">
<INPUT name="<%=key1%>" value="<%=keyword%>" size="60">
<input type=submit value=" 搜索 ">
<br>
<input name="<%=key2%>" type="radio" value="2" <%if (sotype<>3 and sotype<>4 and sotype<>5 and sotype<>6 and sotype<>7) then%>checked<%end if%>>全部音乐 
<input name="<%=key2%>" type="radio" value="3" class="button" <%if sotype=3 then%>checked<%end if%>>mp3
<input name="<%=key2%>" type="radio" value="4" class="button" <%if sotype=4 then%>checked<%end if%>>rm
<input name="<%=key2%>" type="radio" value="5" class="button" <%if sotype=5 then%>checked<%end if%>>wma
<input name="<%=key2%>" type="radio" value="6" class="button" <%if sotype=6 then%>checked<%end if%>>flash
<input name="<%=key2%>" type="radio" value="7" class="button" <%if sotype=7 then%>checked<%end if%>>其它
</div></form>
<iframe width=760 height=60 src="diaoyong2.htm" frameborder=no marginwidth=0 marginheight=0 scrolling=no></iframe>