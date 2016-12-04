var lrcO;
var lrcobj;
var offsetc=0;

function lrcClass(tt)
{
  this.inr = [];

  this.oTime = 0;

  this.dts = -1;
  this.dte = -1;
  this.dlt = -1;
  this.ddh;
  this.fjh;

  lrcbc.style.width = 0;

  if(/\[offset\:(\-?\d+)\]/i.test(tt))
    this.oTime = RegExp.$1/1000; 
  tt = tt.replace(/\[\:\][^$\n]*(\n|$)/g,"$1");
  tt = tt.replace(/\[[^\[\]\:]*\]/g,"");
  tt = tt.replace(/\[[^\[\]]*[^\[\]\d]+[^\[\]]*\:[^\[\]]*\]/g,"");
  tt = tt.replace(/\[[^\[\]]*\:[^\[\]]*[^\[\]\d\.]+[^\[\]]*\]/g,"");
  tt = tt.replace(/<[^<>]*[^<>\d]+[^<>]*\:[^<>]*>/g,"");
  tt = tt.replace(/<[^<>]*\:[^<>]*[^<>\d\.]+[^<>]*>/g,"");

  while(/\[[^\[\]]+\:[^\[\]]+\]/.test(tt))
  {
    tt = tt.replace(/((\[[^\[\]]+\:[^\[\]]+\])+[^\[\r\n]*)[^\[]*/,"\n");
    var zzzt = RegExp.$1;
    /^(.+\])([^\]]*)$/.exec(zzzt);
    var ltxt = RegExp.$2;
    var eft = RegExp.$1.slice(1,-1).split("][");
    for(var ii=0; ii<eft.length; ii++)
    {
      var sf = eft[ii].split(":");
      var tse = parseInt(sf[0],10) * 60 + parseFloat(sf[1]);
      var sso = { t:[] , w:[] , n:ltxt }
      sso.t[0] = tse-this.oTime;
      this.inr[this.inr.length] = sso;
    }
  }
  this.inr = this.inr.sort( function(a,b){return a.t[0]-b.t[0];} );

  for(var ii=0; ii<this.inr.length; ii++)
  {
    while(/<[^<>]+\:[^<>]+>/.test(this.inr[ii].n))
    {
      this.inr[ii].n = this.inr[ii].n.replace(/<(\d+)\:([\d\.]+)>/,"%=%");
      var tse = parseInt(RegExp.$1,10) * 60 + parseFloat(RegExp.$2);
      this.inr[ii].t[this.inr[ii].t.length] = tse-this.oTime;
    }
    lrcbc.innerHTML = "<font>"+ this.inr[ii].n.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/%=%/g,"</font><font>") +"</font>";
    var fall = lrcbc.getElementsByTagName("font");
    for(var wi=0; wi<fall.length; wi++)
      this.inr[ii].w[this.inr[ii].w.length] = fall[wi].offsetWidth;
    this.inr[ii].n = lrcbc.innerText;
  }

   this.run = function(tme)
  {
    if(tme<this.dts || tme>=this.dte)
    {
      var ii;
      for(ii=this.inr.length-1; ii>=0 && this.inr[ii].t[0]>tme; ii--){}
      if(ii<0) return;
      this.ddh = this.inr[ii].t;
      this.fjh = this.inr[ii].w;
      this.dts = this.inr[ii].t[0];
      this.dte = (ii<this.inr.length-1)?this.inr[ii+1].t[0]:feiyes_player.currentMedia.duration;
      lrcwt1.innerText = this.retxt(ii-7);
      lrcwt2.innerText = this.retxt(ii-6);
      lrcwt3.innerText = this.retxt(ii-5);
      lrcwt4.innerText = this.retxt(ii-4);
      lrcwt5.innerText = this.retxt(ii-3);
      lrcwt6.innerText = this.retxt(ii-2);
      lrcwt7.innerText = this.retxt(ii-1);
      lrcfilter.innerText = this.retxt(ii-1);
      lrcwt8.innerText = this.retxt(ii+1);
      lrcwt9.innerText = this.retxt(ii+2);
      lrcwt10.innerText = this.retxt(ii+3);
      lrcwt11.innerText = this.retxt(ii+4);
      lrcwt12.innerText = this.retxt(ii+5);
      lrcwt13.innerText = this.retxt(ii+6);
      this.print(this.retxt(ii));
      if(this.dlt==ii-1)
      {
	clearTimeout(lrcO);
	golrcoll(0);
	golrcolor(0);
      }
      this.dlt = ii;
    }
    var bbw = 0;
    var ki;
    for(ki=0; ki<this.ddh.length && this.ddh[ki]<=tme; ki++)
      bbw += this.fjh[ki];
    var kt = ki-1;
    var sc = ((ki<this.ddh.length)?this.ddh[ki]:this.dte) - this.ddh[kt];
    var tc = tme - this.ddh[kt];
    bbw -= this.fjh[kt] - tc / sc * this.fjh[kt];
    if(bbw>lrcbox.offsetWidth)
      bbw = lrcbox.offsetWidth;
    lrcbc.style.width = Math.round(bbw);
  }

  this.retxt = function(i)
  {
    return (i<0 || i>=this.inr.length)?"":this.inr[i].n;
  }

  this.print = function(txt)
  {
    lrcbox.innerText = txt;
    lrcbc.innerText = txt;
  }

  this.print("二度网MP3搜索引擎 www.erdu.com.cn");
  lrcwt1.innerText = "";
  lrcwt2.innerText = "";
  lrcwt3.innerText = "";
  lrcwt4.innerText = "";
  lrcwt5.innerText = "";
  lrcwt6.innerText = "";
  lrcwt7.innerText = "";
  lrcfilter.innerText = "";
  lrcwt8.innerText = "";
  lrcwt9.innerText = "";
  lrcwt10.innerText = "";
  lrcwt11.innerText = "";
  lrcwt12.innerText = "";
  lrcwt13.innerText = "";
}



function golrcoll(s)
{
  lrcoll.style.top = -2-(s++)*3;
  if(s<=6)
    lrcO = setTimeout("golrcoll("+s+")",120);
}

function golrcolor(t)
{
  lrcfilter.filters.alpha.opacity = 100-(t++)*10;
  if(t<=10)
    setTimeout("golrcolor("+t+")",60);
}

function lrcrun(m)
{
  lrcobj = new lrcClass(m);
if(type=="mp") {setInterval("try {lrcobj.run(parent.feiyes_player.controls.currentPosition+offsetc)} catch(hh){}",10);}
if(type=="rp") {setInterval("try {lrcobj.run(parent.feiyes_player.GetPosition()/1000+offsetc)} catch(hh){}",10);}
} 


function offset(s)
{
  if(s==0)
    offsetc = 0;
  else
    offsetc += s*0.5;
offsett.innerText=offsetc;
}


function loadlrc(ar,al,ti)
{
var Mstr;
Mstr=ti;
if (!al==""){ti=al+"-"+Mstr}
if (!ar==""){ti=ar+"-"+Mstr}
//以下不能修改,否则不能显示同步歌词!
Aspxplrc.src="http://lrc.aspxp.net/bmp3js.asp?t=js&music="+Mstr
}



