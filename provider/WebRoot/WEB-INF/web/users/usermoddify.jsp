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
<table width="98%" align="center" cellspacing="0">
  <tr> 
    <td colspan="2"background="image/ssl_45.gif" class="bk">&nbsp;&nbsp;&nbsp;账户管理-用户信息管理</td>
  </tr>
  <form name="formf" method="post" action="control/admin/account/usermoddify">
  <tr align="left"> 
    <td class="bk2f">
	  用户:
      <input type="text" name="fun"size="8">
	  代理:
      <input type="text" name="daili"size="8">
      <input type="submit" name="Submit2" value="查找">	
	  <input type="submit" name="reg" value="按注册排列">
	  <input type="submit" name="money" value="按代理排列">
	  <input type="submit" name="name" value="按名字排列">
	  <input type="submit" name="emailid" value="申请邮箱解锁"></td>
  </tr>
  </form>
</table>
<table width="98%" align="center" cellspacing="0">
  <tr align="center" bgcolor="#FFCC66"> 
    <td width="10%" bgcolor="#dbe0ee" class="bk2">用户</td>
    <td width="6%" bgcolor="#dbe0ee" class="bk2">代理</td>
    <td width="6%" bgcolor="#dbe0ee" class="bk2">冻结</td>
    <td width="6%" bgcolor="#dbe0ee" class="bk2">锁定</td>
    <td width="11%" bgcolor="#dbe0ee" class="bk2">QQ</td>
    <td width="8%" bgcolor="#dbe0ee" class="bk2">姓名</td>
    <td width="8%" bgcolor="#dbe0ee" class="bk2">地区</td>
	<td width="11%" bgcolor="#dbe0ee" class="bk2">银行</td>
	<td width="14%" bgcolor="#dbe0ee" class="bk2">卡号</td>
	<td width="13%" bgcolor="#dbe0ee" class="bk2">邮箱 </td>
    <td width="7%" bgcolor="#dbe0ee" class="bk2f">操作</td>
  </tr>
  <c:forEach items="${list}" var="one" varStatus="vs">
  <tr > 
    <td height="22" class="bk2">&nbsp;<a href="usermoddifydetail.asp?id=${one.id}">${one.username}</a></td>
    <td align="center" class="bk2">
   <c:choose>
      <c:when test="${one.daili==4}">
      代理
      </c:when>
      <c:otherwise>
      会员
	</c:otherwise>
	</c:choose>
</td>
    <td align="center" class="bk2">
    <c:choose>
      <c:when test="${one.lock==1}">
     冻结
      </c:when>
      <c:otherwise>
      正常
	</c:otherwise>
	</c:choose>
    
    </td>
    <td align="center" class="bk2">
    <c:choose>
      <c:when test="${one.islock==1}">
    锁定
      </c:when>
      <c:otherwise>
      空闲
	</c:otherwise>
	</c:choose>
	</td>	
    <td align="center" class="bk2">&nbsp;${one.qq}</td>
    <td align="center" class="bk2">&nbsp;${one.bankName}</td>
	<td align="center" class="bk2">&nbsp;${one.bankArea}</td>
	<td align="center" class="bk2">&nbsp;${one.bankBank}</td>
	<td align="center" class="bk2">&nbsp;${one.bankNum}</td>
	<td align="center" class="bk2">&nbsp;${one.email}</td>
    <td align="center" class="bk2f"> &nbsp;
     <c:choose>
      <c:when test="${one.username==admin}">
    锁定
      </c:when>
      <c:otherwise>
 <a Href="control/admin/account/usermoddify_del?id=${one.id}" onClick="return confirm(' 您确定要删除吗？');">删除</a>
	</c:otherwise>
	</c:choose>
	</td>
  
  </tr>
</c:forEach>
  <tr align="center"> 
    <td height="30" colspan="15" class="bk2f">
<a href="control/admin/account/usermoddify?Page=${page.pagePreviou}&regfrom=${regfrom}&username=${username}">上一页</a>
<a href="control/admin/account/usermoddify?Page=${page.pageNext}&regfrom=${regfrom}&username=${username}">下一页</a>
	当前 ${page.currentPage}页共${page.totalPage}页
  	</td>
  </tr>

</table>
<br>
<br>

 <FIELDSET class=setlink>
          

<table width="80%" align="center" cellspacing="0">
   <tr align="center"> <td height="30">
   <a href="control/admin/account/uppass">批量初始化提款密码</a>（此功能是将每个会员的提款密码设为与登陆密码一致）
</td>
  </tr>
</table>
<hr align="center" width="90%" size="1" noshade>
<br>

<table width="80%" align="center" cellspacing="0"><form name="MY_form" method="post" action="control/admin/account/uppass">
   <tr align="center"> <td height="30" align="center">会员名
       <select name="username"  >
        <c:forEach items="${list}" var="one" varStatus="vs">
         <option value="${one.username}">${one.username}</option>
         </c:forEach>
        </select>
      <input type="submit" name="Submit22" value="重设提款密码"></td>
    </tr>
   <tr align="center"> <td height="30">
<label><br>
        </label>（此功能是将某个会员的提款密码设为与登陆密码一致）
</td>
  </tr></form>
</table>
</FIELDSET>

</body>
</html>