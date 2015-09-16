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
<title>查看站内信</title>
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
					<jsp:include page="MsgBoxMenu.jsp"></jsp:include>
					<!-- 左侧菜单结束 -->
					<!-- 右侧内容面板开始 -->
					<div id="column-primary" class="stack gutter-col size4of5">
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="" method="post" name="search">
									<table class="formTable">
										<tbody>
											<tr>
												<td style="width:90px"><c:choose>
														<c:when test="${flag}">
				               收件人
				   </c:when>
														<c:otherwise>
				              发件人: 
				   </c:otherwise>
													</c:choose>
												</td>
												<td>
												<c:choose>
													<c:when test="${flag}">
													 ${userMessage.sandName}
												   </c:when>
													<c:otherwise>
												     	   系统管理员
			   										</c:otherwise>
												</c:choose></td>
											</tr>
											<tr>
												<td style="width:70px">主题:</td>
												<td>${userMessage.title}</td>
											</tr>
											<tr>
												<td style="width:70px">正文:</td>
												<td><textarea rows="10" style="width:80%"
														readonly="readonly">${userMessage.content}</textarea>
												</td>
											</tr>
											<tr>
												<td style="width:70px">发件时间:</td>
												<td><fmt:formatDate value="${userMessage.time.time}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
											</tr>
											<tr class="lastTr">
												<td></td>
												<td><c:choose>
														<c:when test="${flag}">
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose> 
													<input type="button" onclick="window.history.go(-1);" value="返回" class="btn" />
												</td>
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