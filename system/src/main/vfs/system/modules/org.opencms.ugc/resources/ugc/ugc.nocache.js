function ugc(){var V='',Db='" for "gwt:onLoadErrorFn"',Bb='" for "gwt:onPropertyErrorFn"',ob='"><\/script>',db='#',Lb='&',kc='.cache.html',fb='/',rb='//',bc='892485F0107067B728AF57C09853B4A6',jc=':',cc=':1',ec=':2',vb='::',nc='<script defer="defer">ugc.onInjectionDone(\'ugc\')<\/script>',nb='<script id="',yb='=',eb='?',fc='A82F2FF24393648C38DCD458329FE686',Ab='Bad handler "',gc='D29782D1C79A6D62FCB2FA55418E72FD',hc='D4AF8BECC23B3A1E0313D647EB7CA8B7',mc='DOMContentLoaded',ic='F0BC46AE5FFF4259C429F126132FBE74',lc='No permutaion available for your browser.',pb='SCRIPT',Ob='Unexpected exception in locale detection, using default: ',Nb='_',Mb='__gwt_Locale',mb='__gwt_marker_ugc',qb='base',ib='baseUrl',Z='begin',Y='bootstrap',hb='clear.cache.gif',xb='content',ac='de',Jb='en',cb='end',Wb='gecko',Xb='gecko1_8',$='gwt.codesvr=',_='gwt.hosted=',ab='gwt.hybrid',Cb='gwt:onLoadErrorFn',zb='gwt:onPropertyErrorFn',wb='gwt:property',$b='hosted.html?ugc',Tb='ie10',Vb='ie8',Ub='ie9',Eb='iframe',gb='img',dc='it',Fb="javascript:''",Zb='loadExternalRefs',Ib='locale',Kb='locale=',sb='meta',Hb='moduleRequested',bb='moduleStartup',Sb='msie',tb='name',Gb='position:absolute;width:0;height:0;border:none',Rb='safari',jb='script',_b='selectingPermutation',X='startup',W='ugc',kb='ugc.nocache.js',ub='ugc::',lb='undefined',Yb='unknown',Pb='user.agent',Qb='webkit';var m=window,n=document,o=m.__gwtStatsEvent?function(a){return m.__gwtStatsEvent(a)}:null,p=m.__gwtStatsSessionId?m.__gwtStatsSessionId:null,q,r,s,t=V,u={},v=[],w=[],A=[],B=0,C,D;o&&o({moduleName:W,sessionId:p,subSystem:X,evtGroup:Y,millis:(new Date).getTime(),type:Z});if(!m.__gwt_stylesLoaded){m.__gwt_stylesLoaded={}}if(!m.__gwt_scriptsLoaded){m.__gwt_scriptsLoaded={}}function F(){var b=false;try{var c=m.location.search;return (c.indexOf($)!=-1||(c.indexOf(_)!=-1||m.external&&m.external.gwtOnLoad))&&c.indexOf(ab)==-1}catch(a){}F=function(){return b};return b}
function G(){if(q&&r){var b=n.getElementById(W);var c=b.contentWindow;if(F()){c.__gwt_getProperty=function(a){return M(a)}}ugc=null;c.gwtOnLoad(C,W,t,B);o&&o({moduleName:W,sessionId:p,subSystem:X,evtGroup:bb,millis:(new Date).getTime(),type:cb})}}
function H(){function e(a){var b=a.lastIndexOf(db);if(b==-1){b=a.length}var c=a.indexOf(eb);if(c==-1){c=a.length}var d=a.lastIndexOf(fb,Math.min(c,b));return d>=0?a.substring(0,d+1):V}
function f(a){if(a.match(/^\w+:\/\//)){}else{var b=n.createElement(gb);b.src=a+hb;a=e(b.src)}return a}
function g(){var a=K(ib);if(a!=null){return a}return V}
function h(){var a=n.getElementsByTagName(jb);for(var b=0;b<a.length;++b){if(a[b].src.indexOf(kb)!=-1){return e(a[b].src)}}return V}
function i(){var a;if(typeof isBodyLoaded==lb||!isBodyLoaded()){var b=mb;var c;n.write(nb+b+ob);c=n.getElementById(b);a=c&&c.previousSibling;while(a&&a.tagName!=pb){a=a.previousSibling}if(c){c.parentNode.removeChild(c)}if(a&&a.src){return e(a.src)}}return V}
function j(){var a=n.getElementsByTagName(qb);if(a.length>0){return a[a.length-1].href}return V}
function k(){var a=n.location;return a.href==a.protocol+rb+a.host+a.pathname+a.search+a.hash}
var l=g();if(l==V){l=h()}if(l==V){l=i()}if(l==V){l=j()}if(l==V&&k()){l=e(n.location.href)}l=f(l);t=l;return l}
function I(){var b=document.getElementsByTagName(sb);for(var c=0,d=b.length;c<d;++c){var e=b[c],f=e.getAttribute(tb),g;if(f){f=f.replace(ub,V);if(f.indexOf(vb)>=0){continue}if(f==wb){g=e.getAttribute(xb);if(g){var h,i=g.indexOf(yb);if(i>=0){f=g.substring(0,i);h=g.substring(i+1)}else{f=g;h=V}u[f]=h}}else if(f==zb){g=e.getAttribute(xb);if(g){try{D=eval(g)}catch(a){alert(Ab+g+Bb)}}}else if(f==Cb){g=e.getAttribute(xb);if(g){try{C=eval(g)}catch(a){alert(Ab+g+Db)}}}}}}
function J(a,b){return b in v[a]}
function K(a){var b=u[a];return b==null?null:b}
function L(a,b){var c=A;for(var d=0,e=a.length-1;d<e;++d){c=c[a[d]]||(c[a[d]]=[])}c[a[e]]=b}
function M(a){var b=w[a](),c=v[a];if(b in c){return b}var d=[];for(var e in c){d[c[e]]=e}if(D){D(a,d,b)}throw null}
var N;function O(){if(!N){N=true;var a=n.createElement(Eb);a.src=Fb;a.id=W;a.style.cssText=Gb;a.tabIndex=-1;n.body.appendChild(a);o&&o({moduleName:W,sessionId:p,subSystem:X,evtGroup:bb,millis:(new Date).getTime(),type:Hb});a.contentWindow.location.replace(t+Q)}}
w[Ib]=function(){var b=null;var c=Jb;try{if(!b){var d=location.search;var e=d.indexOf(Kb);if(e>=0){var f=d.substring(e+7);var g=d.indexOf(Lb,e);if(g<0){g=d.length}b=d.substring(e+7,g)}}if(!b){b=K(Ib)}if(!b){b=m[Mb]}if(b){c=b}while(b&&!J(Ib,b)){var h=b.lastIndexOf(Nb);if(h<0){b=null;break}b=b.substring(0,h)}}catch(a){alert(Ob+a)}m[Mb]=c;return b||Jb};v[Ib]={de:0,'default':1,en:2,it:3};w[Pb]=function(){var b=navigator.userAgent.toLowerCase();var c=function(a){return parseInt(a[1])*1000+parseInt(a[2])};if(function(){return b.indexOf(Qb)!=-1}())return Rb;if(function(){return b.indexOf(Sb)!=-1&&n.documentMode>=10}())return Tb;if(function(){return b.indexOf(Sb)!=-1&&n.documentMode>=9}())return Ub;if(function(){return b.indexOf(Sb)!=-1&&n.documentMode>=8}())return Vb;if(function(){return b.indexOf(Wb)!=-1}())return Xb;return Yb};v[Pb]={gecko1_8:0,ie10:1,ie8:2,ie9:3,safari:4};ugc.onScriptLoad=function(){if(N){r=true;G()}};ugc.onInjectionDone=function(){q=true;o&&o({moduleName:W,sessionId:p,subSystem:X,evtGroup:Zb,millis:(new Date).getTime(),type:cb});G()};I();H();var P=null;var Q;if(F()){if(m.external&&(m.external.initModule&&m.external.initModule(W))){m.location.reload();return}Q=$b;P=V}o&&o({moduleName:W,sessionId:p,subSystem:X,evtGroup:Y,millis:(new Date).getTime(),type:_b});if(!F()){try{L([ac,Tb],bc);L([Jb,Tb],bc+cc);L([dc,Tb],bc+ec);L([ac,Ub],fc);L([Jb,Ub],fc+cc);L([dc,Ub],fc+ec);L([ac,Vb],gc);L([Jb,Vb],gc+cc);L([dc,Vb],gc+ec);L([ac,Rb],hc);L([Jb,Rb],hc+cc);L([dc,Rb],hc+ec);L([ac,Xb],ic);L([Jb,Xb],ic+cc);L([dc,Xb],ic+ec);P=A[M(Ib)][M(Pb)];var R=P.indexOf(jc);if(R!=-1){B=Number(P.substring(R+1));P=P.substring(0,R)}Q=P+kc}catch(a){var S=typeof CMS_NO_PERMUTATION_MESSAGE!=lb?CMS_NO_PERMUTATION_MESSAGE:lc;alert(S);return}}var T;function U(){if(!s){s=true;G();if(n.removeEventListener){n.removeEventListener(mc,U,false)}if(T){clearInterval(T)}}}
if(n.addEventListener){n.addEventListener(mc,function(){O();U()},false)}var T=setInterval(function(){if(/loaded|complete/.test(n.readyState)){O();U()}},50);o&&o({moduleName:W,sessionId:p,subSystem:X,evtGroup:Y,millis:(new Date).getTime(),type:cb});o&&o({moduleName:W,sessionId:p,subSystem:X,evtGroup:Zb,millis:(new Date).getTime(),type:Z});n.write(nc)}
ugc();