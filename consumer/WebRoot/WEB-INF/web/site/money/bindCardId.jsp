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
<title>充值提现</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script src="/site/js/usercenter/bindCardId.js"></script>
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
							<h2 class="heading">绑定银行卡</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
									<table class="formTable">
										<c:if test="${bank == null}">
										<form action="" method="post" id="addBankCardform">
											<tbody>
												<tr>
													<td style="width:130px" align="right" class="narrow-label"
														style="color:#FF3300">提示:</td>
													<td align="left" style="color:#FF3300" colspan="2">*为必填信息,银行卡绑定后需要删除或者解绑请提供充值截图,联系您的上级,由上级提交平台申请解绑！
													</td>
												</tr>
												<tr>
													<td><font style="color:#FF3300;font-size:18px;">*</font>开户银行:</td>
													<td style="width: 190px;" align="left"><select
														name="bankName" id="bank" style="width:171px;">
															<option value="">请选择...</option>
													</select>
													</td>
													<td><span id="bank_msg" style="color:#ff3300"></span>
													</td>
												</tr>

												<tr>
													<td align="right" class="narrow-label"><font
														style="color:#FF3300;font-size:18px;font-family:Arial,Helvetica,sans-serif;">*</font>开户银行省份:</td>

													<td style="width: 190px;" align="left"><select
														name="province" id="province" style="width:171px;"></select>
													</td>
													<td><span style="color:red;" id="province_msg"></span>
													</td>
												</tr>
												<tr>
													<td align="right" class="narrow-label"><font
														style="color:#FF3300;font-size:18px;font-family:Arial,Helvetica,sans-serif;">*</font>开户银行城市:</td>
													<td style="width: 190px;" align="left"><select
														name="city" id="city" style="width:171px;">
															<option value="">请选择</option>
													</select></td>
													<td><span style="color:red;" id="city_msg"></span>
													</td>
												</tr>

												<tr>
													<td align="right" class="narrow-label"><font
														style="color:#FF3300;font-size:18px;font-family:Arial,Helvetica,sans-serif;">*</font>支行名称:</td>
													<td style="width: 190px;" align="left"><input
														type="text" name="branch" maxlength="20" id="branch">
													</td>
													<td><span id="branch_msg">(由1至20个字符或汉字组成，不能使用特殊字符)</span>
													</td>
												</tr>
												<tr>
													<td align="right" class="narrow-label"><font
														style="color:#FF3300;font-size:18px;font-family:Arial,Helvetica,sans-serif;">*</font><span
														id="khxm">开户人姓名</span>:</td>
													<td style="width: 190px;" align="left"><input
														type="text" name="realName" maxlength="10"
														id="account_name" onkeyup="exceptSpecialName(this);"
														onchange="exceptSpecialName(this);"></td>
													<td><span id="account_name_msg">(请填写您的真实姓名，只能是中文字符)</span>
													</td>
												</tr>
												<tr>
													<td align="right" class="narrow-label"><font
														style="color:#FF3300;font-size:18px;font-family:Arial,Helvetica,sans-serif;">*</font><span
														id="khzh">银行卡号</span>:</td>
													<td style="width: 190px;" align="left"><input
														type="text" name="bankCode" id="account"
														style="width:171px;"></td>
													<td><span id="account_msg">(银行卡卡号由16位或19位数字组成)</span>
													</td>
												</tr>
												<tr>
													<td align="right" class="narrow-label"><font
														style="color:#FF3300;font-size:18px;font-family:Arial,Helvetica,sans-serif;">*</font>确认账号:</td>
													<td style="width: 190px;" align="left"><input
														type="text" name="account_again" id="account_again"
														onpaste="return false" style="width:171px;"></td>
													<td><span id="account_again_msg">(银行账号只能手动输入，不能粘贴)</span>
													</td>
												</tr>
												<tr class="lastTr">
													<td align="right"></td>
													<td align="left"><input type="button"
														onclick="subSaveBank();" value="提交" class="btn"></td>
													<td align="right"></td>
												</tr>
											</tbody>
											</form>
										</c:if>
										<c:if test="${bank != null}">
											<tbody>
												<tr>
													<td style="width:130px" align="right" class="narrow-label"
														style="color:#FF3300">提示:</td>
													<td align="left" style="color:#FF3300" colspan="2">银行卡绑定后需要删除或者解绑请提供充值截图,联系您的上级,由上级提交平台申请解绑！不便之处请谅解
													</td>
												</tr>
												<tr >
													<td align="left" class="narrow-label">开户行:</td>
													<td align="left">
														<span>${bank.blankAdd }</span>
													</td>
												</tr>
												<tr>
													<td align="left" class="narrow-label">
														<span>开户人姓名</span>:
													</td>
													<td>
														<input value="${bank.realName}" readonly>
													</td>
												</tr>
												<tr>
													<td align="left" class="narrow-label">
														<span>银行卡号</span>:
													</td>
													<td>
														<input value="${bank.bankCode}" readonly>
													</td>
												</tr>
											</tbody>
										</c:if>
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