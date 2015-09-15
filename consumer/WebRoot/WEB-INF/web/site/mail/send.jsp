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
<title>写信息</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script type="text/javascript">
	function toSaveMsg() {

		if (confirm("确认发送？")) {

			var data = $("#sendContent").serialize();
			ajaxRequest("/send/saveSendMsg", data, "post", sucResult);
		}
	}

	function sucResult(data) {
		alert(data.code);
		window.location.reload();
		$("#titleMsg").val("");
		$("#contentMsg").val("");
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
					<jsp:include page="MsgBoxMenu.jsp"></jsp:include>
					<!-- 左侧菜单结束 -->
					<!-- 右侧内容面板开始 -->
					<div id="column-primary" class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">发送信息</h2>
						</div>

						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="/send/saveSendMsg" method="post" id="sendContent"
									name="search">
									<table class="formTable">
										<tbody>
											<tr>
												<td style="width:70px;text-align: right;">收件人:</td>
												<td>管理员</td>
											</tr>
											<tr>
												<td style="width:70px;text-align: right;">主题:</td>
												<td><input type="text" name="title" style="width:518px"
													id="titleMsg" required="required" class="field invalid" />
												</td>
											</tr>
											<tr>
												<td style="width:70px;text-align: right;">正文:</td>
												<td><textarea rows="10" style="width:515px"
														name="content" id="contentMsg" required="required"></textarea>
												</td>
											</tr>
											<tr class="lastTr">
												<td></td>
												<td>
													<button class="btn" onclick="toSaveMsg();">发 送</button></td>
											</tr>
										</tbody>
									</table>
								</form>
							</article>
						</article>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>