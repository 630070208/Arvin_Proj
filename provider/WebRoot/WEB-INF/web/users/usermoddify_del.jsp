<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>${GLOBAL_SETTING_WEBNAME}</title>
<base href="<%=basePath%>">
</head>
<style type="text/css">
<!--
.STYLE3 {color: #FFFFFF}
.setlink {
BORDER: #E5E5E5 1px solid;margin-top:5px ;margin-bottom:5px;  width:98%;FONT-SIZE: 12px; COLOR: #000000; FONT-FAMILY: 宋体,arial
}

	

-->
</style>
<link href="css/bg.css" rel="stylesheet" type="text/css">
<link href="css/tu.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet" type="text/css">
<body>
<c:if test="${ok}">
<script>
alert('已成功删除！按确定返回！');
document.location.href='control/admin/account/usermoddify';
</script>
</c:if>
<FORM name=theform onSubmit="return checkLegitimacy()" action='control/admin/account/usermoddify_del' method='post'>
<table width="95%" align="center" cellpadding="1" cellspacing="0">
  <tr> 
    <td class="bk"colspan="2" height="24" background="../image/ssl_45.gif">&nbsp;&nbsp;&nbsp;账户管理-用户信息管理</td>
  </tr>
  <input name="id" type="hidden" value="${id}">
    <tr> 
    <td height="24" align="right" bgcolor="#F2f4f9" class="bk2">验证码:</td>
    <td height="24" class="bk2f">&nbsp;  <input name="yzm" type="text" id="yzm" onKeyUp="this.value=this.value.replace(/\D/gi,'')" size="10" maxlength="4">
    &nbsp;&nbsp;<img src="../Code/Code.asp">  </td>
  </tr>
 <tr> 
    <td height="24" align="center" bgcolor="#F2f4f9" class="bk2">&nbsp;</td>
    <td height="24" class="bk2f">&nbsp; <input type="submit" name="delete" value="确认删除"></td>
  </tr>
</table>
</FORM>

<br>
</body>
</html>