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
<title>彩金提现</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script src="site/js/usercenter/userList.js"></script>
<script type="text/javascript">
	var jinEFlag = false;
	var tiKPwdFlag = false;
	$(function() {
		if ('${bank}' != "" && '${bank}' != null) {
			var proStr = '${bank.blankAdd}'
			$("#card_holder").text("${bank.realName}");
			var strAry = proStr.split(",");
			$("#province").text(strAry[0]);
			$("#city").text(strAry[1]);
			$("#bank_name").text("${bank.bankName}");
			$("#bank_branch").text(strAry[2]);
			$("#card_number").text("${bank.bankCode}");
		}

		$("#jinE")
				.blur(
						function() {
							var reg = /(^[1-9]+(.[0-9]{1,2})?$)|(^[0-9](.[0-9]{1,2})	{1}$)/;
							if (this.value == undefined || this.value == null
									|| this.value == "") {
								$("#jinE_msg").text("请输入充值金额!");
								$("#jinE_msg").css("color", "red");
								jinEFlag = false;
							} else if (!reg.test(this.value)) {
								$("#jinE_msg").text("请输入正确的金额值!");
								$("#jinE_msg").css("color", "red");
								jinEFlag = false;
							} else if (parseFloat(this.value) < 100) {
								$("#jinE_msg").text("至少提款为100元!");
								$("#jinE_msg").css("color", "red");
								jinEFlag = false;
							} else {
								$("#jinE_msg").text("√");
								$("#jinE_msg").css("color", "green");
								jinEFlag = true;
							}
						});

		$("#pass").blur(
				function() {
					if (this.value == undefined || this.value == null
							|| this.value == "") {
						$("#pass_msg").text("密码不能为空");
						$("#pass_msg").css("color", "red");
						tiKPwdFlag = false;
					} else {
						$("#pass_msg").text("");
						$("#pass_msg").css("color", "red");
						tiKPwdFlag = true;
					}
				});

	});

	function tixian() {
		if (jinEFlag && tiKPwdFlag) {
			var data = {
				"jinE" : $("#jinE").val(),
				"pass" : $("#pass").val()
			};
			ajaxRequest("/uc/tiKuan", data, "post", sucResult);
//			window.location.reload();
		}
	}

	function sucResult(data) {
		if(data.flag == true){
			alert(data.code);
			$("#from")[0].reset();
		}else
			alert(data.code);
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
							<h2 class="heading">彩金提现</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="" method="post" name="search" id="from">
									<table class="formTable">
										<c:choose>
											<c:when test="${bank != null}">
												<tbody>
													<tr>
														<td style="width:120px">持卡人：</td>
														<td id="card_holder">李牛逼</td>
													</tr>
													<tr>
														<td>省份：</td>
														<td id="province"></td>
													</tr>
													<tr>
														<td>城市：</td>
														<td id="city"></td>
													</tr>
													<tr>
														<td>开户行：</td>
														<td id="bank_name"></td>
													</tr>
													<tr>
														<td>支行：</td>
														<td id="bank_branch"></td>
													</tr>
													<tr>
														<td>银行卡号：</td>
														<td id="card_number"></td>
													</tr>
													<tr>
														<td>提现金额(元)：</td>
														<td><input type="number" id="jinE"
															style="width: 160px" required="required" /> <span
															id="jinE_msg">(单笔提现金额不得低于￥100元)</span>
														</td>
													</tr>
													<tr>
														<td>资金密码：</td>
														<td><input type="password" id="pass"
															style="width: 160px" required="required" /><span
															id="pass_msg"></span></td>
													</tr>
													<tr class="lastTr">
														<td></td>
														<td><input type="button" value="提现"
															onclick="tixian();" class="btn" /></td>
													</tr>
												</tbody>
											</c:when>
											<c:otherwise>
												<tr>
													<td>
														<h2 class="dotTitle">
															<span class="st">·</span>业务提示
														</h2>
														<hr> 您还没绑定银行卡哟！</td>
												</tr>
												<tr class="lastTr">
													<td><input type="button" value="马上绑定"
														onclick="javascript:window.location.href='/uc/bindCardIdPage';"
														class="formWord" />
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</table>
								</form>
							</article>
						</article>
					</div>
					<div id="step2" style="display: none;"
						class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading" id="two1">充值銀行信息</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<table class="formTable">
									<tbody>
										<tr>
											<td>流水号</td>
											<td id="serial_number">123456</td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" height="50">注：1.
												一个流水号仅对应一笔充值，为了使您更快到账，请务必将完整流水号填入银行附言栏，切勿自行修改或忘记填写；
												<ul>
													<li>2. 充值未到账请务必自行联系优游娱乐在线客服，切勿将汇款信息透漏给他人，
														若因信息保管不善造成损失，平台不承担任何责任；</li>
													<li>3.
														（附言栏）不能填写除流水号之外的其他信息，更不能填写和"时时彩"相关的任何内容，如有违规操作，立即封号处理。</li>
												</ul></td>
										</tr>
										<tr>
											<td>开户行：</td>
											<td id="bank_name">招商银行</td>
										</tr>
										<tr>
											<td>开户人：</td>
											<td id="bank_holder">袁世凯</td>
										</tr>
										<tr>
											<td>汇款邮箱</td>
											<td id="e_mail">yuanshikai@123.net</td>
										</tr>
										<tr>
											<td>充值金额：</td>
											<td><input id="amount" value="100.2" type="text"
												readonly="readonly"></td>
										</tr>
										<tr>
											<td></td>
											<td><input type="button" class="formWord" value="进入网银"
												onclick="openBankPage()">
											</td>
										</tr>
									</tbody>
								</table>
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