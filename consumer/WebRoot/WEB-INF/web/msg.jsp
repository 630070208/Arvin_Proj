<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <script type="text/javascript">
  var msg="${msg}";
  var url="${url}";
  if(msg)
  	alert(msg);
  if(!url)
  	url="/";
  window.location.href="${pageContext.request.contextPath }"+url;
  </script>
</html>
