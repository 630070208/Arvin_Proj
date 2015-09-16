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
<title>账户总览</title>
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
					<!--菜单-->
					<jsp:include page="UserCenterMenu.jsp"></jsp:include>
					<!--菜单结束-->
					<div class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">账户总览</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<div class="box" style="border-radius: 0px;">
									<h1 class="box-heading"
										style="font-size: 16px;color:#333;margin-bottom: 0px;">
										个人信息</h1>
									<table class="formTable">
										<tbody>
											<tr>
												<td style="text-align: right;width: 150px">您的注册时间：</td>
												<td colspan="2"><fmt:formatDate
														value="${member.regTime.time}"
														pattern="yyyy-MM-dd HH:mm:ss" />
												</td>
											</tr>
											<tr>
												<td style="text-align: right;">最近登录时间：</td>
												<td colspan="2"><fmt:formatDate
														value="${member.lastLogTime.time}"
														pattern="yyyy-MM-dd HH:mm:ss" />
												</td>
											</tr>

										<!-- 	<tr>
												<td style="text-align: right;">充值手续费百分比：</td>
												<td colspan="2"><span style="color: red;">10.10%</span>
												</td>
											</tr>
											<tr>
												<td style="text-align: right;">提现手续费百分比：</td>
												<td colspan="2"><span style="color: red;">1.00%</span>
												</td>
											</tr> -->

										</tbody>
									</table>
							</article>
						
							<div id="top">
								<div class="inner"></div>
							</div>

							<article class="widget registration-form">
								<div class="box" style="border-radius: 0px;">
									<h1 class="box-heading"
										style="font-size: 16px;color:#333;margin-bottom: 0px;">
										资金总览</h1>

									<table class="formTable">
										<tbody>
											<tr>
												<td style="text-align: right;width: 150px">账户余额：</td>
												<td colspan="2"><span style="color: red;"> <span>${wallet.balance}</span>
												</span>
												</td>
											</tr>
											<tr>
												<td style="text-align: right;">累计充值：</td>
												<td colspan="2">
													<span style="color: red;"> 
														<c:choose>
															<c:when test="${wallet!= null && wallet.upToInpour != null}">￥${wallet.upToInpour}</c:when>
															<c:otherwise>￥0.00</c:otherwise>
														</c:choose> 
													</span>
												</td>
											</tr>

											<tr>
												<td style="text-align: right;">累计提款：</td>
												<td colspan="2">
													<span style="color: red;"> 
														<c:choose>
															<c:when test="${wallet!= null && wallet.upToDraw != null}">￥${wallet.upToDraw}</c:when>
															<c:otherwise>￥0.0000</c:otherwise>
														</c:choose>
													</span>
												</td>
											</tr>
											
											<tr>
												<td style="text-align: right;">累计消费：</td>
												<td colspan="2">
													<span style="color: red;"> 
														<c:choose>
															<c:when test="${wallet!= null && wallet.upToBuy != null}">￥${wallet.upToBuy}</c:when>
															<c:otherwise>￥0.0000</c:otherwise>
														</c:choose> 
													</span>
												</td>
											</tr>


											<tr>
												<td style="text-align: right;">累计中奖：</td>
												<td colspan="2">
													<span style="color: red;"> 
														<c:choose>
															<c:when test="${wallet!= null && wallet.upToWin != null}">￥${wallet.upToWin}</c:when>
															<c:otherwise>￥0.0000</c:otherwise>
														</c:choose> 
													</span>
												</td>
											</tr>
										</tbody>
									</table>
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