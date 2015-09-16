<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie67 ie678 ie6789" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie67 ie678 ie6789 ie7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie678 ie6789 ie8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie6789 ie9" lang="en"><![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
  <!--<![endif]-->
<head>
<title>会员注册</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script src="/site/js/usercenter/RebateUtil.js"></script>

<script type="text/javascript">
  var userFlag = false;
  var pwdFlag = false;
  var repwdFlag = false;
  function checkUser(v){
	  if(v.length >16 || v.length<6){
		  $("#userchk").text("由字母和数字组成6-16个字符");
		  $("#userchk").css("color","red");
		  userFlag = false;
	  }else{
		  $("#userchk").text("");
		  userFlag = true;
	  }
  }

  function checkpwd(v){
	  if(v.length >16 || v.length<6){
		  $("#pwdchk").text("由字母和数字组成6-16个字符");
		  $("#pwdchk").css("color","red");
		  pwdFlag = false;
	  }else{
		  $("#pwdchk").text("");
		  pwdFlag = true;
	  }
  }
  
  function checkrepwd(t){
	  
	  if($("#userpass").val() != t){
		  repwdFlag = false;
		  $("#repwdchk").text("两次输入密码不一样");
		  $("#repwdchk").css("color","red");
	  }else{
		  $("#repwdchk").text("");
		  repwdFlag = true;
	  }
  }
  
  
  
  function saveUser(){
	  
	  if(userFlag&&pwdFlag&&repwdFlag){
		  var data = {};
		  data.userName = $("#userName").val();
		  data.pwd= $("#reuserpass").val();
		  data.linkId = $("#linkId").val();
		  ajaxRequest("/linkregisterAction", data, "post", sucResult);
	  }
	 
  }
  
  function sucResult(data){
	  if(data.code == "0"){
		  alert(data.msg);
	  }else{
		  window.location.href="/login";
	  }
	  
  }
</script>
</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<div id="content">
			<div id="top">
				<div class="inner"></div>
			</div>
			<div id="main" role="main">
				<div class="main-container">
					<!-- 左侧菜单开始 -->
					<!--彩种类型-->
					<div id="column-primary" class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">会员注册</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="" method="post" id="createUserForm"
									style="height:auto;">
								 <input
										type="hidden"  id="linkId" value="${linkId }" />
									<div
										style="margin-left:12px;margin-right:12px;margin-top:12px;">
										<table class="formTable">
											<tbody>
												<tr>
													<td style="text-align: right;">用户名：</td>
													<td colspan="2">
														<input type="text" id="userName" class="field invalid" style="width:260px"
														name="userName" onblur="checkUser(this.value)"  /> <span class="red">(由字母或数字组成的6-16个字符)</span>
														<p id="userchk"></p>
													</td>
												</tr>
												<tr>
													<td style="text-align: right;">密码：</td>
													<td colspan="2"><input type="password" name="userpass" class="field invalid" style="width:260px"
														id="userpass" onblur = "checkpwd(this.value)" />
														<span class="red">(由字母和数字组成6-16个字符)</span>
														<p id="pwdchk"></p>
													</td>
												</tr>
												
												<tr>
													<td  style="text-align: right;">确认密码：</td> 
													<td><input type="password" name="userpass" class="field invalid" style="width:260px"
														id="reuserpass"  onblur = "checkrepwd(this.value)" />
														<p id="repwdchk"></p>
												</tr>
												<tr class="lastTr">
													<td></td>
													<td><input type="button" class="btn" value="提交注册"
														onclick="saveUser()">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</form>
							</article>
							<div id="top">
								<div class="inner"></div>
							</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>