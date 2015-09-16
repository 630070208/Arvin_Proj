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
<script src="/site/js/money/recharge.js"></script>
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
							<h2 class="heading">在线充值</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="" method="post" id="rechargeForm">
									<table class="formTable">
										<tbody>
											<tr>
												<td style="text-align: right;">充值金额：</td>
												<td><input id="rechargeNum" name="money" value="100"
													class="field invalid" type="number" style="width: 288px"
													required="required" /><span class="red">（单笔充值上限：￥50,000.00元
														单笔充值下限：￥10.00元）</span></td>
											</tr>
											<tr>
												<td style="text-align: right;vertical-align: middle;">选择银行：</td>
												<td><select id="bankSelector" style="width: 288px" name="bankCode" 
													class="field invalid"></select></td>
											</tr>
											<tr class="lastTr">
												<td></td>
												<td><input style="width: 70px" type="button" value="充值"
													class="btn" onClick="goStep2()" /></td>
											</tr>
										</tbody>
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
											<td>支付宝唯一标识：</td>
											<td id="serial_number"></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" height="50">注：1.
												一个标识仅对应一个账户充值充值，为了使您更快到账，请务必将正确的标识号填入附言栏，切勿自行修改或忘记填写；
												<ul>
													<li>2. 充值未到账请务必自行联系在线客服，切勿将汇款信息透漏给他人，
														若因信息保管不善造成损失，平台不承担任何责任；</li>
													<li>3.
														（附言栏）不能填写除支付宝唯一标识之外的其他信息，更不能填写和"时时彩"相关的任何内容，如有违规操作，立即封号处理。</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>开户人：</td>
											<td id="bank_name"></td>
										</tr>
										<tr>
											<td>开户号：</td>
											<td id="bank_holder"></td>
										</tr>
										
										<tr>
											<td>充值金额：</td>
											<td  id="amount"></td>
										</tr>
										<tr>
											<td id="rechargeType"></td>
											<td><input type="button" class="formWord" value="进入网银"
												onclick="openBankPage()"></td>
										</tr>
									</tbody>
								</table>
							</article>
						</article>
					</div>
				</div>
				<!-- 右侧内容面板结束 -->
				<form action="" method="post" id="zf" name="zf">
					<input type="hidden" id="zfmoney" name="money">
					<input type="hidden" id="zfbankCode" name="bankCode">
				</form>
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>