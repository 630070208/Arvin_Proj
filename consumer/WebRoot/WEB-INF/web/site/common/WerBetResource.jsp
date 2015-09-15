<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--[if IE ]>
      <link rel="stylesheet" type="text/css" href="/wer/css/ie-base.css?b64" media="screen" />
      <link rel="stylesheet" type="text/css" href="/wer/css/ie-component-1.css?b64" media="screen" />
      <link rel="stylesheet" type="text/css" href="/wer/css/ie-component-2.css?b64" media="screen" />
     <![endif]-->
    
    <!--[if lt IE 9]>
    	<script type="text/javascript" src="/site/js/html5.js?r=<%=new Random().nextInt() %>"></script>
     <![endif]-->
     <script type="text/javascript" src="https://a1s.unicdn.net/static/3.0.2.417.4/js/odyssey/cms/cms.js?r=<%=new Random().nextInt() %>"></script>
    <!--[if !IE]><!--><script>
      if (/*@cc_on!@*/false) {
      	document.documentElement.className+=' ie10';
      }
    </script><!--<![endif]-->

	<link rel="icon" href="${pageContext.request.contextPath }/wer/imgs/favicon.ico" type="image/x-icon" />
	<link rel="Shortcut Icon" href="${pageContext.request.contextPath }/wer/imgs/favicon.ico?r=<%=new Random().nextInt() %>">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/wer/css/lottery_nav.css?r=<%=new Random().nextInt() %>">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/wer/css/bet.css?r=<%=new Random().nextInt() %>">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/wer/css/wer.css?r=<%=new Random().nextInt() %>">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/wer/css/jquery-ui-1.9.2.custom.css?r=<%=new Random().nextInt() %>">
    <!--[if !(IE)]><!-->
    <link rel="stylesheet" type="text/css" href="/wer/css/unibet.css" media="screen" />
    <!--<![endif]-->
    
	<script src="${pageContext.request.contextPath }/site/js/utils/SysUtil.js?r=<%=new Random().nextInt() %>"></script>
	<script src="${pageContext.request.contextPath }/site/jquery/jquery-1.9.1.min.js?r=<%=new Random().nextInt() %>"></script>
	<script src="${pageContext.request.contextPath }/site/jquery/jquery-ui-1.9.2.custom.min.js?r=<%=new Random().nextInt() %>"></script>
	<script src="${pageContext.request.contextPath }/site/layer/layer.min.js?r=<%=new Random().nextInt() %>"></script> 
	<script src="${pageContext.request.contextPath }/site/js/utils/MathUtil.js?r=<%=new Random().nextInt() %>"></script>
	<script src="${pageContext.request.contextPath }/js/common/ajax_request.js?r=<%=new Random().nextInt() %>"></script>
	
	<script src="${pageContext.request.contextPath }/site/js/Ball.js?r=<%=new Random().nextInt() %>"></script>
	<script src="${pageContext.request.contextPath }/site/js/PlayType.js?r=<%=new Random().nextInt() %>"></script>
	<script src="${pageContext.request.contextPath }/site/js/HtmlCreater.js?r=<%=new Random().nextInt() %>"></script>
	<script src="${pageContext.request.contextPath }/site/js/Pick.js?r=<%=new Random().nextInt() %>"></script>
	<script src="${pageContext.request.contextPath }/site/js/money/ajaxMemberMoney.js?r=<%=new Random().nextInt() %>"></script>
<script>
$(function(){
	var url = location.href;
	if(url.indexOf("cqssc")>-1){$("#cqssc").addClass("active");}
	if(url.indexOf("jxssc")>-1){$("#jxssc").addClass("active");}
	if(url.indexOf("xjssc")>-1){$("#xjssc").addClass("active");}
	if(url.indexOf("klsf")>-1){$("#klsf").addClass("active");}
	if(url.indexOf("jsk3")>-1){$("#jsk3").addClass("active");}
	if(url.indexOf("bjkl8")>-1){$("#bjkl8").addClass("active");}
	if(url.indexOf("cq115")>-1){$("#cq115").addClass("active");}
	if(url.indexOf("gd115")>-1){$("#gd115").addClass("active");}
	if(url.indexOf("sd115")>-1){$("#sd115").addClass("active");}
	if(url.indexOf("fc3d")>-1){$("#fc3d").addClass("active");}
	if(url.indexOf("pl3")>-1){$("#pl3").addClass("active");}
})
</script> 
<script>
	function addfavorite(){
		try{ 
			window.external.AddFavorite('http://localhost/login','玩儿彩在线'); 
		} catch(e){
	 		(window.sidebar)?window.sidebar.addPanel('玩儿彩在线','http://localhost/login',''):alert('请使用按键 Ctrl+d，玩儿彩在线'); 
	 	}
	}
</script>
<script language="JavaScript">  
    <!--  
function testing()  
{  
    var OsObject = "";  
   if(navigator.userAgent.indexOf("MSIE")>0) {  
        return "MSIE";  
   }  
   if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){  
        return "Firefox";  
   }  
   if(isSafari=navigator.userAgent.indexOf("Safari")>0) {  
        return "Safari";  
   }   
   if(isCamino=navigator.userAgent.indexOf("Camino")>0){  
        return "Camino";  
   }  
   if(isMozilla=navigator.userAgent.indexOf("Gecko/")>0){  
        return "Gecko";  
   }  
 alert("您的浏览器类型为:"+getOs());  
    
}  
    -->  
</script> 
