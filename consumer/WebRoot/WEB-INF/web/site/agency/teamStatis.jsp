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
<title>会员管理</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
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
			<jsp:include page="AgencyMenu.jsp"></jsp:include>
			<!--彩种类型-->
			<div id="column-primary" class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">团队预览</h2>
						</div>

						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="" method="post" id="createUserForm"
									<div style="margin-left:12px;margin-right:12px;margin-top:12px;">
										<label>账户类型：${member.userType }</label>
										<label>最高返点：${member.rebate }</label>
										<label>团队余额：${teamMoney}</label>
										<label>直属下级：${zcount}</label>
										<label>所有下级：${allCount}</label>
									</div>
								</form>
							</article>
						</article>
					</div>
					<!-- 右侧内容面板结束 -->
				</div>
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>