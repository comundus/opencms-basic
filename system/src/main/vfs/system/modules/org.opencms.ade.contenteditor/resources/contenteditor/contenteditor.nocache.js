function contenteditor(){var R='',zb='" for "gwt:onLoadErrorFn"',xb='" for "gwt:onPropertyErrorFn"',kb='"><\/script>',_='#',Hb='&',nc='../../editors/tinymce/jscripts/tinymce/tinymce.min.js',oc='../../editors/tinymce/jscripts/tinymce/tinymce.min.js"><\/script>',kc='../org.opencms.ade.contenteditor.scripts.js',mc='../org.opencms.ade.contenteditor.scripts.js"><\/script>',hc='.cache.html',bb='/',nb='//',$b='9897BC8F33AB2B603B96EE9339CCFA19',gc=':',_b=':1',bc=':2',rb='::',pc='<script defer="defer">contenteditor.onInjectionDone(\'contenteditor\')<\/script>',jb='<script id="',lc='<script language="javascript" src="',ub='=',ab='?',cc='A72C7862C1D1E4F4ADAC6FEA6A62B224',dc='AC627B6273E919D1CA1816F10DB17B20',ec='AEB09134DDB06801C37A3C75EDA0CBBF',wb='Bad handler "',fc='D9B528334FCF83ADDA1ACCA3C1EC6D59',jc='DOMContentLoaded',ic='No permutaion available for your browser.',lb='SCRIPT',Kb='Unexpected exception in locale detection, using default: ',Jb='_',Ib='__gwt_Locale',ib='__gwt_marker_contenteditor',mb='base',eb='baseUrl',V='begin',U='bootstrap',db='clear.cache.gif',tb='content',S='contenteditor',gb='contenteditor.nocache.js',qb='contenteditor::',Zb='de',Fb='en',$='end',Tb='gecko',Ub='gecko1_8',W='gwt.codesvr=',X='gwt.hosted=',Y='gwt.hybrid',yb='gwt:onLoadErrorFn',vb='gwt:onPropertyErrorFn',sb='gwt:property',Xb='hosted.html?contenteditor',Sb='ie6',Rb='ie8',Qb='ie9',Ab='iframe',cb='img',ac='it',Bb="javascript:''",Wb='loadExternalRefs',Eb='locale',Gb='locale=',ob='meta',Db='moduleRequested',Z='moduleStartup',Pb='msie',pb='name',Mb='opera',Cb='position:absolute;width:0;height:0;border:none',Ob='safari',fb='script',Yb='selectingPermutation',T='startup',hb='undefined',Vb='unknown',Lb='user.agent',Nb='webkit';var m=window,n=document,o=m.__gwtStatsEvent?function(a){return m.__gwtStatsEvent(a)}:null,p=m.__gwtStatsSessionId?m.__gwtStatsSessionId:null,q,r,s,t=R,u={},v=[],w=[],x=[],y=0,z,A;o&&o({moduleName:S,sessionId:p,subSystem:T,evtGroup:U,millis:(new Date).getTime(),type:V});if(!m.__gwt_stylesLoaded){m.__gwt_stylesLoaded={}}if(!m.__gwt_scriptsLoaded){m.__gwt_scriptsLoaded={}}function B(){var b=false;try{var c=m.location.search;return (c.indexOf(W)!=-1||(c.indexOf(X)!=-1||m.external&&m.external.gwtOnLoad))&&c.indexOf(Y)==-1}catch(a){}B=function(){return b};return b}
function C(){if(q&&r){var b=n.getElementById(S);var c=b.contentWindow;if(B()){c.__gwt_getProperty=function(a){return I(a)}}contenteditor=null;c.gwtOnLoad(z,S,t,y);o&&o({moduleName:S,sessionId:p,subSystem:T,evtGroup:Z,millis:(new Date).getTime(),type:$})}}
function D(){function e(a){var b=a.lastIndexOf(_);if(b==-1){b=a.length}var c=a.indexOf(ab);if(c==-1){c=a.length}var d=a.lastIndexOf(bb,Math.min(c,b));return d>=0?a.substring(0,d+1):R}
function f(a){if(a.match(/^\w+:\/\//)){}else{var b=n.createElement(cb);b.src=a+db;a=e(b.src)}return a}
function g(){var a=G(eb);if(a!=null){return a}return R}
function h(){var a=n.getElementsByTagName(fb);for(var b=0;b<a.length;++b){if(a[b].src.indexOf(gb)!=-1){return e(a[b].src)}}return R}
function i(){var a;if(typeof isBodyLoaded==hb||!isBodyLoaded()){var b=ib;var c;n.write(jb+b+kb);c=n.getElementById(b);a=c&&c.previousSibling;while(a&&a.tagName!=lb){a=a.previousSibling}if(c){c.parentNode.removeChild(c)}if(a&&a.src){return e(a.src)}}return R}
function j(){var a=n.getElementsByTagName(mb);if(a.length>0){return a[a.length-1].href}return R}
function k(){var a=n.location;return a.href==a.protocol+nb+a.host+a.pathname+a.search+a.hash}
var l=g();if(l==R){l=h()}if(l==R){l=i()}if(l==R){l=j()}if(l==R&&k()){l=e(n.location.href)}l=f(l);t=l;return l}
function E(){var b=document.getElementsByTagName(ob);for(var c=0,d=b.length;c<d;++c){var e=b[c],f=e.getAttribute(pb),g;if(f){f=f.replace(qb,R);if(f.indexOf(rb)>=0){continue}if(f==sb){g=e.getAttribute(tb);if(g){var h,i=g.indexOf(ub);if(i>=0){f=g.substring(0,i);h=g.substring(i+1)}else{f=g;h=R}u[f]=h}}else if(f==vb){g=e.getAttribute(tb);if(g){try{A=eval(g)}catch(a){alert(wb+g+xb)}}}else if(f==yb){g=e.getAttribute(tb);if(g){try{z=eval(g)}catch(a){alert(wb+g+zb)}}}}}}
function F(a,b){return b in v[a]}
function G(a){var b=u[a];return b==null?null:b}
function H(a,b){var c=x;for(var d=0,e=a.length-1;d<e;++d){c=c[a[d]]||(c[a[d]]=[])}c[a[e]]=b}
function I(a){var b=w[a](),c=v[a];if(b in c){return b}var d=[];for(var e in c){d[c[e]]=e}if(A){A(a,d,b)}throw null}
var J;function K(){if(!J){J=true;var a=n.createElement(Ab);a.src=Bb;a.id=S;a.style.cssText=Cb;a.tabIndex=-1;n.body.appendChild(a);o&&o({moduleName:S,sessionId:p,subSystem:T,evtGroup:Z,millis:(new Date).getTime(),type:Db});a.contentWindow.location.replace(t+M)}}
w[Eb]=function(){var b=null;var c=Fb;try{if(!b){var d=location.search;var e=d.indexOf(Gb);if(e>=0){var f=d.substring(e+7);var g=d.indexOf(Hb,e);if(g<0){g=d.length}b=d.substring(e+7,g)}}if(!b){b=G(Eb)}if(!b){b=m[Ib]}if(b){c=b}while(b&&!F(Eb,b)){var h=b.lastIndexOf(Jb);if(h<0){b=null;break}b=b.substring(0,h)}}catch(a){alert(Kb+a)}m[Ib]=c;return b||Fb};v[Eb]={de:0,'default':1,en:2,it:3};w[Lb]=function(){var b=navigator.userAgent.toLowerCase();var c=function(a){return parseInt(a[1])*1000+parseInt(a[2])};if(function(){return b.indexOf(Mb)!=-1}())return Mb;if(function(){return b.indexOf(Nb)!=-1}())return Ob;if(function(){return b.indexOf(Pb)!=-1&&n.documentMode>=9}())return Qb;if(function(){return b.indexOf(Pb)!=-1&&n.documentMode>=8}())return Rb;if(function(){var a=/msie ([0-9]+)\.([0-9]+)/.exec(b);if(a&&a.length==3)return c(a)>=6000}())return Sb;if(function(){return b.indexOf(Tb)!=-1}())return Ub;return Vb};v[Lb]={gecko1_8:0,ie6:1,ie8:2,ie9:3,opera:4,safari:5};contenteditor.onScriptLoad=function(){if(J){r=true;C()}};contenteditor.onInjectionDone=function(){q=true;o&&o({moduleName:S,sessionId:p,subSystem:T,evtGroup:Wb,millis:(new Date).getTime(),type:$});C()};E();D();var L=null;var M;if(B()){if(m.external&&(m.external.initModule&&m.external.initModule(S))){m.location.reload();return}M=Xb;L=R}o&&o({moduleName:S,sessionId:p,subSystem:T,evtGroup:U,millis:(new Date).getTime(),type:Yb});if(!B()){try{H([Zb,Mb],$b);H([Fb,Mb],$b+_b);H([ac,Mb],$b+bc);H([Zb,Ob],cc);H([Fb,Ob],cc+_b);H([ac,Ob],cc+bc);H([Zb,Ub],dc);H([Fb,Ub],dc+_b);H([ac,Ub],dc+bc);H([Zb,Qb],ec);H([Fb,Qb],ec+_b);H([ac,Qb],ec+bc);H([Zb,Rb],fc);H([Fb,Rb],fc+_b);H([ac,Rb],fc+bc);L=x[I(Eb)][I(Lb)];var N=L.indexOf(gc);if(N!=-1){y=Number(L.substring(N+1));L=L.substring(0,N)}M=L+hc}catch(a){var O=typeof CMS_NO_PERMUTATION_MESSAGE!=hb?CMS_NO_PERMUTATION_MESSAGE:ic;alert(O);return}}var P;function Q(){if(!s){s=true;C();if(n.removeEventListener){n.removeEventListener(jc,Q,false)}if(P){clearInterval(P)}}}
if(n.addEventListener){n.addEventListener(jc,function(){K();Q()},false)}var P=setInterval(function(){if(/loaded|complete/.test(n.readyState)){K();Q()}},50);o&&o({moduleName:S,sessionId:p,subSystem:T,evtGroup:U,millis:(new Date).getTime(),type:$});o&&o({moduleName:S,sessionId:p,subSystem:T,evtGroup:Wb,millis:(new Date).getTime(),type:V});if(!__gwt_scriptsLoaded[kc]){__gwt_scriptsLoaded[kc]=true;document.write(lc+t+mc)}if(!__gwt_scriptsLoaded[nc]){__gwt_scriptsLoaded[nc]=true;document.write(lc+t+oc)}n.write(pc)}
contenteditor();