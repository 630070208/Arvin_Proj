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
<title>用户配额</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
</head>
<body>
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
							<h2 class="heading">用户配额</h2>
						</div>

						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">

								<form action="/uc/registeredQuotaPage" method="post" id="form"
									style="height:auto;">
<!-- 									<table -->
<!-- 										class="bingo-game-chooser-table table-decoration-7 color-theme-4"> -->
<!-- 										<tbody> -->
<!-- 										</tbody> -->
<!-- 									</table> -->

									<table
										class="bingo-game-chooser-table table-decoration-7 color-theme-4">
										<thead>
											<tr>
												<th>
													<div class="title">
														<span>起始点数</span>
													</div>
												</th>
												<th>
													<div class="title">
														<span>截止点数</span>
													</div>
												</th>
												<th>
													<div class="title">
														<span>额度 </span>
													</div>
												</th>
												<th>
													<div class="title">
														<span>已试用数</span>
													</div>
												</th>
											</tr>
										</thead>
										<c:if test="${not empty page.result}">
											<c:forEach var="item" items="${page.result}">
												<tr>
													<td><strong>${item.quotConf.start}</strong></td>
													<td>${item.quotConf.termi}</td>
													<td>${item.quotConf.quota }</td>
													<td>${item.number}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${page!=null}">
											<tr>
												<td colspan="4" height="20">
													<table border="0" width="100%" cellpadding="0"
														cellspacing="0">
														<tr>
															<td align="left"><input type="hidden" id="pageNo"
																name="pageNo" value="1" /> <jsp:include
																	page="../../common/frontpager.jsp" /></td>
														</tr>
													</table></td>
											</tr>
										</c:if>
										<c:if test="${page == null}">
											<tr>
												<td colspan="4">没有记录！</td>
											</tr>

										</c:if>
									</table>
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