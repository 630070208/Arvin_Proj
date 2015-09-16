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
	/*校验用户输入信息
	 */
	var nicknameFlag = true;
	var mailFlag = true;
	var qqFlag = true;
	$(function() {
		var regmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;//验证邮箱格式
		var regQQ = /^[1-9]\d{4,13}$/;
		$("#nickname").blur(
				function() {
					if (this.value != "" && this.value != undefined
							&& this.value != null) {
						if (this.value.length > 6 || this.value.length < 2) {
							$("#nickname_msg").text("用户名必填且在2到6个字符之间");
							$("#nickname_msg").css("color", "red");
							nicknameFlag = false;
						} else {
							$("#nickname_msg").text("格式正确");
							$("#nickname_msg").css("color", "green");
							nicknameFlag = true;
						}
					} else {
						$("#nickname_msg").text("(由2至6个字符组成)");
						$("#nickname_msg").css("color", "#C26621");
						nicknameFlag = true;
					}
				});

		$("#mail").blur(
				function() {
					if (this.value != "" && this.value != undefined
							&& this.value != null) {
						if (regmail.test(this.value)) {
							$("#mail_msg").text("格式正确");
							$("#mail_msg").css("color", "green");
							mailFlag = true;
						} else {
							$("#mail_msg").text("请输入正确格式的邮箱地址");
							$("#mail_msg").css("color", "red");
							mailFlag = false;
						}
					} else {
						$("#mail_msg").text("(填写正确的邮箱格式)");
						$("#mail_msg").css("color", "#C26621");
						mailFlag = true;
					}
				});
		$("#qq").blur(
				function() {
					if (this.value != "" && this.value != undefined
							&& this.value != null) {
						if (regQQ.test(this.value)) {
							$("#qq_msg").text("格式正确");
							$("#qq_msg").css("color", "green");
							qqFlag = true;
						} else {
							$("#qq_msg").text("QQ格式错误");
							$("#qq_msg").css("color", "red");
							qqFlag = false;
						}
					} else {
						$("#qq_msg").text("(请填写正确的QQ号)");
						$("#qq_msg").css("color", "#C26621");
						qqFlag = true;
					}
				});
	});

	function modifyMessage() {
		var data = {
			"qq" : $("#qq_msg").val(),
			"mail" : $("#mail").val(),
			"nickname":$("#nickname").val()
		};
		if (nicknameFlag && mailFlag && qqFlag) {
			ajaxRequest("/uc/modifyMessage", data, "get", saveResult, saveFault);
		}
	}

	function saveResult(data) {
		alert(data.code);
		window.location.reload();
	}

	function saveFault(error) {
		alert(error);
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
							<h2 class="heading">
								<c:choose>
									<c:when
										test="${member !=null && member.nickname != null && member.mail != null &&member.qq != null }">
		  编辑资料
		  </c:when>
									<c:otherwise>
		   完善资料
		   </c:otherwise>
								</c:choose>
							</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="" method="get" name="search" id="modifyuserform">
									<table class="formTable">
										<tbody>
											<tr>
												<td width="90px" style="text-align: right;">用户昵称：</td>
												<td><c:choose>
														<c:when test="${member !=null && member.nickname != null}">
															<input type="text" name="nickname" id="nickname"
																value="${member.nickname}">
														</c:when>
														<c:otherwise>
															<input type="text" name="nickname" id="nickname" value="">
														</c:otherwise>
													</c:choose> <span class="red" id="nickname_msg">(由2至6个字符组成)</span></td>
											</tr>
											<tr>
												<td width="90px" style="text-align: right;">邮箱：</td>
												<td><c:choose>
														<c:when test="${member !=null && member.mail != null}">
															<input type="text" name="mail" id="mail"
																value="${member.mail}">
														</c:when>
														<c:otherwise>
															<input type="text" name="mail" id="mail" value="">
														</c:otherwise>
													</c:choose> <span class="red" id="mail_msg">(填写正确的邮箱格式)</span></td>
											</tr>
											<tr>
												<td width="90px" style="text-align: right;">QQ：</td>
												<td><c:choose>
														<c:when test="${member !=null && member.qq != null}">
															<input type="text" name="qq" id="qq_msg"
																value="${member.qq}">
														</c:when>
														<c:otherwise>
															<input type="text" name="qq" id="qq_msg" value="">
														</c:otherwise>
													</c:choose> <span class="red" id="qq_msg">(请填写正确的QQ号)</span></td>
											</tr>
											<tr class="lastTr">
												<td></td>
												<td><input type="button" class="btn" value="提交"
													onclick="modifyMessage();"></td>
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