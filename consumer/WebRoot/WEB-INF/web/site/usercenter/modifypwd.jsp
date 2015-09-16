<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie67 ie678 ie6789" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie67 ie678 ie6789 ie7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie678 ie6789 ie8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie6789 ie9" lang="en"><![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
  <!--<![endif]-->
<head>
<jsp:include page="../common/resource.jsp"></jsp:include>
 <title>找回密码</title>
  <script type="text/javascript">
 
  function sub(){
	  if($("#passwd").val()==null || $("#passwd").val()==''){
		  alert("请填写密码");
		  return;
	  }
	  if($("#confirmpasswd").val()==null || $("#confirmpasswd").val()==''){
		  alert("请确认密码");
		  return;
	  }
	  if($("#confirmpasswd").val() != $("#passwd").val()){
		  alert("两次密码输入不一致");
		  return;
	  }
	  ajaxRequest("/uc/sureModi",{"newpwd":$("#confirmpasswd").val()},"post",resultHandler);
  }
  
  function resultHandler(data){
	  alert(data.msg);
  }
  
  </script>

</head>
<body>
<center>
<form action="/uc/sureModi"  method="get" id="sureModi">
       <input type="hidden" name="syscode" value="${syscode}" />   
         新密码：<input type="text" id="passwd"  name="syscode"  /><br>
        确认密码：<input type="text" id="confirmpasswd" name="newpwd"  /><br>
       <input type="button" onclick="sub();" value="找回密码" />
</form>
</center>
</body>