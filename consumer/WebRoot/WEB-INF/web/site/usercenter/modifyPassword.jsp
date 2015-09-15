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
<title>个人中心</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script type="text/javascript">
	/*修改登录密码
	 */

	function savePassword() {
		var val = $("#oldpass").val();
		if (val == undefined || val == null || val == "") {
			alert("旧登陆密码必填");
			return;
		}
		val = $("#newpass").val();
		if (val == undefined || val == null || val == "") {
			alert("新登陆密码必填");
			return;
		}

		if (val.length < 6) {
			alert("密码长度必须大于等于6位!");
			return;
		}

		var ps2 = $("#confirm_newpass").val();
		if (val != ps2) {
			alert("俩次登录密码输入不相等");
			return;
		}
		var data = $("#updatePasswordForm").serialize();
		ajaxRequest("/uc/updatePasswordForm", data, "post",
				onSavePasswordResult, onSaveFault);
	}

	function onSavePasswordResult(data) {
		alert(data.code);
	}
	function onSaveFault(error) {
		alert(error);
	}

	/*
	 修改资金密码
	 */
	function saveWithdrawPassword() {
		var val = $("#oldWdPass").val();
		if (val == undefined || val == null || val == "") {
			alert("旧资金密码必填");
			return;
		}
		val = $("#newWdPass").val();
		if (val == undefined || val == null || val == "") {
			alert("新资金密码必填");
			return;
		}

		if (val.length < 6) {
			alert("资金密码长度必须大于等于6位!");
			return;
		}

		var ps2 = $("#confirm_newWdPass").val();
		if (val != ps2) {
			alert("俩次资金密码输入不相等");
			return;
		}
		var data = $("#updateWithdrawPasswrodForm").serialize();
		ajaxRequest("/uc/saveWithdrawPasswrod", data,
				"post", onUpdateWithdrawPasswordResult, onSaveFault);
	}

	function onUpdateWithdrawPasswordResult(data) {
		if (data.code == 1) {
			alert("资金密码成功修改!");
			window.location.reload();
		}else{
			alert(data.message);
		}
	}

	function saveTiKuanPass() {
		val = $("#withdrawPassword").val();
		if (val == undefined || val == null || val == "") {
			alert("资金密码必填");
			return;
		}

		if (val.length < 6) {
			alert("资金密码长度必须大于等于6位!");
			return;
		}
		var data = $("#updateWithdrawPasswrodForm").serialize();
		ajaxRequest("/uc/saveWithdrawPasswrod", data, "post",
				onSaveWithdrawPasswordResult, onSaveFault);
	}

	function onSaveWithdrawPasswordResult(data) {
		if(data.code==0){
			alert(data.message);
		}else{
			alert("资金密码设置成功!");
		}
		window.location.reload();

	}
</script>
</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<jsp:include page="../common/WerHeader.jsp"></jsp:include>
		<div id="content">
			<div id="top">
				<div class="inner"></div>
			</div>

			<div id="main" role="main">

				<div class="main-container">
					<!--菜单-->
					<jsp:include page="UserCenterMenu.jsp"></jsp:include>
					<!--菜单结束-->
					<div class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">修改密码</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<div class="box" style="border-radius: 0px;">
									<h1 class="box-heading"
										style="font-size: 16px;color:#333;margin-bottom: 0px;">修改登录密码</h1>

									<form action="" method="get" id="updatePasswordForm">
										<table class="formTable">
											<tr>
												<td width="20%">输入旧登陆密码：</td>
												<td><input name="oldpass" id="oldpass" type="password"
													class="password" />
												</td>
											</tr>
											<tr>
												<td>输入新登陆密码：</td>
												<td><input name="newpass" id="newpass" type="password"
													class="password" /><span class="red">（由字母和数字组成6-16个字符）
												</span>
												</td>
											</tr>
											<tr>
												<td>确认新登陆密码：</td>
												<td><input name="confirm_newpass" id="confirm_newpass"
													type="password" class="password" />
												</td>
											</tr>
											<tr class="lastTr">
												<td></td>
												<td><input type="button" class="btn"
													value="保存登录密码" onclick="savePassword()">
												</td>
											</tr>
										</table>
									</form>
								</div>
							</article>
						</article>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<div class="box" style="border-radius: 0px;">
									<h1 class="box-heading"
										style="font-size: 16px;color:#333;margin-bottom: 0px;">设置资金密码</h1>
									<form action="" method="get" id="updateWithdrawPasswrodForm">
										<c:if test="${hasWithdrawPassword==false}">
											<table class="formTable">
												<tr>
													<td width="20%">输入资金密码：</td>
													<td><input name="withdrawPassword"
														id="withdrawPassword" type="password" class="password" />
													</td>
												</tr>
												<tr class="lastTr">
													<td></td>
													<td><input type="button" class="btn"
														value="保存资金密码" onclick="saveTiKuanPass()">
													</td>
												</tr>
											</table>
										</c:if>
										<c:if test="${hasWithdrawPassword==true}">
											<table class="formTable">
												<tr>
													<td width="20%">输入旧资金密码：</td>
													<td><input name="oldWdPass" id="oldWdPass"
														type="password" class="password" />
													</td>
												</tr>
												<tr>
													<td>输入新资金密码：</td>
													<td><input name="newWdPass" id="newWdPass"
														type="password" class="password" /><span class="red">（由字母和数字组成6-16个字符）
													</span>
													</td>
												</tr>
												<tr>
													<td>确认新资金密码：</td>
													<td><input name="confirm_newWdPass"
														id="confirm_newWdPass" type="password" class="password" />
													</td>
												</tr>
												<tr class="lastTr">
													<td></td>
													<td><input type="button" class="btn"
														value="保存资金密码" onclick="saveWithdrawPassword()">
													</td>
												</tr>
											</table>
										</c:if>
									</form>
								</div>
							</article>
						</article>
					</div>
				</div>
				<!-- 右侧内容面板结束 -->
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>