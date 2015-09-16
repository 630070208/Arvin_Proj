<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<title>${GLOBAL_SETTING_WEBNAME}</title>
<link href="css/bg.css" rel="stylesheet" type="text/css">
<link href="css/tu.css" rel="stylesheet" type="text/css">
<style type="text/css">
div { margin:0px auto; padding:0px;}
.clb { clear:both; }
.title { color:#FF0000; font-size:14px; font-weight:bold; text-align:right; }

.cplevel { float:left; width:100%; margin:10px 0px; }
.nav { width:90%; }
.nav a { padding:5px 15px; font-size:14px; display:block; float:left; color:#FFFFFF; text-decoration:none;  background-color:#eeeeee; border:1px solid #FFFFFF; }
.nav a:visited { color:#333333; }
.nav a:hover { color:#FF0000; background-color:#FFFFFF; border:1px solid #eeeeee; }

/* 信息 */
.levelitem { width:98%; margin-bottom:10px; }
.levelitem td { padding:5px; }
.levelitem td.name { color:#ffffff; font-size:14px; text-align:center; background-color:#DBE0EE; border:1px solid #eeeeee;  }
.levelitem td.name span { float:right; font-size:14px; color:#ffffff ; font-weight:bold; cursor:pointer; }
.levelitem td.left { text-align:right; padding-right:10px; background-color:#F2F2F2; border-left:1px solid #eeeeee; border-right:1px solid #eeeeee; border-bottom:1px solid #eeeeee; }
.levelitem td.right { padding-left:10px; border-right:1px solid #eeeeee; border-bottom:1px solid #eeeeee; }
.levelitem td.right ul li { margin:5px 0px;  }
.levelitem td.right ul li.sp { border-bottom:1px solid #666666; padding:0px 0px 3px 0px; }
.levelitem td.right ul li span { margin:0px 10px; }
span.red { color:#FF0000; }
</style>

</head>
<body>

      <form action="control/admin/account/add" method="post" name="frmAdd" id="frmAdd">
	<input name="id" type="hidden" id="id" value="${id}" />      <div class="cplevel">
                <div class="levelitem">
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
      <td colspan="2" class="name">&nbsp;&nbsp;&nbsp;账户管理-用户信息管理</td>
  </tr>
             <tr> 
         <td class="left" width="100">会员级别</td>
          <td class="right">&nbsp;
          <input type="radio" name="userrole" id="user_role_2" value="4" onChange="showChildCount(this.value)" checked="checked" /><label for="user_role_2" >代理用户</label>&nbsp;&nbsp;
<input type="radio" name="userrole" id="user_role_3" value="0" onChange="showChildCount(this.value)" /><label for="user_role_3" >会员用户</label>&nbsp;&nbsp;</td>
        
        </tr>
               <tr> 
         <td class="left" width="100">
        登录帐户名</td>
           <td class="right">&nbsp;<input type="text" name="username" id="user_name" value="" size="32" maxlength="16" /><span>（由 0-9、a-z、A-Z 组成的6-16个字符）</span></td>
        </tr>
    <tr> 
         <td class="left" width="100">登录密码</td>
            <td class="right">&nbsp;<input type="text" name="passwdword" id="passwd" value="" size="32" maxlength="16" />
            <span>（由数字和字母组成6-16个字符）</span></td>
        </tr>
	<!--<tr >
          <td align="right">昵称</td>
          <td><input type="text" name="nickname" id="nick_name" value="" size="16" />（由4-10个字符组成）</td>
          <td>&nbsp;</td>
        </tr>-->
    <tr> 
         <td class="left" width="100">奖金限额</td>
          <td class="right">&nbsp;<input type="text" name="limit" id="limit" value="" size="16" />
          <input type="hidden" name="limit" id="limit" value=""  />( 范围 0 ~  )</td>
        </tr>
                      
      </table>
        </div> 
      <div class="levelitem">
	  
	  <TABLE width="100%" border=1 align=center cellPadding=0 cellSpacing=0 borderColorLight=#cccccc borderColorDark=#fbfbfb>
              <tr id="ssc">
                <td colspan="4" height="40" align="left" vAlign=middle bgColor=#F3F3F3> &nbsp; <strong>时时彩(重庆|江西|黑龙江|新疆彩)</strong></td>
              </tr>
              <tr class="repeatAltTemplate">
                <td width="20%" height="40" align="center" valign="middle" bgcolor="#F3F3F3">名称</td>
                <td align="center" valign="middle"> 1700模式</td>
                <td align="center" valign="middle"> 1800模式</td>
                <td align="center" valign="middle"> 1900模式</td>
              </tr>
              <tr class="repeatItemTemplate">
                <td height="10" align="center" bgcolor="#F3F3F3" style="line-height: 40px"> 统一奖金与返点值</td>
                <td align="left"> 返点:
                  <input name="rate_A1" type="text" value="0" id="Add_sscFd" style="width:50px;" />
                  %(范围0~) <span id="Add_rsscTy" style="color:Red;display:none;">返点范围不符</span> </td>
                <td align="left"> 返点:
                  <input name="rate_B1" type="text" value="0" id="Add_jsscFd" style="width:50px;" />
                  %(范围0~%)<span id="Add_jrsscTy" style="color:Red;display:none;">返点范围不符</span> </td>
                <td align="left"> 返点:
                  <input name="rate_C1" type="text" value="0" id="Add_jjsscFd" style="width:50px;" />
                  %(范围0~%)<span id="Add_jjrsscTy" style="color:Red;display:none;">返点范围不符</span></td>
              </tr>
              <tr class="repeatAltTemplate">
                <td height="40" align="center" bgcolor="#F3F3F3" style="line-height: 40px"> 不定位</td>
                <td align="left"> 返点:
                  <input name="rate_A2" type="text" value="0" id="Add_sscBdw" style="width:50px;" />
                  (范围:0~%)<span id="Add_rsscBdw" style="color:Red;display:none;">返点范围不符</span></td>
                <td align="left"> 返点:
                  <input name="rate_B2" type="text" value="0" id="Add_jsscBdw" style="width:50px;" />
                  (范围:0~%)<span id="Add_jrsscBdw" style="color:Red;display:none;">返点范围不符</span>&nbsp; </td>
                <td align="left"> 返点:
                  <input name="rate_C2" type="text" value="0" id="Add_jjsscBdw" style="width:50px;" />
                  (范围:0~%)<span id="Add_jjrsscBdw" style="color:Red;display:none;">返点范围不符</span>&nbsp; </td>
              </tr>
        </table>
	  
	  </div>





                 <div class="levelitem">
				 
				 <TABLE width="100%" border=1 align=center cellPadding=0 cellSpacing=0 borderColorLight=#cccccc borderColorDark=#fbfbfb>
              <tr id="fsd">
                <td height="40" colspan="4" align="left" bgcolor="#F3F3F3" class="biaoshi">&nbsp;<strong> 福彩3D|排列三</strong></td>
              </tr>
              <tr class="repeatAltTemplate">
                <td width="20%" height="40" align="center" valign="middle" bgcolor="#F3F3F3">名称</td>
                <td height="40" align="center" valign="middle" bgcolor="#F3F3F3"> 1700模式</td>
                <td height="40" colspan="1" align="center" valign="middle" bgcolor="#F3F3F3"> 1800模式</td>
                <td height="40" align="center" valign="middle" bgcolor="#F3F3F3"> 1900模式</td>
              </tr>
              <tr class="repeatItemTemplate">
                <td align="center" bgcolor="#F3F3F3" style="line-height: 40px"> 统一奖金与返点值</td>
                <td align="left"> 返点:
                  <input name="rate_A3" type="text" value="0" id="Add_fsdTy" style="width:50px;" />
                  %(范围0~%)<span id="Add_rFsd" style="color:Red;display:none;">返点范围不符</span> </td>
                <td align="left"> 返点:
                  <input name="rate_B3" type="text" value="0" id="Add_jfsdTy" style="width:50px;" />
                  %(范围0~%)<span id="Add_jrFsd" style="color:Red;display:none;">返点范围不符</span> </td>
                <td align="left"> 返点:
                  <input name="rate_C3" type="text" value="0" id="Add_jjfsdTy" style="width:50px;" />
                  %(范围0~%)<span id="Add_jjrFsd" style="color:Red;display:none;">返点范围不符</span></td>
              </tr>
              <tr class="repeatAltTemplate">
                <td align="center" bgcolor="#F3F3F3" style="line-height: 40px"> 不定位</td>
                <td align="left"> 返点:
                  <input name="rate_A4" type="text" value="0" id="Add_fsdBdw" style="width:50px;" />
                  (范围:0~%)<span id="Add_rfsdBdw" style="color:Red;display:none;">返点范围不符</span></td>
                <td align="left"> 返点:
                  <input name="rate_B4" type="text" value="0" id="Add_jfsdBdw" style="width:50px;" />
                  (范围:0~%)<span id="Add_jrfsdBdw" style="color:Red;display:none;">返点范围不符</span></td>
                <td align="left"> 返点:
                  <input name="rate_C4" type="text" value="0" id="Add_jjfsdBdw" style="width:50px;" />
                  (范围:0~%)<span id="Add_jjrfsdBdw" style="color:Red;display:none;">返点范围不符</span></td>
              </tr>
              <tr bgcolor="#F3F3F3" class="repeatItemTemplate">
                <td colspan="4" align="center" style="line-height: 40px; "><input id="cmdAdd2"  name="cmdAdd2" type="submit" class=but_qd style="cursor:hand" value="增 加" /></td>
              </tr>
            </table>
				 </div>
      </div>

    </form>

<iframe name="frmHidden" id="frmHidden" width="0" height="0"></iframe>
</body>
</html>