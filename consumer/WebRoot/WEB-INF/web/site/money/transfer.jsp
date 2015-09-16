<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	var moneyFlag = false;
	var bankFlag = false;
	var usernameFlag = false;
	$(function() {
		$("#money").blur(function() {
			var reg = /(^[1-9]+(.[0-9]{1,2})?$)|(^[0-9](.[0-9]{1,2}){1}$)/;
			var val = $('#money').val();
			if (val == undefined || val == null || val == "") {
				$("#money_msg").text("请输入转账金额!");
				$("#money_msg").css("color", "red");
				moneyFlag = false;
			} else if (!reg.test(val)) {
				$("#money_msg").text("请输入正确的金额值!");
				$("#money_msg").css("color", "red");
				moneyFlag = false;
			} else if ('${userWallet.balance}' < val) {
				$("#money_msg").text("您输入的金额应小于你账户余额");
				$("#money_msg").css("color", "red");
				moneyFlag = false;
			} else {
				$("#money_msg").text("");
				$("#money_msg").css("color", "red");
				moneyFlag = true;
			}
		});

		$("#bankpwd").blur(function() {
			var val = $("#bankpwd").val();
			if (val == undefined || val == null || val == "") {
				$("#pw_msg").text("请输入资金密码!");
				$("#pw_msg").css("color", "red");
				bankFlag = false;
			} else {
				$("#pw_msg").text("");
				bankFlag = true;
			}
		});

		/*
		                        查询用户是否存在
		 */

		$("#othersyscode").blur(function() {
			var val = this.value;
			if (val == "" || val == null) {
				$("#othersyscode_msg").text("请输入账户名");
				$("#othersyscode_msg").css("color", "red");
			} else {
				var data = {
					"syscode" : val
				};
				ajaxRequest("/uc/isexits", data, "get", userResult, userFault);
			}
		});
	})

	function userResult(data) {
		if (data.code != 1) {
			$("#othersyscode_msg").text("用户名不存在");
			$("#othersyscode_msg").css("color", "red");
			usernameFlag = false;
		} else {
			$("#othersyscode_msg").text("√");
			$("#othersyscode_msg").css("color", "green");
			usernameFlag = true;
		}
	}
	function userFault(error) {
		//alert(error);
		$("#othersyscode_msg").text("用户名不存在");
		$("#othersyscode_msg").css("color", "red");
	}

	function changeMoney() {
		if (moneyFlag && bankFlag && usernameFlag) {
			var data = {
				"money" : $("#money").val(),
				"otherSyscode" : $("#othersyscode").val(),
				"bankpwd" : $("#bankpwd").val()
			};
			ajaxRequest("/uc/changeMoney", data, "get", resultHandler, faultHander);
		}
	}
	function resultHandler(data) {
		if(data.flag){
			alert(data.msg);
			$("#yue").html(data.money);
			$("#transferForm").reset(); 
		}else{
			alert(data.msg);
		}
	}

	function faultHander(error) {
		alert("转账异常");
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
					<!-- 左侧菜单开始 -->
					<jsp:include page="MoneyMenu.jsp"></jsp:include>
					<!--彩种类型-->
					<div class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">会员转账</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="" method="post" name="transferForm" id="transferForm">
									<table class="formTable">

										<tbody>
											<tr>
												<td style="width:100px">账户余额：</td>
												<td><span id="yue" style="color: red;" title="">${userWallet.balance}</span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</td>
											</tr>
											<tr>
												<td>转入账户：</td>
												<td><input type="text" name="otherBankId"
													id="othersyscode" /> <span id="othersyscode_msg"></span></td>
											</tr>
											<tr>
												<td>转账金额：</td>
												<td><input type="number" id="money" name="money" /> <span
													id="money_msg"></span></td>
											</tr>
											<tr>
												<td>资金密码：</td>
												<td><input type="password" name="bankpwd" id="bankpwd" /><span
													id="pw_msg"></span>
												</td>
											</tr>
											<tr class="lastTr">
												<td></td>
												<td><input type="button" value="转账"
													onclick="changeMoney();" class="btn" />
												</td>
											</tr>

										</tbody>
									</table>
								</form>
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